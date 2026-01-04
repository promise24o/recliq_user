import 'package:freezed_annotation/freezed_annotation.dart';
import 'badge.dart';

part 'badges_response.freezed.dart';
part 'badges_response.g.dart';

@freezed
class BadgesResponse with _$BadgesResponse {
  const factory BadgesResponse({
    required int totalBadges,
    required List<Badge> earnedBadges,
    required List<Badge> lockedBadges,
  }) = _BadgesResponse;

  factory BadgesResponse.fromJson(Map<String, dynamic> json) =>
      _$BadgesResponseFromJson(json);
}
