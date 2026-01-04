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
      type: ActivityType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RewardActivityImplToJson(
        _$RewardActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'type': instance.type,
    };

_$RecyleImpl _$$RecyleImplFromJson(Map<String, dynamic> json) => _$RecyleImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RecyleImplToJson(_$RecyleImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$StreakImpl _$$StreakImplFromJson(Map<String, dynamic> json) => _$StreakImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StreakImplToJson(_$StreakImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$BadgeImpl _$$BadgeImplFromJson(Map<String, dynamic> json) => _$BadgeImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BadgeImplToJson(_$BadgeImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ChallengeImpl _$$ChallengeImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChallengeImplToJson(_$ChallengeImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ReferralImpl _$$ReferralImplFromJson(Map<String, dynamic> json) =>
    _$ReferralImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReferralImplToJson(_$ReferralImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
