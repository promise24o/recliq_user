// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardPointsImpl _$$RewardPointsImplFromJson(Map<String, dynamic> json) =>
    _$RewardPointsImpl(
      totalPoints: (json['totalPoints'] as num).toInt(),
      currentLevel: (json['currentLevel'] as num).toInt(),
      levelName: json['levelName'] as String,
      pointsToNextLevel: (json['pointsToNextLevel'] as num).toInt(),
      levelProgress: (json['levelProgress'] as num).toInt(),
    );

Map<String, dynamic> _$$RewardPointsImplToJson(_$RewardPointsImpl instance) =>
    <String, dynamic>{
      'totalPoints': instance.totalPoints,
      'currentLevel': instance.currentLevel,
      'levelName': instance.levelName,
      'pointsToNextLevel': instance.pointsToNextLevel,
      'levelProgress': instance.levelProgress,
    };
