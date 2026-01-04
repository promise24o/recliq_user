import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationListResponse>> getNotifications({
    String? category,
    String? type,
    bool unreadOnly = false,
    int limit = 20,
    int offset = 0,
    bool forceRefresh = false,
  });

  Future<Either<Failure, void>> markNotificationAsRead(String notificationId);

  Future<Either<Failure, void>> markAllNotificationsAsRead();

  Future<Either<Failure, UnreadCountResponse>> getUnreadCount({
    bool forceRefresh = false,
  });

  Future<Either<Failure, void>> seedNotifications();

  Future<Either<Failure, void>> clearCache();
}
