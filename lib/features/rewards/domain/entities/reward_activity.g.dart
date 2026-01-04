// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardActivityImpl _$$RewardActivityImplFromJson(Map<String, dynamic> json) =>
    _$RewardActivityImpl(
      id: json['id'] as String,
      points: (json['points'] as num).toInt(),
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      type: const ActivityTypeConverter().fromJson(json['type'] as String),
    );

Map<String, dynamic> _$$RewardActivityImplToJson(
        _$RewardActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'type': const ActivityTypeConverter().toJson(instance.type),
    };
