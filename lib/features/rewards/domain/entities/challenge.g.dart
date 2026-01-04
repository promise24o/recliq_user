// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeImpl _$$ChallengeImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      targetValue: (json['targetValue'] as num).toInt(),
      currentValue: (json['currentValue'] as num).toInt(),
      rewardPoints: (json['rewardPoints'] as num).toInt(),
      deadline: DateTime.parse(json['deadline'] as String),
      type: ChallengeType.fromJson(json['type'] as Map<String, dynamic>),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$ChallengeImplToJson(_$ChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'targetValue': instance.targetValue,
      'currentValue': instance.currentValue,
      'rewardPoints': instance.rewardPoints,
      'deadline': instance.deadline.toIso8601String(),
      'type': instance.type,
      'isCompleted': instance.isCompleted,
    };

_$WeeklyRecyclingImpl _$$WeeklyRecyclingImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyRecyclingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WeeklyRecyclingImplToJson(
        _$WeeklyRecyclingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MonthlyPickupsImpl _$$MonthlyPickupsImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyPickupsImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MonthlyPickupsImplToJson(
        _$MonthlyPickupsImpl instance) =>
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

_$WeightGoalImpl _$$WeightGoalImplFromJson(Map<String, dynamic> json) =>
    _$WeightGoalImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WeightGoalImplToJson(_$WeightGoalImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
