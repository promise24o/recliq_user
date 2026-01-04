// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeemed_referral_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RedeemedReferralItemImpl _$$RedeemedReferralItemImplFromJson(
        Map<String, dynamic> json) =>
    _$RedeemedReferralItemImpl(
      id: json['id'] as String,
      pointsAwarded: (json['pointsAwarded'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$RedeemedReferralItemImplToJson(
        _$RedeemedReferralItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pointsAwarded': instance.pointsAwarded,
      'amount': instance.amount,
    };
