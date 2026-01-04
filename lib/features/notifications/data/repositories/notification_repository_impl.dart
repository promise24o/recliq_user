import 'package:dartz/dartz.dart';
import '../../domain/entities/notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/notification_remote_data_source.dart';
import '../datasources/notification_local_data_source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;
  final NotificationLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NotificationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NotificationListResponse>> getNotifications({
    String? category,
    String? type,
    bool unreadOnly = false,
    int limit = 20,
    int offset = 0,
    bool forceRefresh = false,
  }) async {
    // Try to get cached data first (unless force refresh)
    if (!forceRefresh) {
      try {
        print('🗂️ Checking cache for notifications...');
        final cachedNotifications =
            await localDataSource.getCachedNotifications();
        final isExpired = await localDataSource.isCacheExpired();

        print(
            '🗂️ Cache check: ${cachedNotifications.length} notifications, expired: $isExpired');

        if (cachedNotifications.isNotEmpty && !isExpired) {
          final cachedUnreadCount =
              await localDataSource.getCachedUnreadCount();
          print(
              '🗂️ Using cached data: ${cachedNotifications.length} notifications, count: $cachedUnreadCount');
          return Right(NotificationListResponse(
            notifications:
                cachedNotifications.map((n) => n.toDomain()).toList(),
            unreadCount: cachedUnreadCount,
            hasMore: cachedNotifications.length >= limit,
            total: cachedNotifications.length,
          ));
        } else {
          print('🗂️ Cache empty or expired, fetching from network...');
        }
      } catch (e) {
        print('🗂️ Cache error: $e, fetching from network...');
      }
    } else {
      print('🗂️ Force refresh requested, skipping cache...');
    }

    // Fetch from network if no cache or force refresh
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getNotifications(
          category: category,
          type: type,
          unreadOnly: unreadOnly,
          limit: limit,
          offset: offset,
        );

        // Cache the fresh data
        print(
            '💾 Caching ${result.notifications.length} notifications and count: ${result.unreadCount}');
        await localDataSource.cacheNotifications(result.notifications);
        await localDataSource.cacheUnreadCount(result.unreadCount);
        print('💾 Cache saved successfully');

        return Right(NotificationListResponse(
          notifications: result.notifications.map((n) => n.toDomain()).toList(),
          unreadCount: result.unreadCount,
          hasMore: result.hasMore,
          total: result.total,
        ));
      } catch (e) {
        return Left(const ServerFailure());
      }
    } else {
      return Left(const NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> markNotificationAsRead(
      String notificationId) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.markNotificationAsRead(notificationId);
        return const Right(null);
      } catch (e) {
        return Left(const ServerFailure());
      }
    } else {
      return Left(const NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> markAllNotificationsAsRead() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.markAllNotificationsAsRead();
        return const Right(null);
      } catch (e) {
        return Left(const ServerFailure());
      }
    } else {
      return Left(const NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UnreadCountResponse>> getUnreadCount({
    bool forceRefresh = false,
  }) async {
    // Try to get cached count first (unless force refresh)
    if (!forceRefresh) {
      try {
        final cachedCount = await localDataSource.getCachedUnreadCount();
        final isExpired = await localDataSource.isCacheExpired();

        if (!isExpired) {
          return Right(UnreadCountResponse(unreadCount: cachedCount));
        }
      } catch (e) {
        // Continue with network request if cache fails
      }
    }

    // Fetch from network if no cache or force refresh
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getUnreadCount();

        // Cache the fresh count
        await localDataSource.cacheUnreadCount(result.unreadCount);

        return Right(UnreadCountResponse(unreadCount: result.unreadCount));
      } catch (e) {
        return Left(const ServerFailure());
      }
    } else {
      return Left(const NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> seedNotifications() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.seedNotifications();
        return const Right(null);
      } catch (e) {
        return Left(const ServerFailure());
      }
    } else {
      return Left(const NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(const CacheFailure());
    }
  }
}
