import 'package:freezed_annotation/freezed_annotation.dart';
import 'kyc_status.dart';

part 'kyc_initialization.freezed.dart';
part 'kyc_initialization.g.dart';

@freezed
class KycInitializationResponse with _$KycInitializationResponse {
  const factory KycInitializationResponse({
    required bool success,
    required String message,
    required String userId,
    required String userType,
    required String currentTier,
    required String status,
    required List<String> requirements,
    required KycLimits limits,
  }) = _KycInitializationResponse;

  factory KycInitializationResponse.fromJson(Map<String, dynamic> json) => _$KycInitializationResponseFromJson(json);
}
