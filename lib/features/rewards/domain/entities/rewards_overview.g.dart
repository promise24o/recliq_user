// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardsOverviewImpl _$$RewardsOverviewImplFromJson(
        Map<String, dynamic> json) =>
    _$RewardsOverviewImpl(
      totalPoints: (json['totalPoints'] as num).toInt(),
      level: Level.fromJson(json['level'] as Map<String, dynamic>),
      pointsToNextLevel: (json['pointsToNextLevel'] as num).toInt(),
      levelProgressPercent: (json['levelProgressPercent'] as num).toInt(),
    );

Map<String, dynamic> _$$RewardsOverviewImplToJson(
        _$RewardsOverviewImpl instance) =>
    <String, dynamic>{
      'totalPoints': instance.totalPoints,
      'level': instance.level,
      'pointsToNextLevel': instance.pointsToNextLevel,
      'levelProgressPercent': instance.levelProgressPercent,
    };
