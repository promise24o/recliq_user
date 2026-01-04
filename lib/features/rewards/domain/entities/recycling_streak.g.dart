// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycling_streak.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecyclingStreakImpl _$$RecyclingStreakImplFromJson(
        Map<String, dynamic> json) =>
    _$RecyclingStreakImpl(
      currentStreak: (json['currentStreak'] as num).toInt(),
      bestStreak: (json['bestStreak'] as num).toInt(),
      weeklyActivity: (json['weeklyActivity'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      lastActivityDate: DateTime.parse(json['lastActivityDate'] as String),
      streakDescription: json['streakDescription'] as String,
    );

Map<String, dynamic> _$$RecyclingStreakImplToJson(
        _$RecyclingStreakImpl instance) =>
    <String, dynamic>{
      'currentStreak': instance.currentStreak,
      'bestStreak': instance.bestStreak,
      'weeklyActivity': instance.weeklyActivity,
      'lastActivityDate': instance.lastActivityDate.toIso8601String(),
      'streakDescription': instance.streakDescription,
    };
