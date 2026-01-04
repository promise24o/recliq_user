import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_benefit.freezed.dart';
part 'reward_benefit.g.dart';

@freezed
class RewardBenefit with _$RewardBenefit {
  const factory RewardBenefit({
    required String id,
    required String title,
    required String description,
    required int pointsRequired,
    required String icon,
    required bool isAvailable,
    required BenefitType type,
  }) = _RewardBenefit;

  factory RewardBenefit.fromJson(Map<String, dynamic> json) =>
      _$RewardBenefitFromJson(json);
}

@freezed
class BenefitType with _$BenefitType {
  const factory BenefitType.walletCredits() = _WalletCredits;
  const factory BenefitType.airtimeDiscount() = _AirtimeDiscount;
  const factory BenefitType.priorityPickup() = _PriorityPickup;
  const factory BenefitType.exclusiveBadge() = _ExclusiveBadge;
  const factory BenefitType.raffleEntry() = _RaffleEntry;

  factory BenefitType.fromJson(Map<String, dynamic> json) =>
      _$BenefitTypeFromJson(json);
}
