import 'package:freezed_annotation/freezed_annotation.dart';
import 'pickup_request.dart';

part 'tracking_location.freezed.dart';
part 'tracking_location.g.dart';

@freezed
class TrackingLocation with _$TrackingLocation {
  const factory TrackingLocation({
    PickupCoordinates? location,
    String? message,
    String? lastUpdated,
    @Default(false) bool isLive,
  }) = _TrackingLocation;

  factory TrackingLocation.fromJson(Map<String, dynamic> json) =>
      _$TrackingLocationFromJson(json);
}
