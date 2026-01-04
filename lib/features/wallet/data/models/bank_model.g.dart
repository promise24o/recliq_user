// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankModelImpl _$$BankModelImplFromJson(Map<String, dynamic> json) =>
    _$BankModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      code: json['code'] as String,
      longcode: json['longcode'] as String,
      country: json['country'] as String? ?? 'Nigeria',
      currency: json['currency'] as String? ?? 'NGN',
      type: json['type'] as String? ?? 'nuban',
      payWithBank: json['payWithBank'] as bool? ?? false,
      supportsTransfer: json['supportsTransfer'] as bool? ?? true,
      availableForDirectDebit:
          json['availableForDirectDebit'] as bool? ?? false,
      active: json['active'] as bool? ?? true,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BankModelImplToJson(_$BankModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'code': instance.code,
      'longcode': instance.longcode,
      'country': instance.country,
      'currency': instance.currency,
      'type': instance.type,
      'payWithBank': instance.payWithBank,
      'supportsTransfer': instance.supportsTransfer,
      'availableForDirectDebit': instance.availableForDirectDebit,
      'active': instance.active,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$BankListResponseImpl _$$BankListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BankListResponseImpl(
      banks: (json['banks'] as List<dynamic>)
          .map((e) => BankModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BankListResponseImplToJson(
        _$BankListResponseImpl instance) =>
    <String, dynamic>{
      'banks': instance.banks,
    };
