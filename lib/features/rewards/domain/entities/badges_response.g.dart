// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badges_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BadgesResponseImpl _$$BadgesResponseImplFromJson(Map<String, dynamic> json) =>
    _$BadgesResponseImpl(
      totalBadges: (json['totalBadges'] as num).toInt(),
      earnedBadges: (json['earnedBadges'] as List<dynamic>)
          .map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
      lockedBadges: (json['lockedBadges'] as List<dynamic>)
          .map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BadgesResponseImplToJson(
        _$BadgesResponseImpl instance) =>
    <String, dynamic>{
      'totalBadges': instance.totalBadges,
      'earnedBadges': instance.earnedBadges,
      'lockedBadges': instance.lockedBadges,
    };
