import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    required String title,
    required String body,
    required String category,
    required String type,
    required bool isRead,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'readAt') DateTime? readAt,
    Map<String, dynamic>? metadata,
    String? priority,
    String? actionUrl,
    String? actionText,
    String? imageUrl,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

@freezed
class NotificationListResponse with _$NotificationListResponse {
  const factory NotificationListResponse({
    required List<Notification> notifications,
    @JsonKey(name: 'unreadCount') required int unreadCount,
    @JsonKey(name: 'hasMore') required bool hasMore,
    required int total,
  }) = _NotificationListResponse;

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);
}

@freezed
class UnreadCountResponse with _$UnreadCountResponse {
  const factory UnreadCountResponse({
    @JsonKey(name: 'unreadCount') required int unreadCount,
  }) = _UnreadCountResponse;

  factory UnreadCountResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountResponseFromJson(json);
}
