import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_points.freezed.dart';
part 'reward_points.g.dart';

@freezed
class RewardPoints with _$RewardPoints {
  const factory RewardPoints({
    required int totalPoints,
    required int currentLevel,
    required String levelName,
    required int pointsToNextLevel,
    required int levelProgress,
  }) = _RewardPoints;

  factory RewardPoints.fromJson(Map<String, dynamic> json) =>
      _$RewardPointsFromJson(json);
}
