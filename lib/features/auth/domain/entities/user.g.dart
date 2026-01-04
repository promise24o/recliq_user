// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      phoneNumber: json['phone'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      hasPin: json['hasPin'] as bool? ?? false,
      walletBalance: (json['walletBalance'] as num?)?.toDouble() ?? 0.0,
      profilePhoto: json['profilePhoto'] as String?,
      referralCode: json['referralCode'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phoneNumber,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'hasPin': instance.hasPin,
      'walletBalance': instance.walletBalance,
      'profilePhoto': instance.profilePhoto,
      'referralCode': instance.referralCode,
    };
