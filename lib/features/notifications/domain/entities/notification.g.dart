// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      isRead: json['isRead'] as bool,
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

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'category': instance.category,
      'type': instance.type,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'metadata': instance.metadata,
      'priority': instance.priority,
      'actionUrl': instance.actionUrl,
      'actionText': instance.actionText,
      'imageUrl': instance.imageUrl,
    };

_$NotificationListResponseImpl _$$NotificationListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationListResponseImpl(
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
      unreadCount: (json['unreadCount'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$NotificationListResponseImplToJson(
        _$NotificationListResponseImpl instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
      'unreadCount': instance.unreadCount,
      'hasMore': instance.hasMore,
      'total': instance.total,
    };

_$UnreadCountResponseImpl _$$UnreadCountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UnreadCountResponseImpl(
      unreadCount: (json['unreadCount'] as num).toInt(),
    );

Map<String, dynamic> _$$UnreadCountResponseImplToJson(
        _$UnreadCountResponseImpl instance) =>
    <String, dynamic>{
      'unreadCount': instance.unreadCount,
    };
