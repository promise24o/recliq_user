import 'package:freezed_annotation/freezed_annotation.dart';

part 'redeemed_referral_item.freezed.dart';
part 'redeemed_referral_item.g.dart';

@freezed
class RedeemedReferralItem with _$RedeemedReferralItem {
  const factory RedeemedReferralItem({
    required String id,
    required int pointsAwarded,
    required double amount,
  }) = _RedeemedReferralItem;

  factory RedeemedReferralItem.fromJson(Map<String, dynamic> json) =>
      _$RedeemedReferralItemFromJson(json);
}
