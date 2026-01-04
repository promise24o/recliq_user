import 'package:freezed_annotation/freezed_annotation.dart';

part 'environmental_impact.freezed.dart';
part 'environmental_impact.g.dart';

@freezed
class EnvironmentalImpact with _$EnvironmentalImpact {
  const factory EnvironmentalImpact({
    required double totalWasteRecycled,
    required double co2Saved,
    required int treesEquivalent,
    required String carbonCreditScore,
  }) = _EnvironmentalImpact;

  factory EnvironmentalImpact.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentalImpactFromJson(json);
}
