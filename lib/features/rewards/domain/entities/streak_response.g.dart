// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyActivityImpl _$$WeeklyActivityImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyActivityImpl(
      sun: json['sun'] as bool,
      mon: json['mon'] as bool,
      tue: json['tue'] as bool,
      wed: json['wed'] as bool,
      thu: json['thu'] as bool,
      fri: json['fri'] as bool,
      sat: json['sat'] as bool,
    );

Map<String, dynamic> _$$WeeklyActivityImplToJson(
        _$WeeklyActivityImpl instance) =>
    <String, dynamic>{
      'sun': instance.sun,
      'mon': instance.mon,
      'tue': instance.tue,
      'wed': instance.wed,
      'thu': instance.thu,
      'fri': instance.fri,
      'sat': instance.sat,
    };

_$StreakResponseImpl _$$StreakResponseImplFromJson(Map<String, dynamic> json) =>
    _$StreakResponseImpl(
      currentStreakWeeks: (json['currentStreakWeeks'] as num).toInt(),
      bestStreakWeeks: (json['bestStreakWeeks'] as num).toInt(),
      weeklyActivity: WeeklyActivity.fromJson(
          json['weeklyActivity'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool,
      daysUntilBreak: (json['daysUntilBreak'] as num).toInt(),
    );

Map<String, dynamic> _$$StreakResponseImplToJson(
        _$StreakResponseImpl instance) =>
    <String, dynamic>{
      'currentStreakWeeks': instance.currentStreakWeeks,
      'bestStreakWeeks': instance.bestStreakWeeks,
      'weeklyActivity': instance.weeklyActivity,
      'isActive': instance.isActive,
      'daysUntilBreak': instance.daysUntilBreak,
    };
