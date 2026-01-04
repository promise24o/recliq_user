// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityFeedResponseImpl _$$ActivityFeedResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityFeedResponseImpl(
      activity: (json['activity'] as List<dynamic>)
          .map((e) => RewardActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$$ActivityFeedResponseImplToJson(
        _$ActivityFeedResponseImpl instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'hasMore': instance.hasMore,
    };
