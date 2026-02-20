// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_initialization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycInitializationResponseImpl _$$KycInitializationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$KycInitializationResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      userId: json['userId'] as String,
      userType: json['userType'] as String,
      currentTier: json['currentTier'] as String,
      status: json['status'] as String,
      requirements: (json['requirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      limits: KycLimits.fromJson(json['limits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KycInitializationResponseImplToJson(
        _$KycInitializationResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'userId': instance.userId,
      'userType': instance.userType,
      'currentTier': instance.currentTier,
      'status': instance.status,
      'requirements': instance.requirements,
      'limits': instance.limits,
    };
