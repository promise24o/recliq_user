// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralRewardImpl _$$ReferralRewardImplFromJson(Map<String, dynamic> json) =>
    _$ReferralRewardImpl(
      totalReferrals: (json['totalReferrals'] as num).toInt(),
      pointsEarned: (json['pointsEarned'] as num).toInt(),
      referrals: (json['referrals'] as List<dynamic>)
          .map((e) => ReferralInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReferralRewardImplToJson(
        _$ReferralRewardImpl instance) =>
    <String, dynamic>{
      'totalReferrals': instance.totalReferrals,
      'pointsEarned': instance.pointsEarned,
      'referrals': instance.referrals,
    };

_$ReferralInfoImpl _$$ReferralInfoImplFromJson(Map<String, dynamic> json) =>
    _$ReferralInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      referralDate: DateTime.parse(json['referralDate'] as String),
      hasRecycled: json['hasRecycled'] as bool,
      pointsEarned: (json['pointsEarned'] as num).toInt(),
    );

Map<String, dynamic> _$$ReferralInfoImplToJson(_$ReferralInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'referralDate': instance.referralDate.toIso8601String(),
      'hasRecycled': instance.hasRecycled,
      'pointsEarned': instance.pointsEarned,
    };
