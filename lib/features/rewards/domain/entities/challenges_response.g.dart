// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeItemImpl _$$ChallengeItemImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      progress: (json['progress'] as num).toDouble(),
      target: (json['target'] as num).toDouble(),
      percent: (json['percent'] as num).toInt(),
      pointsReward: (json['pointsReward'] as num).toInt(),
      daysLeft: (json['daysLeft'] as num).toInt(),
      completed: json['completed'] as bool,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$ChallengeItemImplToJson(_$ChallengeItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'progress': instance.progress,
      'target': instance.target,
      'percent': instance.percent,
      'pointsReward': instance.pointsReward,
      'daysLeft': instance.daysLeft,
      'completed': instance.completed,
      'completedAt': instance.completedAt?.toIso8601String(),
    };

_$ChallengesResponseImpl _$$ChallengesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengesResponseImpl(
      activeChallenges: (json['activeChallenges'] as List<dynamic>)
          .map((e) => ChallengeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedChallenges: (json['completedChallenges'] as List<dynamic>)
          .map((e) => ChallengeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChallengesResponseImplToJson(
        _$ChallengesResponseImpl instance) =>
    <String, dynamic>{
      'activeChallenges': instance.activeChallenges,
      'completedChallenges': instance.completedChallenges,
    };
