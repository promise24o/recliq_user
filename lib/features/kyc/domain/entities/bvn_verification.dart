import 'package:freezed_annotation/freezed_annotation.dart';
import 'kyc_status.dart';

part 'bvn_verification.freezed.dart';
part 'bvn_verification.g.dart';

@freezed
class BvnVerificationResponse with _$BvnVerificationResponse {
  const factory BvnVerificationResponse({
    required bool success,
    required String message,
    required String tier,
    required KycLimits limits,
  }) = _BvnVerificationResponse;

  factory BvnVerificationResponse.fromJson(Map<String, dynamic> json) => _$BvnVerificationResponseFromJson(json);
}
