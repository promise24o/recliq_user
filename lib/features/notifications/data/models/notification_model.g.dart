// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['message'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      isRead: json['read'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      priority: json['priority'] as String?,
      actionUrl: json['actionUrl'] as String?,
      actionText: json['actionText'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.body,
      'category': instance.category,
      'type': instance.type,
      'read': instance.isRead,
      'createdAt': instance.createdAt.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'metadata': instance.metadata,
      'priority': instance.priority,
      'actionUrl': instance.actionUrl,
      'actionText': instance.actionText,
      'imageUrl': instance.imageUrl,
    };

NotificationListResponseModel _$NotificationListResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationListResponseModel(
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      unreadCount: (json['unreadCount'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationListResponseModelToJson(
        NotificationListResponseModel instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
      'unreadCount': instance.unreadCount,
      'hasMore': instance.hasMore,
      'total': instance.total,
    };

UnreadCountResponseModel _$UnreadCountResponseModelFromJson(
        Map<String, dynamic> json) =>
    UnreadCountResponseModel(
      unreadCount: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$UnreadCountResponseModelToJson(
        UnreadCountResponseModel instance) =>
    <String, dynamic>{
      'count': instance.unreadCount,
    };
