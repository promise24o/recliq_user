// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankInfoImpl _$$BankInfoImplFromJson(Map<String, dynamic> json) =>
    _$BankInfoImpl(
      name: json['name'] as String,
      code: json['code'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$$BankInfoImplToJson(_$BankInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'slug': instance.slug,
    };

_$AccountResolutionImpl _$$AccountResolutionImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountResolutionImpl(
      accountNumber: json['account_number'] as String,
      accountName: json['account_name'] as String,
      bankId: (json['bank_id'] as num).toInt(),
    );

Map<String, dynamic> _$$AccountResolutionImplToJson(
        _$AccountResolutionImpl instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'bank_id': instance.bankId,
    };
