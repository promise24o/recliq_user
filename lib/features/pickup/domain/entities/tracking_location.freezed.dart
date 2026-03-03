// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrackingLocation _$TrackingLocationFromJson(Map<String, dynamic> json) {
  return _TrackingLocation.fromJson(json);
}

/// @nodoc
mixin _$TrackingLocation {
  PickupCoordinates? get location => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get lastUpdated => throw _privateConstructorUsedError;
  bool get isLive => throw _privateConstructorUsedError;

  /// Serializes this TrackingLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackingLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingLocationCopyWith<TrackingLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingLocationCopyWith<$Res> {
  factory $TrackingLocationCopyWith(
          TrackingLocation value, $Res Function(TrackingLocation) then) =
      _$TrackingLocationCopyWithImpl<$Res, TrackingLocation>;
  @useResult
  $Res call(
      {PickupCoordinates? location,
      String? message,
      String? lastUpdated,
      bool isLive});

  $PickupCoordinatesCopyWith<$Res>? get location;
}

/// @nodoc
class _$TrackingLocationCopyWithImpl<$Res, $Val extends TrackingLocation>
    implements $TrackingLocationCopyWith<$Res> {
  _$TrackingLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackingLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? message = freezed,
    Object? lastUpdated = freezed,
    Object? isLive = null,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as PickupCoordinates?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TrackingLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PickupCoordinatesCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $PickupCoordinatesCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrackingLocationImplCopyWith<$Res>
    implements $TrackingLocationCopyWith<$Res> {
  factory _$$TrackingLocationImplCopyWith(_$TrackingLocationImpl value,
          $Res Function(_$TrackingLocationImpl) then) =
      __$$TrackingLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PickupCoordinates? location,
      String? message,
      String? lastUpdated,
      bool isLive});

  @override
  $PickupCoordinatesCopyWith<$Res>? get location;
}

/// @nodoc
class __$$TrackingLocationImplCopyWithImpl<$Res>
    extends _$TrackingLocationCopyWithImpl<$Res, _$TrackingLocationImpl>
    implements _$$TrackingLocationImplCopyWith<$Res> {
  __$$TrackingLocationImplCopyWithImpl(_$TrackingLocationImpl _value,
      $Res Function(_$TrackingLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackingLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? message = freezed,
    Object? lastUpdated = freezed,
    Object? isLive = null,
  }) {
    return _then(_$TrackingLocationImpl(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as PickupCoordinates?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingLocationImpl implements _TrackingLocation {
  const _$TrackingLocationImpl(
      {this.location, this.message, this.lastUpdated, this.isLive = false});

  factory _$TrackingLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingLocationImplFromJson(json);

  @override
  final PickupCoordinates? location;
  @override
  final String? message;
  @override
  final String? lastUpdated;
  @override
  @JsonKey()
  final bool isLive;

  @override
  String toString() {
    return 'TrackingLocation(location: $location, message: $message, lastUpdated: $lastUpdated, isLive: $isLive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingLocationImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.isLive, isLive) || other.isLive == isLive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, location, message, lastUpdated, isLive);

  /// Create a copy of TrackingLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingLocationImplCopyWith<_$TrackingLocationImpl> get copyWith =>
      __$$TrackingLocationImplCopyWithImpl<_$TrackingLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingLocationImplToJson(
      this,
    );
  }
}

abstract class _TrackingLocation implements TrackingLocation {
  const factory _TrackingLocation(
      {final PickupCoordinates? location,
      final String? message,
      final String? lastUpdated,
      final bool isLive}) = _$TrackingLocationImpl;

  factory _TrackingLocation.fromJson(Map<String, dynamic> json) =
      _$TrackingLocationImpl.fromJson;

  @override
  PickupCoordinates? get location;
  @override
  String? get message;
  @override
  String? get lastUpdated;
  @override
  bool get isLive;

  /// Create a copy of TrackingLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingLocationImplCopyWith<_$TrackingLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
