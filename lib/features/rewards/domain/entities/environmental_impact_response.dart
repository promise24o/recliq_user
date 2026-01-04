import 'package:freezed_annotation/freezed_annotation.dart';

part 'environmental_impact_response.freezed.dart';
part 'environmental_impact_response.g.dart';

@freezed
class EnvironmentalImpactResponse with _$EnvironmentalImpactResponse {
  const factory EnvironmentalImpactResponse({
    required double wasteRecycledKg,
    required double co2SavedKg,
    required int treesEquivalent,
    required String carbonScore,
    required int waterSaved,
    required int energySaved,
    required double landfillSpaceSaved,
  }) = _EnvironmentalImpactResponse;

  factory EnvironmentalImpactResponse.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentalImpactResponseFromJson(json);
}
