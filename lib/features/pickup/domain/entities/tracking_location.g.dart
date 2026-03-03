// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackingLocationImpl _$$TrackingLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$TrackingLocationImpl(
      location: json['location'] == null
          ? null
          : PickupCoordinates.fromJson(
              json['location'] as Map<String, dynamic>),
      message: json['message'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
      isLive: json['isLive'] as bool? ?? false,
    );

Map<String, dynamic> _$$TrackingLocationImplToJson(
        _$TrackingLocationImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'message': instance.message,
      'lastUpdated': instance.lastUpdated,
      'isLive': instance.isLive,
    };
