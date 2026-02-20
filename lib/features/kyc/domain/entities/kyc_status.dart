import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_status.freezed.dart';
part 'kyc_status.g.dart';

@freezed
class KycStatus with _$KycStatus {
  const factory KycStatus({
    required String userId,
    required String userType,
    required String currentTier,
    required String status,
    required bool emailVerified,
    required bool bvnVerified,
    required bool documentsUploaded,
    required bool selfieUploaded,
    required bool businessDocumentsUploaded,
    required KycLimits limits,
    required List<String> availableTiers,
    required List<String> nextTierRequirements,
  }) = _KycStatus;

  factory KycStatus.fromJson(Map<String, dynamic> json) => _$KycStatusFromJson(json);
}

@freezed
class KycLimits with _$KycLimits {
  const factory KycLimits({
    required double dailyWithdrawal,
    required double maxWalletBalance,
  }) = _KycLimits;

  factory KycLimits.fromJson(Map<String, dynamic> json) => _$KycLimitsFromJson(json);
}
