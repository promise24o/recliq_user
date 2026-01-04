// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environmental_impact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvironmentalImpactResponseImpl _$$EnvironmentalImpactResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EnvironmentalImpactResponseImpl(
      wasteRecycledKg: (json['wasteRecycledKg'] as num).toDouble(),
      co2SavedKg: (json['co2SavedKg'] as num).toDouble(),
      treesEquivalent: (json['treesEquivalent'] as num).toInt(),
      carbonScore: json['carbonScore'] as String,
      waterSaved: (json['waterSaved'] as num).toInt(),
      energySaved: (json['energySaved'] as num).toInt(),
      landfillSpaceSaved: (json['landfillSpaceSaved'] as num).toDouble(),
    );

Map<String, dynamic> _$$EnvironmentalImpactResponseImplToJson(
        _$EnvironmentalImpactResponseImpl instance) =>
    <String, dynamic>{
      'wasteRecycledKg': instance.wasteRecycledKg,
      'co2SavedKg': instance.co2SavedKg,
      'treesEquivalent': instance.treesEquivalent,
      'carbonScore': instance.carbonScore,
      'waterSaved': instance.waterSaved,
      'energySaved': instance.energySaved,
      'landfillSpaceSaved': instance.landfillSpaceSaved,
    };
