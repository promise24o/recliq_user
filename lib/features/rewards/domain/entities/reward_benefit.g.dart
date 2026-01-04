// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_benefit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardBenefitImpl _$$RewardBenefitImplFromJson(Map<String, dynamic> json) =>
    _$RewardBenefitImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      pointsRequired: (json['pointsRequired'] as num).toInt(),
      icon: json['icon'] as String,
      isAvailable: json['isAvailable'] as bool,
      type: BenefitType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RewardBenefitImplToJson(_$RewardBenefitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'pointsRequired': instance.pointsRequired,
      'icon': instance.icon,
      'isAvailable': instance.isAvailable,
      'type': instance.type,
    };

_$WalletCreditsImpl _$$WalletCreditsImplFromJson(Map<String, dynamic> json) =>
    _$WalletCreditsImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WalletCreditsImplToJson(_$WalletCreditsImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AirtimeDiscountImpl _$$AirtimeDiscountImplFromJson(
        Map<String, dynamic> json) =>
    _$AirtimeDiscountImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AirtimeDiscountImplToJson(
        _$AirtimeDiscountImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PriorityPickupImpl _$$PriorityPickupImplFromJson(Map<String, dynamic> json) =>
    _$PriorityPickupImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PriorityPickupImplToJson(
        _$PriorityPickupImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ExclusiveBadgeImpl _$$ExclusiveBadgeImplFromJson(Map<String, dynamic> json) =>
    _$ExclusiveBadgeImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExclusiveBadgeImplToJson(
        _$ExclusiveBadgeImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RaffleEntryImpl _$$RaffleEntryImplFromJson(Map<String, dynamic> json) =>
    _$RaffleEntryImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RaffleEntryImplToJson(_$RaffleEntryImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
