import 'package:freezed_annotation/freezed_annotation.dart';

part 'recycling_streak.freezed.dart';
part 'recycling_streak.g.dart';

@freezed
class RecyclingStreak with _$RecyclingStreak {
  const factory RecyclingStreak({
    required int currentStreak,
    required int bestStreak,
    required List<bool> weeklyActivity,
    required DateTime lastActivityDate,
    required String streakDescription,
  }) = _RecyclingStreak;

  factory RecyclingStreak.fromJson(Map<String, dynamic> json) =>
      _$RecyclingStreakFromJson(json);
}
