// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableAgentsResponseImpl _$$AvailableAgentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableAgentsResponseImpl(
      serviceable: json['serviceable'] as bool,
      agents: (json['agents'] as List<dynamic>?)
              ?.map((e) => AvailableAgent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String?,
      city: json['city'] as String?,
      zone: json['zone'] as String?,
    );

Map<String, dynamic> _$$AvailableAgentsResponseImplToJson(
        _$AvailableAgentsResponseImpl instance) =>
    <String, dynamic>{
      'serviceable': instance.serviceable,
      'agents': instance.agents,
      'message': instance.message,
      'city': instance.city,
      'zone': instance.zone,
    };

_$AvailableAgentImpl _$$AvailableAgentImplFromJson(Map<String, dynamic> json) =>
    _$AvailableAgentImpl(
      agentId: json['agentId'] as String,
      agentName: json['agentName'] as String,
      currentLocation: AgentLocation.fromJson(
          json['currentLocation'] as Map<String, dynamic>),
      distance: (json['distance'] as num).toDouble(),
      estimatedArrivalTime: (json['estimatedArrivalTime'] as num).toInt(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      vehicleType: json['vehicleType'] as String? ?? '',
    );

Map<String, dynamic> _$$AvailableAgentImplToJson(
        _$AvailableAgentImpl instance) =>
    <String, dynamic>{
      'agentId': instance.agentId,
      'agentName': instance.agentName,
      'currentLocation': instance.currentLocation,
      'distance': instance.distance,
      'estimatedArrivalTime': instance.estimatedArrivalTime,
      'rating': instance.rating,
      'vehicleType': instance.vehicleType,
    };

_$AgentLocationImpl _$$AgentLocationImplFromJson(Map<String, dynamic> json) =>
    _$AgentLocationImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$AgentLocationImplToJson(_$AgentLocationImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
