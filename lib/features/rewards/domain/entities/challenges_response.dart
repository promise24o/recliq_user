import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenges_response.freezed.dart';
part 'challenges_response.g.dart';

@freezed
class ChallengeItem with _$ChallengeItem {
  const factory ChallengeItem({
    required String id,
    required String title,
    required String description,
    required double progress,
    required double target,
    required int percent,
    required int pointsReward,
    required int daysLeft,
    required bool completed,
    DateTime? completedAt,
  }) = _ChallengeItem;

  factory ChallengeItem.fromJson(Map<String, dynamic> json) =>
      _$ChallengeItemFromJson(json);
}

@freezed
class ChallengesResponse with _$ChallengesResponse {
  const factory ChallengesResponse({
    required List<ChallengeItem> activeChallenges,
    required List<ChallengeItem> completedChallenges,
  }) = _ChallengesResponse;

  factory ChallengesResponse.fromJson(Map<String, dynamic> json) =>
      _$ChallengesResponseFromJson(json);
}
