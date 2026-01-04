import 'package:freezed_annotation/freezed_annotation.dart';
import 'level.dart';

part 'rewards_overview.freezed.dart';
part 'rewards_overview.g.dart';

@freezed
class RewardsOverview with _$RewardsOverview {
  const factory RewardsOverview({
    required int totalPoints,
    required Level level,
    required int pointsToNextLevel,
    required int levelProgressPercent,
  }) = _RewardsOverview;

  factory RewardsOverview.fromJson(Map<String, dynamic> json) =>
      _$RewardsOverviewFromJson(json);
}
