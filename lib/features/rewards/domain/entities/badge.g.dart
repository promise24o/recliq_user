// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BadgeImpl _$$BadgeImplFromJson(Map<String, dynamic> json) => _$BadgeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      criteria: json['criteria'] as String,
      isEarned: json['isEarned'] as bool,
      earnedAt: json['earnedAt'] == null
          ? null
          : DateTime.parse(json['earnedAt'] as String),
      category: json['category'] == null
          ? null
          : BadgeCategory.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BadgeImplToJson(_$BadgeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'criteria': instance.criteria,
      'isEarned': instance.isEarned,
      'earnedAt': instance.earnedAt?.toIso8601String(),
      'category': instance.category,
    };

_$FirstRecycleImpl _$$FirstRecycleImplFromJson(Map<String, dynamic> json) =>
    _$FirstRecycleImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FirstRecycleImplToJson(_$FirstRecycleImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$WeightMilestoneImpl _$$WeightMilestoneImplFromJson(
        Map<String, dynamic> json) =>
    _$WeightMilestoneImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WeightMilestoneImplToJson(
        _$WeightMilestoneImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CarbonSaverImpl _$$CarbonSaverImplFromJson(Map<String, dynamic> json) =>
    _$CarbonSaverImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CarbonSaverImplToJson(_$CarbonSaverImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CommunityContributorImpl _$$CommunityContributorImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityContributorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CommunityContributorImplToJson(
        _$CommunityContributorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ConsistencyChampionImpl _$$ConsistencyChampionImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsistencyChampionImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConsistencyChampionImplToJson(
        _$ConsistencyChampionImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
