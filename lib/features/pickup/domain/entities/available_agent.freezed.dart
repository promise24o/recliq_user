// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvailableAgentsResponse _$AvailableAgentsResponseFromJson(
    Map<String, dynamic> json) {
  return _AvailableAgentsResponse.fromJson(json);
}

/// @nodoc
mixin _$AvailableAgentsResponse {
  bool get serviceable => throw _privateConstructorUsedError;
  List<AvailableAgent> get agents => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get zone => throw _privateConstructorUsedError;

  /// Serializes this AvailableAgentsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableAgentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableAgentsResponseCopyWith<AvailableAgentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableAgentsResponseCopyWith<$Res> {
  factory $AvailableAgentsResponseCopyWith(AvailableAgentsResponse value,
          $Res Function(AvailableAgentsResponse) then) =
      _$AvailableAgentsResponseCopyWithImpl<$Res, AvailableAgentsResponse>;
  @useResult
  $Res call(
      {bool serviceable,
      List<AvailableAgent> agents,
      String? message,
      String? city,
      String? zone});
}

/// @nodoc
class _$AvailableAgentsResponseCopyWithImpl<$Res,
        $Val extends AvailableAgentsResponse>
    implements $AvailableAgentsResponseCopyWith<$Res> {
  _$AvailableAgentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableAgentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceable = null,
    Object? agents = null,
    Object? message = freezed,
    Object? city = freezed,
    Object? zone = freezed,
  }) {
    return _then(_value.copyWith(
      serviceable: null == serviceable
          ? _value.serviceable
          : serviceable // ignore: cast_nullable_to_non_nullable
              as bool,
      agents: null == agents
          ? _value.agents
          : agents // ignore: cast_nullable_to_non_nullable
              as List<AvailableAgent>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      zone: freezed == zone
          ? _value.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableAgentsResponseImplCopyWith<$Res>
    implements $AvailableAgentsResponseCopyWith<$Res> {
  factory _$$AvailableAgentsResponseImplCopyWith(
          _$AvailableAgentsResponseImpl value,
          $Res Function(_$AvailableAgentsResponseImpl) then) =
      __$$AvailableAgentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool serviceable,
      List<AvailableAgent> agents,
      String? message,
      String? city,
      String? zone});
}

/// @nodoc
class __$$AvailableAgentsResponseImplCopyWithImpl<$Res>
    extends _$AvailableAgentsResponseCopyWithImpl<$Res,
        _$AvailableAgentsResponseImpl>
    implements _$$AvailableAgentsResponseImplCopyWith<$Res> {
  __$$AvailableAgentsResponseImplCopyWithImpl(
      _$AvailableAgentsResponseImpl _value,
      $Res Function(_$AvailableAgentsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableAgentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceable = null,
    Object? agents = null,
    Object? message = freezed,
    Object? city = freezed,
    Object? zone = freezed,
  }) {
    return _then(_$AvailableAgentsResponseImpl(
      serviceable: null == serviceable
          ? _value.serviceable
          : serviceable // ignore: cast_nullable_to_non_nullable
              as bool,
      agents: null == agents
          ? _value._agents
          : agents // ignore: cast_nullable_to_non_nullable
              as List<AvailableAgent>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      zone: freezed == zone
          ? _value.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableAgentsResponseImpl implements _AvailableAgentsResponse {
  const _$AvailableAgentsResponseImpl(
      {required this.serviceable,
      final List<AvailableAgent> agents = const [],
      this.message,
      this.city,
      this.zone})
      : _agents = agents;

  factory _$AvailableAgentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableAgentsResponseImplFromJson(json);

  @override
  final bool serviceable;
  final List<AvailableAgent> _agents;
  @override
  @JsonKey()
  List<AvailableAgent> get agents {
    if (_agents is EqualUnmodifiableListView) return _agents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_agents);
  }

  @override
  final String? message;
  @override
  final String? city;
  @override
  final String? zone;

  @override
  String toString() {
    return 'AvailableAgentsResponse(serviceable: $serviceable, agents: $agents, message: $message, city: $city, zone: $zone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableAgentsResponseImpl &&
            (identical(other.serviceable, serviceable) ||
                other.serviceable == serviceable) &&
            const DeepCollectionEquality().equals(other._agents, _agents) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zone, zone) || other.zone == zone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceable,
      const DeepCollectionEquality().hash(_agents), message, city, zone);

  /// Create a copy of AvailableAgentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableAgentsResponseImplCopyWith<_$AvailableAgentsResponseImpl>
      get copyWith => __$$AvailableAgentsResponseImplCopyWithImpl<
          _$AvailableAgentsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableAgentsResponseImplToJson(
      this,
    );
  }
}

abstract class _AvailableAgentsResponse implements AvailableAgentsResponse {
  const factory _AvailableAgentsResponse(
      {required final bool serviceable,
      final List<AvailableAgent> agents,
      final String? message,
      final String? city,
      final String? zone}) = _$AvailableAgentsResponseImpl;

  factory _AvailableAgentsResponse.fromJson(Map<String, dynamic> json) =
      _$AvailableAgentsResponseImpl.fromJson;

  @override
  bool get serviceable;
  @override
  List<AvailableAgent> get agents;
  @override
  String? get message;
  @override
  String? get city;
  @override
  String? get zone;

  /// Create a copy of AvailableAgentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableAgentsResponseImplCopyWith<_$AvailableAgentsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AvailableAgent _$AvailableAgentFromJson(Map<String, dynamic> json) {
  return _AvailableAgent.fromJson(json);
}

/// @nodoc
mixin _$AvailableAgent {
  String get agentId => throw _privateConstructorUsedError;
  String get agentName => throw _privateConstructorUsedError;
  AgentLocation get currentLocation => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  int get estimatedArrivalTime => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;

  /// Serializes this AvailableAgent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableAgent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableAgentCopyWith<AvailableAgent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableAgentCopyWith<$Res> {
  factory $AvailableAgentCopyWith(
          AvailableAgent value, $Res Function(AvailableAgent) then) =
      _$AvailableAgentCopyWithImpl<$Res, AvailableAgent>;
  @useResult
  $Res call(
      {String agentId,
      String agentName,
      AgentLocation currentLocation,
      double distance,
      int estimatedArrivalTime,
      double rating,
      String vehicleType});

  $AgentLocationCopyWith<$Res> get currentLocation;
}

/// @nodoc
class _$AvailableAgentCopyWithImpl<$Res, $Val extends AvailableAgent>
    implements $AvailableAgentCopyWith<$Res> {
  _$AvailableAgentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableAgent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? agentName = null,
    Object? currentLocation = null,
    Object? distance = null,
    Object? estimatedArrivalTime = null,
    Object? rating = null,
    Object? vehicleType = null,
  }) {
    return _then(_value.copyWith(
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      agentName: null == agentName
          ? _value.agentName
          : agentName // ignore: cast_nullable_to_non_nullable
              as String,
      currentLocation: null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as AgentLocation,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedArrivalTime: null == estimatedArrivalTime
          ? _value.estimatedArrivalTime
          : estimatedArrivalTime // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AvailableAgent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentLocationCopyWith<$Res> get currentLocation {
    return $AgentLocationCopyWith<$Res>(_value.currentLocation, (value) {
      return _then(_value.copyWith(currentLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AvailableAgentImplCopyWith<$Res>
    implements $AvailableAgentCopyWith<$Res> {
  factory _$$AvailableAgentImplCopyWith(_$AvailableAgentImpl value,
          $Res Function(_$AvailableAgentImpl) then) =
      __$$AvailableAgentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String agentId,
      String agentName,
      AgentLocation currentLocation,
      double distance,
      int estimatedArrivalTime,
      double rating,
      String vehicleType});

  @override
  $AgentLocationCopyWith<$Res> get currentLocation;
}

/// @nodoc
class __$$AvailableAgentImplCopyWithImpl<$Res>
    extends _$AvailableAgentCopyWithImpl<$Res, _$AvailableAgentImpl>
    implements _$$AvailableAgentImplCopyWith<$Res> {
  __$$AvailableAgentImplCopyWithImpl(
      _$AvailableAgentImpl _value, $Res Function(_$AvailableAgentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableAgent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? agentName = null,
    Object? currentLocation = null,
    Object? distance = null,
    Object? estimatedArrivalTime = null,
    Object? rating = null,
    Object? vehicleType = null,
  }) {
    return _then(_$AvailableAgentImpl(
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      agentName: null == agentName
          ? _value.agentName
          : agentName // ignore: cast_nullable_to_non_nullable
              as String,
      currentLocation: null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as AgentLocation,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedArrivalTime: null == estimatedArrivalTime
          ? _value.estimatedArrivalTime
          : estimatedArrivalTime // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableAgentImpl implements _AvailableAgent {
  const _$AvailableAgentImpl(
      {required this.agentId,
      required this.agentName,
      required this.currentLocation,
      required this.distance,
      required this.estimatedArrivalTime,
      this.rating = 0.0,
      this.vehicleType = ''});

  factory _$AvailableAgentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableAgentImplFromJson(json);

  @override
  final String agentId;
  @override
  final String agentName;
  @override
  final AgentLocation currentLocation;
  @override
  final double distance;
  @override
  final int estimatedArrivalTime;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String vehicleType;

  @override
  String toString() {
    return 'AvailableAgent(agentId: $agentId, agentName: $agentName, currentLocation: $currentLocation, distance: $distance, estimatedArrivalTime: $estimatedArrivalTime, rating: $rating, vehicleType: $vehicleType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableAgentImpl &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.agentName, agentName) ||
                other.agentName == agentName) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.estimatedArrivalTime, estimatedArrivalTime) ||
                other.estimatedArrivalTime == estimatedArrivalTime) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, agentId, agentName,
      currentLocation, distance, estimatedArrivalTime, rating, vehicleType);

  /// Create a copy of AvailableAgent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableAgentImplCopyWith<_$AvailableAgentImpl> get copyWith =>
      __$$AvailableAgentImplCopyWithImpl<_$AvailableAgentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableAgentImplToJson(
      this,
    );
  }
}

abstract class _AvailableAgent implements AvailableAgent {
  const factory _AvailableAgent(
      {required final String agentId,
      required final String agentName,
      required final AgentLocation currentLocation,
      required final double distance,
      required final int estimatedArrivalTime,
      final double rating,
      final String vehicleType}) = _$AvailableAgentImpl;

  factory _AvailableAgent.fromJson(Map<String, dynamic> json) =
      _$AvailableAgentImpl.fromJson;

  @override
  String get agentId;
  @override
  String get agentName;
  @override
  AgentLocation get currentLocation;
  @override
  double get distance;
  @override
  int get estimatedArrivalTime;
  @override
  double get rating;
  @override
  String get vehicleType;

  /// Create a copy of AvailableAgent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableAgentImplCopyWith<_$AvailableAgentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AgentLocation _$AgentLocationFromJson(Map<String, dynamic> json) {
  return _AgentLocation.fromJson(json);
}

/// @nodoc
mixin _$AgentLocation {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this AgentLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentLocationCopyWith<AgentLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentLocationCopyWith<$Res> {
  factory $AgentLocationCopyWith(
          AgentLocation value, $Res Function(AgentLocation) then) =
      _$AgentLocationCopyWithImpl<$Res, AgentLocation>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$AgentLocationCopyWithImpl<$Res, $Val extends AgentLocation>
    implements $AgentLocationCopyWith<$Res> {
  _$AgentLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentLocationImplCopyWith<$Res>
    implements $AgentLocationCopyWith<$Res> {
  factory _$$AgentLocationImplCopyWith(
          _$AgentLocationImpl value, $Res Function(_$AgentLocationImpl) then) =
      __$$AgentLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$AgentLocationImplCopyWithImpl<$Res>
    extends _$AgentLocationCopyWithImpl<$Res, _$AgentLocationImpl>
    implements _$$AgentLocationImplCopyWith<$Res> {
  __$$AgentLocationImplCopyWithImpl(
      _$AgentLocationImpl _value, $Res Function(_$AgentLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$AgentLocationImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentLocationImpl implements _AgentLocation {
  const _$AgentLocationImpl({required this.lat, required this.lng});

  factory _$AgentLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentLocationImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'AgentLocation(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentLocationImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of AgentLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentLocationImplCopyWith<_$AgentLocationImpl> get copyWith =>
      __$$AgentLocationImplCopyWithImpl<_$AgentLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentLocationImplToJson(
      this,
    );
  }
}

abstract class _AgentLocation implements AgentLocation {
  const factory _AgentLocation(
      {required final double lat,
      required final double lng}) = _$AgentLocationImpl;

  factory _AgentLocation.fromJson(Map<String, dynamic> json) =
      _$AgentLocationImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of AgentLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentLocationImplCopyWith<_$AgentLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
