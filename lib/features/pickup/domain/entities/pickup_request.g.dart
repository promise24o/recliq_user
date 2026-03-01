// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PickupRequestImpl _$$PickupRequestImplFromJson(Map<String, dynamic> json) =>
    _$PickupRequestImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userPhone: json['userPhone'] as String?,
      city: json['city'] as String?,
      zone: json['zone'] as String?,
      pickupMode: json['pickupMode'] as String,
      matchType: json['matchType'] as String,
      wasteType: json['wasteType'] as String,
      estimatedWeight: (json['estimatedWeight'] as num).toDouble(),
      status: json['status'] as String,
      assignedAgentId: json['assignedAgentId'] as String?,
      assignedAgentName: json['assignedAgentName'] as String?,
      slaDeadline: json['slaDeadline'] as String?,
      pricing: json['pricing'] == null
          ? null
          : PickupPricing.fromJson(json['pricing'] as Map<String, dynamic>),
      coordinates: PickupCoordinates.fromJson(
          json['coordinates'] as Map<String, dynamic>),
      address: json['address'] as String,
      notes: json['notes'] as String?,
      cancellationReason: json['cancellationReason'] as String?,
      cancelledAt: json['cancelledAt'] as String?,
      completedAt: json['completedAt'] as String?,
      matchingTimeline: (json['matchingTimeline'] as List<dynamic>?)
              ?.map((e) => MatchingEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$PickupRequestImplToJson(_$PickupRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhone': instance.userPhone,
      'city': instance.city,
      'zone': instance.zone,
      'pickupMode': instance.pickupMode,
      'matchType': instance.matchType,
      'wasteType': instance.wasteType,
      'estimatedWeight': instance.estimatedWeight,
      'status': instance.status,
      'assignedAgentId': instance.assignedAgentId,
      'assignedAgentName': instance.assignedAgentName,
      'slaDeadline': instance.slaDeadline,
      'pricing': instance.pricing,
      'coordinates': instance.coordinates,
      'address': instance.address,
      'notes': instance.notes,
      'cancellationReason': instance.cancellationReason,
      'cancelledAt': instance.cancelledAt,
      'completedAt': instance.completedAt,
      'matchingTimeline': instance.matchingTimeline,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$PickupPricingImpl _$$PickupPricingImplFromJson(Map<String, dynamic> json) =>
    _$PickupPricingImpl(
      baseAmount: (json['baseAmount'] as num).toDouble(),
      bonusAmount: (json['bonusAmount'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$PickupPricingImplToJson(_$PickupPricingImpl instance) =>
    <String, dynamic>{
      'baseAmount': instance.baseAmount,
      'bonusAmount': instance.bonusAmount,
      'totalAmount': instance.totalAmount,
      'currency': instance.currency,
    };

_$PickupCoordinatesImpl _$$PickupCoordinatesImplFromJson(
        Map<String, dynamic> json) =>
    _$PickupCoordinatesImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$PickupCoordinatesImplToJson(
        _$PickupCoordinatesImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$MatchingEventImpl _$$MatchingEventImplFromJson(Map<String, dynamic> json) =>
    _$MatchingEventImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      timestamp: json['timestamp'] as String,
      agentId: json['agentId'] as String?,
      agentName: json['agentName'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$MatchingEventImplToJson(_$MatchingEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'timestamp': instance.timestamp,
      'agentId': instance.agentId,
      'agentName': instance.agentName,
      'details': instance.details,
    };
