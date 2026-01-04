// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralItemImpl _$$ReferralItemImplFromJson(Map<String, dynamic> json) =>
    _$ReferralItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      points: (json['points'] as num).toInt(),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ReferralItemImplToJson(_$ReferralItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'points': instance.points,
      'completedAt': instance.completedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$ReferralResponseImpl _$$ReferralResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralResponseImpl(
      totalReferrals: (json['totalReferrals'] as num).toInt(),
      pointsEarned: (json['pointsEarned'] as num).toInt(),
      pointsRedeemed: (json['pointsRedeemed'] as num).toInt(),
      recentReferrals: (json['recentReferrals'] as List<dynamic>)
          .map((e) => ReferralItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReferralResponseImplToJson(
        _$ReferralResponseImpl instance) =>
    <String, dynamic>{
      'totalReferrals': instance.totalReferrals,
      'pointsEarned': instance.pointsEarned,
      'pointsRedeemed': instance.pointsRedeemed,
      'recentReferrals': instance.recentReferrals,
    };
