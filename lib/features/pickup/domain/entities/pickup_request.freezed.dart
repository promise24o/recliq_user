// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PickupRequest _$PickupRequestFromJson(Map<String, dynamic> json) {
  return _PickupRequest.fromJson(json);
}

/// @nodoc
mixin _$PickupRequest {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get userPhone => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get zone => throw _privateConstructorUsedError;
  String get pickupMode => throw _privateConstructorUsedError;
  String get matchType => throw _privateConstructorUsedError;
  String get wasteType => throw _privateConstructorUsedError;
  double get estimatedWeight => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get assignedAgentId => throw _privateConstructorUsedError;
  String? get assignedAgentName => throw _privateConstructorUsedError;
  String? get slaDeadline => throw _privateConstructorUsedError;
  PickupPricing? get pricing => throw _privateConstructorUsedError;
  PickupCoordinates get coordinates => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  String? get cancelledAt => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  List<MatchingEvent> get matchingTimeline =>
      throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PickupRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickupRequestCopyWith<PickupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupRequestCopyWith<$Res> {
  factory $PickupRequestCopyWith(
          PickupRequest value, $Res Function(PickupRequest) then) =
      _$PickupRequestCopyWithImpl<$Res, PickupRequest>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String? userPhone,
      String? city,
      String? zone,
      String pickupMode,
      String matchType,
      String wasteType,
      double estimatedWeight,
      String status,
      String? assignedAgentId,
      String? assignedAgentName,
      String? slaDeadline,
      PickupPricing? pricing,
      PickupCoordinates coordinates,
      String address,
      String? notes,
      String? cancellationReason,
      String? cancelledAt,
      String? completedAt,
      List<MatchingEvent> matchingTimeline,
      String? createdAt,
      String? updatedAt});

  $PickupPricingCopyWith<$Res>? get pricing;
  $PickupCoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class _$PickupRequestCopyWithImpl<$Res, $Val extends PickupRequest>
    implements $PickupRequestCopyWith<$Res> {
  _$PickupRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? userPhone = freezed,
    Object? city = freezed,
    Object? zone = freezed,
    Object? pickupMode = null,
    Object? matchType = null,
    Object? wasteType = null,
    Object? estimatedWeight = null,
    Object? status = null,
    Object? assignedAgentId = freezed,
    Object? assignedAgentName = freezed,
    Object? slaDeadline = freezed,
    Object? pricing = freezed,
    Object? coordinates = null,
    Object? address = null,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? completedAt = freezed,
    Object? matchingTimeline = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      zone: freezed == zone
          ? _value.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupMode: null == pickupMode
          ? _value.pickupMode
          : pickupMode // ignore: cast_nullable_to_non_nullable
              as String,
      matchType: null == matchType
          ? _value.matchType
          : matchType // ignore: cast_nullable_to_non_nullable
              as String,
      wasteType: null == wasteType
          ? _value.wasteType
          : wasteType // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedWeight: null == estimatedWeight
          ? _value.estimatedWeight
          : estimatedWeight // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedAgentId: freezed == assignedAgentId
          ? _value.assignedAgentId
          : assignedAgentId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedAgentName: freezed == assignedAgentName
          ? _value.assignedAgentName
          : assignedAgentName // ignore: cast_nullable_to_non_nullable
              as String?,
      slaDeadline: freezed == slaDeadline
          ? _value.slaDeadline
          : slaDeadline // ignore: cast_nullable_to_non_nullable
              as String?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as PickupPricing?,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as PickupCoordinates,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      matchingTimeline: null == matchingTimeline
          ? _value.matchingTimeline
          : matchingTimeline // ignore: cast_nullable_to_non_nullable
              as List<MatchingEvent>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PickupPricingCopyWith<$Res>? get pricing {
    if (_value.pricing == null) {
      return null;
    }

    return $PickupPricingCopyWith<$Res>(_value.pricing!, (value) {
      return _then(_value.copyWith(pricing: value) as $Val);
    });
  }

  /// Create a copy of PickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PickupCoordinatesCopyWith<$Res> get coordinates {
    return $PickupCoordinatesCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PickupRequestImplCopyWith<$Res>
    implements $PickupRequestCopyWith<$Res> {
  factory _$$PickupRequestImplCopyWith(
          _$PickupRequestImpl value, $Res Function(_$PickupRequestImpl) then) =
      __$$PickupRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String? userPhone,
      String? city,
      String? zone,
      String pickupMode,
      String matchType,
      String wasteType,
      double estimatedWeight,
      String status,
      String? assignedAgentId,
      String? assignedAgentName,
      String? slaDeadline,
      PickupPricing? pricing,
      PickupCoordinates coordinates,
      String address,
      String? notes,
      String? cancellationReason,
      String? cancelledAt,
      String? completedAt,
      List<MatchingEvent> matchingTimeline,
      String? createdAt,
      String? updatedAt});

  @override
  $PickupPricingCopyWith<$Res>? get pricing;
  @override
  $PickupCoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class __$$PickupRequestImplCopyWithImpl<$Res>
    extends _$PickupRequestCopyWithImpl<$Res, _$PickupRequestImpl>
    implements _$$PickupRequestImplCopyWith<$Res> {
  __$$PickupRequestImplCopyWithImpl(
      _$PickupRequestImpl _value, $Res Function(_$PickupRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? userPhone = freezed,
    Object? city = freezed,
    Object? zone = freezed,
    Object? pickupMode = null,
    Object? matchType = null,
    Object? wasteType = null,
    Object? estimatedWeight = null,
    Object? status = null,
    Object? assignedAgentId = freezed,
    Object? assignedAgentName = freezed,
    Object? slaDeadline = freezed,
    Object? pricing = freezed,
    Object? coordinates = null,
    Object? address = null,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? completedAt = freezed,
    Object? matchingTimeline = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PickupRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      zone: freezed == zone
          ? _value.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupMode: null == pickupMode
          ? _value.pickupMode
          : pickupMode // ignore: cast_nullable_to_non_nullable
              as String,
      matchType: null == matchType
          ? _value.matchType
          : matchType // ignore: cast_nullable_to_non_nullable
              as String,
      wasteType: null == wasteType
          ? _value.wasteType
          : wasteType // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedWeight: null == estimatedWeight
          ? _value.estimatedWeight
          : estimatedWeight // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedAgentId: freezed == assignedAgentId
          ? _value.assignedAgentId
          : assignedAgentId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedAgentName: freezed == assignedAgentName
          ? _value.assignedAgentName
          : assignedAgentName // ignore: cast_nullable_to_non_nullable
              as String?,
      slaDeadline: freezed == slaDeadline
          ? _value.slaDeadline
          : slaDeadline // ignore: cast_nullable_to_non_nullable
              as String?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as PickupPricing?,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as PickupCoordinates,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      matchingTimeline: null == matchingTimeline
          ? _value._matchingTimeline
          : matchingTimeline // ignore: cast_nullable_to_non_nullable
              as List<MatchingEvent>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PickupRequestImpl implements _PickupRequest {
  const _$PickupRequestImpl(
      {required this.id,
      required this.userId,
      required this.userName,
      this.userPhone,
      this.city,
      this.zone,
      required this.pickupMode,
      required this.matchType,
      required this.wasteType,
      required this.estimatedWeight,
      required this.status,
      this.assignedAgentId,
      this.assignedAgentName,
      this.slaDeadline,
      this.pricing,
      required this.coordinates,
      required this.address,
      this.notes,
      this.cancellationReason,
      this.cancelledAt,
      this.completedAt,
      final List<MatchingEvent> matchingTimeline = const [],
      this.createdAt,
      this.updatedAt})
      : _matchingTimeline = matchingTimeline;

  factory _$PickupRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickupRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? userPhone;
  @override
  final String? city;
  @override
  final String? zone;
  @override
  final String pickupMode;
  @override
  final String matchType;
  @override
  final String wasteType;
  @override
  final double estimatedWeight;
  @override
  final String status;
  @override
  final String? assignedAgentId;
  @override
  final String? assignedAgentName;
  @override
  final String? slaDeadline;
  @override
  final PickupPricing? pricing;
  @override
  final PickupCoordinates coordinates;
  @override
  final String address;
  @override
  final String? notes;
  @override
  final String? cancellationReason;
  @override
  final String? cancelledAt;
  @override
  final String? completedAt;
  final List<MatchingEvent> _matchingTimeline;
  @override
  @JsonKey()
  List<MatchingEvent> get matchingTimeline {
    if (_matchingTimeline is EqualUnmodifiableListView)
      return _matchingTimeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchingTimeline);
  }

  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'PickupRequest(id: $id, userId: $userId, userName: $userName, userPhone: $userPhone, city: $city, zone: $zone, pickupMode: $pickupMode, matchType: $matchType, wasteType: $wasteType, estimatedWeight: $estimatedWeight, status: $status, assignedAgentId: $assignedAgentId, assignedAgentName: $assignedAgentName, slaDeadline: $slaDeadline, pricing: $pricing, coordinates: $coordinates, address: $address, notes: $notes, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, completedAt: $completedAt, matchingTimeline: $matchingTimeline, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zone, zone) || other.zone == zone) &&
            (identical(other.pickupMode, pickupMode) ||
                other.pickupMode == pickupMode) &&
            (identical(other.matchType, matchType) ||
                other.matchType == matchType) &&
            (identical(other.wasteType, wasteType) ||
                other.wasteType == wasteType) &&
            (identical(other.estimatedWeight, estimatedWeight) ||
                other.estimatedWeight == estimatedWeight) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedAgentId, assignedAgentId) ||
                other.assignedAgentId == assignedAgentId) &&
            (identical(other.assignedAgentName, assignedAgentName) ||
                other.assignedAgentName == assignedAgentName) &&
            (identical(other.slaDeadline, slaDeadline) ||
                other.slaDeadline == slaDeadline) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality()
                .equals(other._matchingTimeline, _matchingTimeline) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        userName,
        userPhone,
        city,
        zone,
        pickupMode,
        matchType,
        wasteType,
        estimatedWeight,
        status,
        assignedAgentId,
        assignedAgentName,
        slaDeadline,
        pricing,
        coordinates,
        address,
        notes,
        cancellationReason,
        cancelledAt,
        completedAt,
        const DeepCollectionEquality().hash(_matchingTimeline),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of PickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupRequestImplCopyWith<_$PickupRequestImpl> get copyWith =>
      __$$PickupRequestImplCopyWithImpl<_$PickupRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickupRequestImplToJson(
      this,
    );
  }
}

abstract class _PickupRequest implements PickupRequest {
  const factory _PickupRequest(
      {required final String id,
      required final String userId,
      required final String userName,
      final String? userPhone,
      final String? city,
      final String? zone,
      required final String pickupMode,
      required final String matchType,
      required final String wasteType,
      required final double estimatedWeight,
      required final String status,
      final String? assignedAgentId,
      final String? assignedAgentName,
      final String? slaDeadline,
      final PickupPricing? pricing,
      required final PickupCoordinates coordinates,
      required final String address,
      final String? notes,
      final String? cancellationReason,
      final String? cancelledAt,
      final String? completedAt,
      final List<MatchingEvent> matchingTimeline,
      final String? createdAt,
      final String? updatedAt}) = _$PickupRequestImpl;

  factory _PickupRequest.fromJson(Map<String, dynamic> json) =
      _$PickupRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String? get userPhone;
  @override
  String? get city;
  @override
  String? get zone;
  @override
  String get pickupMode;
  @override
  String get matchType;
  @override
  String get wasteType;
  @override
  double get estimatedWeight;
  @override
  String get status;
  @override
  String? get assignedAgentId;
  @override
  String? get assignedAgentName;
  @override
  String? get slaDeadline;
  @override
  PickupPricing? get pricing;
  @override
  PickupCoordinates get coordinates;
  @override
  String get address;
  @override
  String? get notes;
  @override
  String? get cancellationReason;
  @override
  String? get cancelledAt;
  @override
  String? get completedAt;
  @override
  List<MatchingEvent> get matchingTimeline;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of PickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupRequestImplCopyWith<_$PickupRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PickupPricing _$PickupPricingFromJson(Map<String, dynamic> json) {
  return _PickupPricing.fromJson(json);
}

/// @nodoc
mixin _$PickupPricing {
  double get baseAmount => throw _privateConstructorUsedError;
  double get bonusAmount => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this PickupPricing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PickupPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickupPricingCopyWith<PickupPricing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupPricingCopyWith<$Res> {
  factory $PickupPricingCopyWith(
          PickupPricing value, $Res Function(PickupPricing) then) =
      _$PickupPricingCopyWithImpl<$Res, PickupPricing>;
  @useResult
  $Res call(
      {double baseAmount,
      double bonusAmount,
      double totalAmount,
      String currency});
}

/// @nodoc
class _$PickupPricingCopyWithImpl<$Res, $Val extends PickupPricing>
    implements $PickupPricingCopyWith<$Res> {
  _$PickupPricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickupPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseAmount = null,
    Object? bonusAmount = null,
    Object? totalAmount = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      baseAmount: null == baseAmount
          ? _value.baseAmount
          : baseAmount // ignore: cast_nullable_to_non_nullable
              as double,
      bonusAmount: null == bonusAmount
          ? _value.bonusAmount
          : bonusAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PickupPricingImplCopyWith<$Res>
    implements $PickupPricingCopyWith<$Res> {
  factory _$$PickupPricingImplCopyWith(
          _$PickupPricingImpl value, $Res Function(_$PickupPricingImpl) then) =
      __$$PickupPricingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double baseAmount,
      double bonusAmount,
      double totalAmount,
      String currency});
}

/// @nodoc
class __$$PickupPricingImplCopyWithImpl<$Res>
    extends _$PickupPricingCopyWithImpl<$Res, _$PickupPricingImpl>
    implements _$$PickupPricingImplCopyWith<$Res> {
  __$$PickupPricingImplCopyWithImpl(
      _$PickupPricingImpl _value, $Res Function(_$PickupPricingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PickupPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseAmount = null,
    Object? bonusAmount = null,
    Object? totalAmount = null,
    Object? currency = null,
  }) {
    return _then(_$PickupPricingImpl(
      baseAmount: null == baseAmount
          ? _value.baseAmount
          : baseAmount // ignore: cast_nullable_to_non_nullable
              as double,
      bonusAmount: null == bonusAmount
          ? _value.bonusAmount
          : bonusAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PickupPricingImpl implements _PickupPricing {
  const _$PickupPricingImpl(
      {required this.baseAmount,
      required this.bonusAmount,
      required this.totalAmount,
      required this.currency});

  factory _$PickupPricingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickupPricingImplFromJson(json);

  @override
  final double baseAmount;
  @override
  final double bonusAmount;
  @override
  final double totalAmount;
  @override
  final String currency;

  @override
  String toString() {
    return 'PickupPricing(baseAmount: $baseAmount, bonusAmount: $bonusAmount, totalAmount: $totalAmount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupPricingImpl &&
            (identical(other.baseAmount, baseAmount) ||
                other.baseAmount == baseAmount) &&
            (identical(other.bonusAmount, bonusAmount) ||
                other.bonusAmount == bonusAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, baseAmount, bonusAmount, totalAmount, currency);

  /// Create a copy of PickupPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupPricingImplCopyWith<_$PickupPricingImpl> get copyWith =>
      __$$PickupPricingImplCopyWithImpl<_$PickupPricingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickupPricingImplToJson(
      this,
    );
  }
}

abstract class _PickupPricing implements PickupPricing {
  const factory _PickupPricing(
      {required final double baseAmount,
      required final double bonusAmount,
      required final double totalAmount,
      required final String currency}) = _$PickupPricingImpl;

  factory _PickupPricing.fromJson(Map<String, dynamic> json) =
      _$PickupPricingImpl.fromJson;

  @override
  double get baseAmount;
  @override
  double get bonusAmount;
  @override
  double get totalAmount;
  @override
  String get currency;

  /// Create a copy of PickupPricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupPricingImplCopyWith<_$PickupPricingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PickupCoordinates _$PickupCoordinatesFromJson(Map<String, dynamic> json) {
  return _PickupCoordinates.fromJson(json);
}

/// @nodoc
mixin _$PickupCoordinates {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this PickupCoordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PickupCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickupCoordinatesCopyWith<PickupCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupCoordinatesCopyWith<$Res> {
  factory $PickupCoordinatesCopyWith(
          PickupCoordinates value, $Res Function(PickupCoordinates) then) =
      _$PickupCoordinatesCopyWithImpl<$Res, PickupCoordinates>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$PickupCoordinatesCopyWithImpl<$Res, $Val extends PickupCoordinates>
    implements $PickupCoordinatesCopyWith<$Res> {
  _$PickupCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickupCoordinates
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
abstract class _$$PickupCoordinatesImplCopyWith<$Res>
    implements $PickupCoordinatesCopyWith<$Res> {
  factory _$$PickupCoordinatesImplCopyWith(_$PickupCoordinatesImpl value,
          $Res Function(_$PickupCoordinatesImpl) then) =
      __$$PickupCoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$PickupCoordinatesImplCopyWithImpl<$Res>
    extends _$PickupCoordinatesCopyWithImpl<$Res, _$PickupCoordinatesImpl>
    implements _$$PickupCoordinatesImplCopyWith<$Res> {
  __$$PickupCoordinatesImplCopyWithImpl(_$PickupCoordinatesImpl _value,
      $Res Function(_$PickupCoordinatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PickupCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$PickupCoordinatesImpl(
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
class _$PickupCoordinatesImpl implements _PickupCoordinates {
  const _$PickupCoordinatesImpl({required this.lat, required this.lng});

  factory _$PickupCoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickupCoordinatesImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'PickupCoordinates(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupCoordinatesImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of PickupCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupCoordinatesImplCopyWith<_$PickupCoordinatesImpl> get copyWith =>
      __$$PickupCoordinatesImplCopyWithImpl<_$PickupCoordinatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickupCoordinatesImplToJson(
      this,
    );
  }
}

abstract class _PickupCoordinates implements PickupCoordinates {
  const factory _PickupCoordinates(
      {required final double lat,
      required final double lng}) = _$PickupCoordinatesImpl;

  factory _PickupCoordinates.fromJson(Map<String, dynamic> json) =
      _$PickupCoordinatesImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of PickupCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupCoordinatesImplCopyWith<_$PickupCoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchingEvent _$MatchingEventFromJson(Map<String, dynamic> json) {
  return _MatchingEvent.fromJson(json);
}

/// @nodoc
mixin _$MatchingEvent {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  String? get agentId => throw _privateConstructorUsedError;
  String? get agentName => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  /// Serializes this MatchingEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingEventCopyWith<MatchingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingEventCopyWith<$Res> {
  factory $MatchingEventCopyWith(
          MatchingEvent value, $Res Function(MatchingEvent) then) =
      _$MatchingEventCopyWithImpl<$Res, MatchingEvent>;
  @useResult
  $Res call(
      {String id,
      String type,
      String timestamp,
      String? agentId,
      String? agentName,
      String? details});
}

/// @nodoc
class _$MatchingEventCopyWithImpl<$Res, $Val extends MatchingEvent>
    implements $MatchingEventCopyWith<$Res> {
  _$MatchingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? timestamp = null,
    Object? agentId = freezed,
    Object? agentName = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: freezed == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String?,
      agentName: freezed == agentName
          ? _value.agentName
          : agentName // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchingEventImplCopyWith<$Res>
    implements $MatchingEventCopyWith<$Res> {
  factory _$$MatchingEventImplCopyWith(
          _$MatchingEventImpl value, $Res Function(_$MatchingEventImpl) then) =
      __$$MatchingEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String timestamp,
      String? agentId,
      String? agentName,
      String? details});
}

/// @nodoc
class __$$MatchingEventImplCopyWithImpl<$Res>
    extends _$MatchingEventCopyWithImpl<$Res, _$MatchingEventImpl>
    implements _$$MatchingEventImplCopyWith<$Res> {
  __$$MatchingEventImplCopyWithImpl(
      _$MatchingEventImpl _value, $Res Function(_$MatchingEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? timestamp = null,
    Object? agentId = freezed,
    Object? agentName = freezed,
    Object? details = freezed,
  }) {
    return _then(_$MatchingEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: freezed == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String?,
      agentName: freezed == agentName
          ? _value.agentName
          : agentName // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingEventImpl implements _MatchingEvent {
  const _$MatchingEventImpl(
      {required this.id,
      required this.type,
      required this.timestamp,
      this.agentId,
      this.agentName,
      this.details});

  factory _$MatchingEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingEventImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String timestamp;
  @override
  final String? agentId;
  @override
  final String? agentName;
  @override
  final String? details;

  @override
  String toString() {
    return 'MatchingEvent(id: $id, type: $type, timestamp: $timestamp, agentId: $agentId, agentName: $agentName, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.agentName, agentName) ||
                other.agentName == agentName) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, timestamp, agentId, agentName, details);

  /// Create a copy of MatchingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingEventImplCopyWith<_$MatchingEventImpl> get copyWith =>
      __$$MatchingEventImplCopyWithImpl<_$MatchingEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingEventImplToJson(
      this,
    );
  }
}

abstract class _MatchingEvent implements MatchingEvent {
  const factory _MatchingEvent(
      {required final String id,
      required final String type,
      required final String timestamp,
      final String? agentId,
      final String? agentName,
      final String? details}) = _$MatchingEventImpl;

  factory _MatchingEvent.fromJson(Map<String, dynamic> json) =
      _$MatchingEventImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get timestamp;
  @override
  String? get agentId;
  @override
  String? get agentName;
  @override
  String? get details;

  /// Create a copy of MatchingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingEventImplCopyWith<_$MatchingEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
