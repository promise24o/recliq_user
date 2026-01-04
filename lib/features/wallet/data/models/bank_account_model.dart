import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/bank_account.dart';

part 'bank_account_model.g.dart';

@JsonSerializable()
class BankAccountModel {
  final String? id;
  final String bankName;
  final String bankCode;
  final String accountNumber;
  final String accountName;
  final String type;
  final bool? isDefault;
  final bool? isActive;
  final DateTime? createdAt;

  const BankAccountModel({
    this.id,
    required this.bankName,
    required this.bankCode,
    required this.accountNumber,
    required this.accountName,
    required this.type,
    this.isDefault,
    this.isActive,
    this.createdAt,
  });

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountModelToJson(this);

  BankAccount toDomain() {
    return BankAccount(
      id: id,
      bankName: bankName,
      bankCode: bankCode,
      accountNumber: accountNumber,
      accountName: accountName,
      type: type,
      isDefault: isDefault,
      isActive: isActive,
      createdAt: createdAt,
    );
  }

  factory BankAccountModel.fromDomain(BankAccount bankAccount) {
    return BankAccountModel(
      id: bankAccount.id,
      bankName: bankAccount.bankName,
      bankCode: bankAccount.bankCode,
      accountNumber: bankAccount.accountNumber,
      accountName: bankAccount.accountName,
      type: bankAccount.type,
      isDefault: bankAccount.isDefault,
      isActive: bankAccount.isActive,
      createdAt: bankAccount.createdAt,
    );
  }
}

@JsonSerializable()
class BankAccountListResponse {
  @JsonKey(name: 'bankAccounts')
  final List<BankAccountModel> accounts;
  final int total;

  const BankAccountListResponse({
    required this.accounts,
    required this.total,
  });

  factory BankAccountListResponse.fromJson(Map<String, dynamic> json) =>
      _$BankAccountListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountListResponseToJson(this);
}

@JsonSerializable()
class LinkBankAccountRequest {
  @JsonKey(name: 'bankCode')
  final String bankCode;
  @JsonKey(name: 'account_number')
  final String accountNumber;
  final String type;

  const LinkBankAccountRequest({
    required this.bankCode,
    required this.accountNumber,
    required this.type,
  });

  Map<String, dynamic> toJson() => _$LinkBankAccountRequestToJson(this);
}

@JsonSerializable()
class LinkBankAccountResponse {
  final String id;
  final String bankName;
  final String bankCode;
  final String accountNumber;
  final String accountName;
  final String type;
  final bool? isDefault;
  final bool? isActive;
  final DateTime? createdAt;

  const LinkBankAccountResponse({
    required this.id,
    required this.bankName,
    required this.bankCode,
    required this.accountNumber,
    required this.accountName,
    required this.type,
    this.isDefault,
    this.isActive,
    this.createdAt,
  });

  factory LinkBankAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$LinkBankAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LinkBankAccountResponseToJson(this);

  BankAccountModel toBankAccountModel() {
    return BankAccountModel(
      id: id,
      bankName: bankName,
      bankCode: bankCode,
      accountNumber: accountNumber,
      accountName: accountName,
      type: type,
      isDefault: isDefault,
      isActive: isActive,
      createdAt: createdAt,
    );
  }
}
