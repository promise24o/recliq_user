import 'package:freezed_annotation/freezed_annotation.dart';
import 'redeemed_referral_item.dart';

part 'redeem_referral_response.freezed.dart';
part 'redeem_referral_response.g.dart';

@freezed
class RedeemReferralResponse with _$RedeemReferralResponse {
  const factory RedeemReferralResponse({
    required int redeemedCount,
    required int totalPointsRedeemed,
    required double amountCredited,
    required List<RedeemedReferralItem> referrals,
  }) = _RedeemReferralResponse;

  factory RedeemReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$RedeemReferralResponseFromJson(json);
}
