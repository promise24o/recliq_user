import 'package:freezed_annotation/freezed_annotation.dart';

part 'pickup_request.freezed.dart';
part 'pickup_request.g.dart';

@freezed
class PickupRequest with _$PickupRequest {
  const factory PickupRequest({
    required String id,
    required String userId,
    required String userName,
    String? userPhone,
    String? city,
    String? zone,
    required String pickupMode,
    required String matchType,
    required String wasteType,
    required double estimatedWeight,
    required String status,
    String? assignedAgentId,
    String? assignedAgentName,
    String? slaDeadline,
    PickupPricing? pricing,
    required PickupCoordinates coordinates,
    required String address,
    String? notes,
    String? cancellationReason,
    String? cancelledAt,
    String? completedAt,
    @Default([]) List<MatchingEvent> matchingTimeline,
    String? createdAt,
    String? updatedAt,
  }) = _PickupRequest;

  factory PickupRequest.fromJson(Map<String, dynamic> json) =>
      _$PickupRequestFromJson(json);
}

@freezed
class PickupPricing with _$PickupPricing {
  const factory PickupPricing({
    required double baseAmount,
    required double bonusAmount,
    required double totalAmount,
    required String currency,
  }) = _PickupPricing;

  factory PickupPricing.fromJson(Map<String, dynamic> json) =>
      _$PickupPricingFromJson(json);
}

@freezed
class PickupCoordinates with _$PickupCoordinates {
  const factory PickupCoordinates({
    required double lat,
    required double lng,
  }) = _PickupCoordinates;

  factory PickupCoordinates.fromJson(Map<String, dynamic> json) =>
      _$PickupCoordinatesFromJson(json);
}

@freezed
class MatchingEvent with _$MatchingEvent {
  const factory MatchingEvent({
    required String id,
    required String type,
    required String timestamp,
    String? agentId,
    String? agentName,
    String? details,
  }) = _MatchingEvent;

  factory MatchingEvent.fromJson(Map<String, dynamic> json) =>
      _$MatchingEventFromJson(json);
}
