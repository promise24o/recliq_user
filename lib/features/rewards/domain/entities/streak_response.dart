import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_response.freezed.dart';
part 'streak_response.g.dart';

@freezed
class WeeklyActivity with _$WeeklyActivity {
  const factory WeeklyActivity({
    required bool sun,
    required bool mon,
    required bool tue,
    required bool wed,
    required bool thu,
    required bool fri,
    required bool sat,
  }) = _WeeklyActivity;

  factory WeeklyActivity.fromJson(Map<String, dynamic> json) =>
      _$WeeklyActivityFromJson(json);
}

@freezed
class StreakResponse with _$StreakResponse {
  const factory StreakResponse({
    required int currentStreakWeeks,
    required int bestStreakWeeks,
    required WeeklyActivity weeklyActivity,
    required bool isActive,
    required int daysUntilBreak,
  }) = _StreakResponse;

  factory StreakResponse.fromJson(Map<String, dynamic> json) =>
      _$StreakResponseFromJson(json);
}
