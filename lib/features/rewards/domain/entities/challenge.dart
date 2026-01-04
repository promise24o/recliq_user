import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed
class Challenge with _$Challenge {
  const factory Challenge({
    required String id,
    required String title,
    required String description,
    required int targetValue,
    required int currentValue,
    required int rewardPoints,
    required DateTime deadline,
    required ChallengeType type,
    required bool isCompleted,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
}

@freezed
class ChallengeType with _$ChallengeType {
  const factory ChallengeType.weeklyRecycling() = _WeeklyRecycling;
  const factory ChallengeType.monthlyPickups() = _MonthlyPickups;
  const factory ChallengeType.referral() = _Referral;
  const factory ChallengeType.weightGoal() = _WeightGoal;

  factory ChallengeType.fromJson(Map<String, dynamic> json) =>
      _$ChallengeTypeFromJson(json);
}
