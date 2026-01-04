import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_response.freezed.dart';
part 'referral_response.g.dart';

@freezed
class ReferralItem with _$ReferralItem {
  const factory ReferralItem({
    required String id,
    required String name,
    required String status,
    required int points,
    DateTime? completedAt,
    required DateTime createdAt,
  }) = _ReferralItem;

  factory ReferralItem.fromJson(Map<String, dynamic> json) =>
      _$ReferralItemFromJson(json);
}

@freezed
class ReferralResponse with _$ReferralResponse {
  const factory ReferralResponse({
    required int totalReferrals,
    required int pointsEarned,
    required int pointsRedeemed,
    required List<ReferralItem> recentReferrals,
  }) = _ReferralResponse;

  factory ReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralResponseFromJson(json);
}
