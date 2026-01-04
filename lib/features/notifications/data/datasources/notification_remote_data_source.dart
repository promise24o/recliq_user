import 'package:dio/dio.dart';
import '../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationListResponseModel> getNotifications({
    String? category,
    String? type,
    bool unreadOnly = false,
    int limit = 20,
    int offset = 0,
  });

  Future<void> markNotificationAsRead(String notificationId);

  Future<void> markAllNotificationsAsRead();

  Future<UnreadCountResponseModel> getUnreadCount();

  Future<void> seedNotifications();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final Dio dio;

  NotificationRemoteDataSourceImpl({required this.dio});

  @override
  Future<NotificationListResponseModel> getNotifications({
    String? category,
    String? type,
    bool unreadOnly = false,
    int limit = 20,
    int offset = 0,
  }) async {
    final queryParams = <String, dynamic>{
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    if (category != null && category.isNotEmpty) {
      queryParams['category'] = category;
    }
    if (type != null && type.isNotEmpty) {
      queryParams['type'] = type;
    }
    if (unreadOnly) {
      queryParams['unreadOnly'] = 'true';
    }

    print('🔍 API Request params: $queryParams');

    final response = await dio.get(
      '/notifications',
      queryParameters: queryParams,
    );

    return NotificationListResponseModel.fromJson(response.data);
  }

  @override
  Future<void> markNotificationAsRead(String notificationId) async {
    await dio.post(
      '/notifications/mark-read',
      data: {'notificationId': notificationId},
    );
  }

  @override
  Future<void> markAllNotificationsAsRead() async {
    await dio.post(
      '/notifications/mark-all-read',
      data: {'markAll': true},
    );
  }

  @override
  Future<UnreadCountResponseModel> getUnreadCount() async {
    final response = await dio.get('/notifications/unread-count');
    return UnreadCountResponseModel.fromJson(response.data);
  }

  @override
  Future<void> seedNotifications() async {
    await dio.post('/auth/notifications/seed');
  }
}
