// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bvn_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BvnVerificationResponseImpl _$$BvnVerificationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BvnVerificationResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      tier: json['tier'] as String,
      limits: KycLimits.fromJson(json['limits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BvnVerificationResponseImplToJson(
        _$BvnVerificationResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'tier': instance.tier,
      'limits': instance.limits,
    };
