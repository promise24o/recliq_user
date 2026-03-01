import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_agent.freezed.dart';
part 'available_agent.g.dart';

@freezed
class AvailableAgentsResponse with _$AvailableAgentsResponse {
  const factory AvailableAgentsResponse({
    required bool serviceable,
    @Default([]) List<AvailableAgent> agents,
    String? message,
    String? city,
    String? zone,
  }) = _AvailableAgentsResponse;

  factory AvailableAgentsResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableAgentsResponseFromJson(json);
}

@freezed
class AvailableAgent with _$AvailableAgent {
  const factory AvailableAgent({
    required String agentId,
    required String agentName,
    required AgentLocation currentLocation,
    required double distance,
    required int estimatedArrivalTime,
    @Default(0.0) double rating,
    @Default('') String vehicleType,
  }) = _AvailableAgent;

  factory AvailableAgent.fromJson(Map<String, dynamic> json) =>
      _$AvailableAgentFromJson(json);
}

@freezed
class AgentLocation with _$AgentLocation {
  const factory AgentLocation({
    required double lat,
    required double lng,
  }) = _AgentLocation;

  factory AgentLocation.fromJson(Map<String, dynamic> json) =>
      _$AgentLocationFromJson(json);
}
