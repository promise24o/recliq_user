// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycStatusImpl _$$KycStatusImplFromJson(Map<String, dynamic> json) =>
    _$KycStatusImpl(
      userId: json['userId'] as String,
      userType: json['userType'] as String,
      currentTier: json['currentTier'] as String,
      status: json['status'] as String,
      emailVerified: json['emailVerified'] as bool,
      bvnVerified: json['bvnVerified'] as bool,
      documentsUploaded: json['documentsUploaded'] as bool,
      selfieUploaded: json['selfieUploaded'] as bool,
      businessDocumentsUploaded: json['businessDocumentsUploaded'] as bool,
      limits: KycLimits.fromJson(json['limits'] as Map<String, dynamic>),
      availableTiers: (json['availableTiers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nextTierRequirements: (json['nextTierRequirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$KycStatusImplToJson(_$KycStatusImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userType': instance.userType,
      'currentTier': instance.currentTier,
      'status': instance.status,
      'emailVerified': instance.emailVerified,
      'bvnVerified': instance.bvnVerified,
      'documentsUploaded': instance.documentsUploaded,
      'selfieUploaded': instance.selfieUploaded,
      'businessDocumentsUploaded': instance.businessDocumentsUploaded,
      'limits': instance.limits,
      'availableTiers': instance.availableTiers,
      'nextTierRequirements': instance.nextTierRequirements,
    };

_$KycLimitsImpl _$$KycLimitsImplFromJson(Map<String, dynamic> json) =>
    _$KycLimitsImpl(
      dailyWithdrawal: (json['dailyWithdrawal'] as num).toDouble(),
      maxWalletBalance: (json['maxWalletBalance'] as num).toDouble(),
    );

Map<String, dynamic> _$$KycLimitsImplToJson(_$KycLimitsImpl instance) =>
    <String, dynamic>{
      'dailyWithdrawal': instance.dailyWithdrawal,
      'maxWalletBalance': instance.maxWalletBalance,
    };
