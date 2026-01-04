import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_activity.freezed.dart';
part 'reward_activity.g.dart';

@freezed
class RewardActivity with _$RewardActivity {
  const factory RewardActivity({
    required String id,
    required int points,
    required String description,
    required DateTime date,
    required ActivityType type,
  }) = _RewardActivity;

  factory RewardActivity.fromJson(Map<String, dynamic> json) =>
      _$RewardActivityFromJson(json);
}

@freezed
class ActivityType with _$ActivityType {
  const factory ActivityType.recyle() = _Recyle;
  const factory ActivityType.streak() = _Streak;
  const factory ActivityType.badge() = _Badge;
  const factory ActivityType.challenge() = _Challenge;
  const factory ActivityType.referral() = _Referral;

  factory ActivityType.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeFromJson(json);
}
