import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/notification.dart' as notification_model;

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  final String id;
  final String title;
  @JsonKey(name: 'message')
  final String body;
  final String category;
  final String type;
  @JsonKey(name: 'read')
  final bool isRead;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @JsonKey(name: 'readAt')
  final DateTime? readAt;
  final Map<String, dynamic>? metadata;
  final String? priority;
  final String? actionUrl;
  final String? actionText;
  final String? imageUrl;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.category,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.readAt,
    this.metadata,
    this.priority,
    this.actionUrl,
    this.actionText,
    this.imageUrl,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  notification_model.Notification toDomain() {
    return notification_model.Notification(
      id: id,
      title: title,
      body: body,
      category: category,
      type: type,
      isRead: isRead,
      createdAt: createdAt,
      readAt: readAt,
      metadata: metadata,
      priority: priority,
      actionUrl: actionUrl,
      actionText: actionText,
      imageUrl: imageUrl,
    );
  }

  factory NotificationModel.fromDomain(
      notification_model.Notification notification) {
    return NotificationModel(
      id: notification.id,
      title: notification.title,
      body: notification.body,
      category: notification.category,
      type: notification.type,
      isRead: notification.isRead,
      createdAt: notification.createdAt,
      readAt: notification.readAt,
      metadata: notification.metadata,
      priority: notification.priority,
      actionUrl: notification.actionUrl,
      actionText: notification.actionText,
      imageUrl: notification.imageUrl,
    );
  }
}

@JsonSerializable()
class NotificationListResponseModel {
  final List<NotificationModel> notifications;
  @JsonKey(name: 'unreadCount')
  final int unreadCount;
  @JsonKey(name: 'hasMore')
  final bool hasMore;
  final int total;

  const NotificationListResponseModel({
    required this.notifications,
    required this.unreadCount,
    required this.hasMore,
    required this.total,
  });

  factory NotificationListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationListResponseModelToJson(this);

  notification_model.NotificationListResponse toDomain() {
    return notification_model.NotificationListResponse(
      notifications: notifications.map((n) => n.toDomain()).toList(),
      unreadCount: unreadCount,
      hasMore: hasMore,
      total: total,
    );
  }
}

@JsonSerializable()
class UnreadCountResponseModel {
  @JsonKey(name: 'count')
  final int unreadCount;

  const UnreadCountResponseModel({
    required this.unreadCount,
  });

  factory UnreadCountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UnreadCountResponseModelToJson(this);

  notification_model.UnreadCountResponse toDomain() {
    return notification_model.UnreadCountResponse(
      unreadCount: unreadCount,
    );
  }
}
