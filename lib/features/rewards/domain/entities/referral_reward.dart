import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_reward.freezed.dart';
part 'referral_reward.g.dart';

@freezed
class ReferralReward with _$ReferralReward {
  const factory ReferralReward({
    required int totalReferrals,
    required int pointsEarned,
    required List<ReferralInfo> referrals,
  }) = _ReferralReward;

  factory ReferralReward.fromJson(Map<String, dynamic> json) =>
      _$ReferralRewardFromJson(json);
}

@freezed
class ReferralInfo with _$ReferralInfo {
  const factory ReferralInfo({
    required String id,
    required String name,
    required DateTime referralDate,
    required bool hasRecycled,
    required int pointsEarned,
  }) = _ReferralInfo;

  factory ReferralInfo.fromJson(Map<String, dynamic> json) =>
      _$ReferralInfoFromJson(json);
}
