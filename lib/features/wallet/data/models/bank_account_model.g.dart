// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) =>
    BankAccountModel(
      id: json['id'] as String?,
      bankName: json['bankName'] as String,
      bankCode: json['bankCode'] as String,
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      type: json['type'] as String,
      isDefault: json['isDefault'] as bool?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BankAccountModelToJson(BankAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'type': instance.type,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

BankAccountListResponse _$BankAccountListResponseFromJson(
        Map<String, dynamic> json) =>
    BankAccountListResponse(
      accounts: (json['bankAccounts'] as List<dynamic>)
          .map((e) => BankAccountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$BankAccountListResponseToJson(
        BankAccountListResponse instance) =>
    <String, dynamic>{
      'bankAccounts': instance.accounts,
      'total': instance.total,
    };

LinkBankAccountRequest _$LinkBankAccountRequestFromJson(
        Map<String, dynamic> json) =>
    LinkBankAccountRequest(
      bankCode: json['bankCode'] as String,
      accountNumber: json['account_number'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$LinkBankAccountRequestToJson(
        LinkBankAccountRequest instance) =>
    <String, dynamic>{
      'bankCode': instance.bankCode,
      'account_number': instance.accountNumber,
      'type': instance.type,
    };

LinkBankAccountResponse _$LinkBankAccountResponseFromJson(
        Map<String, dynamic> json) =>
    LinkBankAccountResponse(
      id: json['id'] as String,
      bankName: json['bankName'] as String,
      bankCode: json['bankCode'] as String,
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      type: json['type'] as String,
      isDefault: json['isDefault'] as bool?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$LinkBankAccountResponseToJson(
        LinkBankAccountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'type': instance.type,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
