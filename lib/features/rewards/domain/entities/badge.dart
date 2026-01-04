import 'package:freezed_annotation/freezed_annotation.dart';

part 'badge.freezed.dart';
part 'badge.g.dart';

@freezed
class Badge with _$Badge {
  const factory Badge({
    required String id,
    required String name,
    required String description,
    required String icon,
    required String criteria,
    required bool isEarned,
    DateTime? earnedAt,
    BadgeCategory? category,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}

@freezed
class BadgeCategory with _$BadgeCategory {
  const factory BadgeCategory.firstRecycle() = _FirstRecycle;
  const factory BadgeCategory.weightMilestone() = _WeightMilestone;
  const factory BadgeCategory.carbonSaver() = _CarbonSaver;
  const factory BadgeCategory.communityContributor() = _CommunityContributor;
  const factory BadgeCategory.consistencyChampion() = _ConsistencyChampion;

  factory BadgeCategory.fromJson(Map<String, dynamic> json) =>
      _$BadgeCategoryFromJson(json);
}
