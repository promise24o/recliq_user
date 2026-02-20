import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_info.freezed.dart';
part 'bank_info.g.dart';

@freezed
class BankInfo with _$BankInfo {
  const factory BankInfo({
    required String name,
    required String code,
    required String slug,
  }) = _BankInfo;

  factory BankInfo.fromJson(Map<String, dynamic> json) => _$BankInfoFromJson(json);
}

@freezed
class AccountResolution with _$AccountResolution {
  const factory AccountResolution({
    @JsonKey(name: 'account_number') required String accountNumber,
    @JsonKey(name: 'account_name') required String accountName,
    @JsonKey(name: 'bank_id') required int bankId,
  }) = _AccountResolution;

  factory AccountResolution.fromJson(Map<String, dynamic> json) => _$AccountResolutionFromJson(json);
}
