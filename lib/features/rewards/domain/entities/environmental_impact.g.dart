// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environmental_impact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvironmentalImpactImpl _$$EnvironmentalImpactImplFromJson(
        Map<String, dynamic> json) =>
    _$EnvironmentalImpactImpl(
      totalWasteRecycled: (json['totalWasteRecycled'] as num).toDouble(),
      co2Saved: (json['co2Saved'] as num).toDouble(),
      treesEquivalent: (json['treesEquivalent'] as num).toInt(),
      carbonCreditScore: json['carbonCreditScore'] as String,
    );

Map<String, dynamic> _$$EnvironmentalImpactImplToJson(
        _$EnvironmentalImpactImpl instance) =>
    <String, dynamic>{
      'totalWasteRecycled': instance.totalWasteRecycled,
      'co2Saved': instance.co2Saved,
      'treesEquivalent': instance.treesEquivalent,
      'carbonCreditScore': instance.carbonCreditScore,
    };
