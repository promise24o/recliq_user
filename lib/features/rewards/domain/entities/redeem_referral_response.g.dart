// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem_referral_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RedeemReferralResponseImpl _$$RedeemReferralResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RedeemReferralResponseImpl(
      redeemedCount: (json['redeemedCount'] as num).toInt(),
      totalPointsRedeemed: (json['totalPointsRedeemed'] as num).toInt(),
      amountCredited: (json['amountCredited'] as num).toDouble(),
      referrals: (json['referrals'] as List<dynamic>)
          .map((e) => RedeemedReferralItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RedeemReferralResponseImplToJson(
        _$RedeemReferralResponseImpl instance) =>
    <String, dynamic>{
      'redeemedCount': instance.redeemedCount,
      'totalPointsRedeemed': instance.totalPointsRedeemed,
      'amountCredited': instance.amountCredited,
      'referrals': instance.referrals,
    };
