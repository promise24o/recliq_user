// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'coordinates')
  List<double>? get coordinates => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'coordinates') List<double>? coordinates,
      String? address,
      String? city,
      String? state,
      String? country});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'coordinates') List<double>? coordinates,
      String? address,
      String? city,
      String? state,
      String? country});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
  }) {
    return _then(_$LocationImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {@JsonKey(name: 'type') this.type,
      @JsonKey(name: 'coordinates') final List<double>? coordinates,
      this.address,
      this.city,
      this.state,
      this.country})
      : _coordinates = coordinates;

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String? type;
  final List<double>? _coordinates;
  @override
  @JsonKey(name: 'coordinates')
  List<double>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;

  @override
  String toString() {
    return 'Location(type: $type, coordinates: $coordinates, address: $address, city: $city, state: $state, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_coordinates),
      address,
      city,
      state,
      country);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {@JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'coordinates') final List<double>? coordinates,
      final String? address,
      final String? city,
      final String? state,
      final String? country}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'coordinates')
  List<double>? get coordinates;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get hasPin => throw _privateConstructorUsedError;
  double get walletBalance => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError; // Add PIN field
  Location? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifications')
  Notifications? get notifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'phone') String? phoneNumber,
      String? email,
      String? name,
      String? role,
      bool isVerified,
      bool hasPin,
      double walletBalance,
      String? profilePhoto,
      String? referralCode,
      String? pin,
      Location? location,
      @JsonKey(name: 'notifications') Notifications? notifications,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt});

  $LocationCopyWith<$Res>? get location;
  $NotificationsCopyWith<$Res>? get notifications;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? isVerified = null,
    Object? hasPin = null,
    Object? walletBalance = null,
    Object? profilePhoto = freezed,
    Object? referralCode = freezed,
    Object? pin = freezed,
    Object? location = freezed,
    Object? notifications = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPin: null == hasPin
          ? _value.hasPin
          : hasPin // ignore: cast_nullable_to_non_nullable
              as bool,
      walletBalance: null == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as double,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as Notifications?,
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

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationsCopyWith<$Res>? get notifications {
    if (_value.notifications == null) {
      return null;
    }

    return $NotificationsCopyWith<$Res>(_value.notifications!, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'phone') String? phoneNumber,
      String? email,
      String? name,
      String? role,
      bool isVerified,
      bool hasPin,
      double walletBalance,
      String? profilePhoto,
      String? referralCode,
      String? pin,
      Location? location,
      @JsonKey(name: 'notifications') Notifications? notifications,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $NotificationsCopyWith<$Res>? get notifications;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? isVerified = null,
    Object? hasPin = null,
    Object? walletBalance = null,
    Object? profilePhoto = freezed,
    Object? referralCode = freezed,
    Object? pin = freezed,
    Object? location = freezed,
    Object? notifications = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPin: null == hasPin
          ? _value.hasPin
          : hasPin // ignore: cast_nullable_to_non_nullable
              as bool,
      walletBalance: null == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as double,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as Notifications?,
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
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      @JsonKey(name: 'phone') this.phoneNumber,
      this.email,
      this.name,
      this.role,
      this.isVerified = false,
      this.hasPin = false,
      this.walletBalance = 0.0,
      this.profilePhoto,
      this.referralCode,
      this.pin,
      this.location,
      @JsonKey(name: 'notifications') this.notifications,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'phone')
  final String? phoneNumber;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? role;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool hasPin;
  @override
  @JsonKey()
  final double walletBalance;
  @override
  final String? profilePhoto;
  @override
  final String? referralCode;
  @override
  final String? pin;
// Add PIN field
  @override
  final Location? location;
  @override
  @JsonKey(name: 'notifications')
  final Notifications? notifications;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  @override
  String toString() {
    return 'User(id: $id, phoneNumber: $phoneNumber, email: $email, name: $name, role: $role, isVerified: $isVerified, hasPin: $hasPin, walletBalance: $walletBalance, profilePhoto: $profilePhoto, referralCode: $referralCode, pin: $pin, location: $location, notifications: $notifications, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.hasPin, hasPin) || other.hasPin == hasPin) &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phoneNumber,
      email,
      name,
      role,
      isVerified,
      hasPin,
      walletBalance,
      profilePhoto,
      referralCode,
      pin,
      location,
      notifications,
      createdAt,
      updatedAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      @JsonKey(name: 'phone') final String? phoneNumber,
      final String? email,
      final String? name,
      final String? role,
      final bool isVerified,
      final bool hasPin,
      final double walletBalance,
      final String? profilePhoto,
      final String? referralCode,
      final String? pin,
      final Location? location,
      @JsonKey(name: 'notifications') final Notifications? notifications,
      @JsonKey(name: 'createdAt') final String? createdAt,
      @JsonKey(name: 'updatedAt') final String? updatedAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'phone')
  String? get phoneNumber;
  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get role;
  @override
  bool get isVerified;
  @override
  bool get hasPin;
  @override
  double get walletBalance;
  @override
  String? get profilePhoto;
  @override
  String? get referralCode;
  @override
  String? get pin; // Add PIN field
  @override
  Location? get location;
  @override
  @JsonKey(name: 'notifications')
  Notifications? get notifications;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  String? get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return _Notifications.fromJson(json);
}

/// @nodoc
mixin _$Notifications {
  @JsonKey(name: 'loginAlerts')
  NotificationSettings? get loginAlerts => throw _privateConstructorUsedError;
  @JsonKey(name: 'passwordChanges')
  NotificationSettings? get passwordChanges =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'failedLoginAttempts')
  NotificationSettings? get failedLoginAttempts =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'pickupEscalations')
  NotificationSettings? get pickupEscalations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'agentStatusChanges')
  NotificationSettings? get agentStatusChanges =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentApprovals')
  NotificationSettings? get paymentApprovals =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'floatAlerts')
  NotificationSettings? get floatAlerts => throw _privateConstructorUsedError;
  @JsonKey(name: 'systemUpdates')
  NotificationSettings? get systemUpdates => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceUpdates')
  bool? get priceUpdates => throw _privateConstructorUsedError;
  @JsonKey(name: 'loginEmails')
  bool? get loginEmails => throw _privateConstructorUsedError;

  /// Serializes this Notifications to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsCopyWith<Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsCopyWith<$Res> {
  factory $NotificationsCopyWith(
          Notifications value, $Res Function(Notifications) then) =
      _$NotificationsCopyWithImpl<$Res, Notifications>;
  @useResult
  $Res call(
      {@JsonKey(name: 'loginAlerts') NotificationSettings? loginAlerts,
      @JsonKey(name: 'passwordChanges') NotificationSettings? passwordChanges,
      @JsonKey(name: 'failedLoginAttempts')
      NotificationSettings? failedLoginAttempts,
      @JsonKey(name: 'pickupEscalations')
      NotificationSettings? pickupEscalations,
      @JsonKey(name: 'agentStatusChanges')
      NotificationSettings? agentStatusChanges,
      @JsonKey(name: 'paymentApprovals') NotificationSettings? paymentApprovals,
      @JsonKey(name: 'floatAlerts') NotificationSettings? floatAlerts,
      @JsonKey(name: 'systemUpdates') NotificationSettings? systemUpdates,
      @JsonKey(name: 'priceUpdates') bool? priceUpdates,
      @JsonKey(name: 'loginEmails') bool? loginEmails});

  $NotificationSettingsCopyWith<$Res>? get loginAlerts;
  $NotificationSettingsCopyWith<$Res>? get passwordChanges;
  $NotificationSettingsCopyWith<$Res>? get failedLoginAttempts;
  $NotificationSettingsCopyWith<$Res>? get pickupEscalations;
  $NotificationSettingsCopyWith<$Res>? get agentStatusChanges;
  $NotificationSettingsCopyWith<$Res>? get paymentApprovals;
  $NotificationSettingsCopyWith<$Res>? get floatAlerts;
  $NotificationSettingsCopyWith<$Res>? get systemUpdates;
}

/// @nodoc
class _$NotificationsCopyWithImpl<$Res, $Val extends Notifications>
    implements $NotificationsCopyWith<$Res> {
  _$NotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginAlerts = freezed,
    Object? passwordChanges = freezed,
    Object? failedLoginAttempts = freezed,
    Object? pickupEscalations = freezed,
    Object? agentStatusChanges = freezed,
    Object? paymentApprovals = freezed,
    Object? floatAlerts = freezed,
    Object? systemUpdates = freezed,
    Object? priceUpdates = freezed,
    Object? loginEmails = freezed,
  }) {
    return _then(_value.copyWith(
      loginAlerts: freezed == loginAlerts
          ? _value.loginAlerts
          : loginAlerts // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      passwordChanges: freezed == passwordChanges
          ? _value.passwordChanges
          : passwordChanges // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      failedLoginAttempts: freezed == failedLoginAttempts
          ? _value.failedLoginAttempts
          : failedLoginAttempts // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      pickupEscalations: freezed == pickupEscalations
          ? _value.pickupEscalations
          : pickupEscalations // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      agentStatusChanges: freezed == agentStatusChanges
          ? _value.agentStatusChanges
          : agentStatusChanges // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      paymentApprovals: freezed == paymentApprovals
          ? _value.paymentApprovals
          : paymentApprovals // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      floatAlerts: freezed == floatAlerts
          ? _value.floatAlerts
          : floatAlerts // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      systemUpdates: freezed == systemUpdates
          ? _value.systemUpdates
          : systemUpdates // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      priceUpdates: freezed == priceUpdates
          ? _value.priceUpdates
          : priceUpdates // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginEmails: freezed == loginEmails
          ? _value.loginEmails
          : loginEmails // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get loginAlerts {
    if (_value.loginAlerts == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.loginAlerts!, (value) {
      return _then(_value.copyWith(loginAlerts: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get passwordChanges {
    if (_value.passwordChanges == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.passwordChanges!,
        (value) {
      return _then(_value.copyWith(passwordChanges: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get failedLoginAttempts {
    if (_value.failedLoginAttempts == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.failedLoginAttempts!,
        (value) {
      return _then(_value.copyWith(failedLoginAttempts: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get pickupEscalations {
    if (_value.pickupEscalations == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.pickupEscalations!,
        (value) {
      return _then(_value.copyWith(pickupEscalations: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get agentStatusChanges {
    if (_value.agentStatusChanges == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.agentStatusChanges!,
        (value) {
      return _then(_value.copyWith(agentStatusChanges: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get paymentApprovals {
    if (_value.paymentApprovals == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.paymentApprovals!,
        (value) {
      return _then(_value.copyWith(paymentApprovals: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get floatAlerts {
    if (_value.floatAlerts == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.floatAlerts!, (value) {
      return _then(_value.copyWith(floatAlerts: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get systemUpdates {
    if (_value.systemUpdates == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.systemUpdates!, (value) {
      return _then(_value.copyWith(systemUpdates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationsImplCopyWith<$Res>
    implements $NotificationsCopyWith<$Res> {
  factory _$$NotificationsImplCopyWith(
          _$NotificationsImpl value, $Res Function(_$NotificationsImpl) then) =
      __$$NotificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'loginAlerts') NotificationSettings? loginAlerts,
      @JsonKey(name: 'passwordChanges') NotificationSettings? passwordChanges,
      @JsonKey(name: 'failedLoginAttempts')
      NotificationSettings? failedLoginAttempts,
      @JsonKey(name: 'pickupEscalations')
      NotificationSettings? pickupEscalations,
      @JsonKey(name: 'agentStatusChanges')
      NotificationSettings? agentStatusChanges,
      @JsonKey(name: 'paymentApprovals') NotificationSettings? paymentApprovals,
      @JsonKey(name: 'floatAlerts') NotificationSettings? floatAlerts,
      @JsonKey(name: 'systemUpdates') NotificationSettings? systemUpdates,
      @JsonKey(name: 'priceUpdates') bool? priceUpdates,
      @JsonKey(name: 'loginEmails') bool? loginEmails});

  @override
  $NotificationSettingsCopyWith<$Res>? get loginAlerts;
  @override
  $NotificationSettingsCopyWith<$Res>? get passwordChanges;
  @override
  $NotificationSettingsCopyWith<$Res>? get failedLoginAttempts;
  @override
  $NotificationSettingsCopyWith<$Res>? get pickupEscalations;
  @override
  $NotificationSettingsCopyWith<$Res>? get agentStatusChanges;
  @override
  $NotificationSettingsCopyWith<$Res>? get paymentApprovals;
  @override
  $NotificationSettingsCopyWith<$Res>? get floatAlerts;
  @override
  $NotificationSettingsCopyWith<$Res>? get systemUpdates;
}

/// @nodoc
class __$$NotificationsImplCopyWithImpl<$Res>
    extends _$NotificationsCopyWithImpl<$Res, _$NotificationsImpl>
    implements _$$NotificationsImplCopyWith<$Res> {
  __$$NotificationsImplCopyWithImpl(
      _$NotificationsImpl _value, $Res Function(_$NotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginAlerts = freezed,
    Object? passwordChanges = freezed,
    Object? failedLoginAttempts = freezed,
    Object? pickupEscalations = freezed,
    Object? agentStatusChanges = freezed,
    Object? paymentApprovals = freezed,
    Object? floatAlerts = freezed,
    Object? systemUpdates = freezed,
    Object? priceUpdates = freezed,
    Object? loginEmails = freezed,
  }) {
    return _then(_$NotificationsImpl(
      loginAlerts: freezed == loginAlerts
          ? _value.loginAlerts
          : loginAlerts // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      passwordChanges: freezed == passwordChanges
          ? _value.passwordChanges
          : passwordChanges // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      failedLoginAttempts: freezed == failedLoginAttempts
          ? _value.failedLoginAttempts
          : failedLoginAttempts // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      pickupEscalations: freezed == pickupEscalations
          ? _value.pickupEscalations
          : pickupEscalations // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      agentStatusChanges: freezed == agentStatusChanges
          ? _value.agentStatusChanges
          : agentStatusChanges // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      paymentApprovals: freezed == paymentApprovals
          ? _value.paymentApprovals
          : paymentApprovals // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      floatAlerts: freezed == floatAlerts
          ? _value.floatAlerts
          : floatAlerts // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      systemUpdates: freezed == systemUpdates
          ? _value.systemUpdates
          : systemUpdates // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      priceUpdates: freezed == priceUpdates
          ? _value.priceUpdates
          : priceUpdates // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginEmails: freezed == loginEmails
          ? _value.loginEmails
          : loginEmails // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsImpl implements _Notifications {
  const _$NotificationsImpl(
      {@JsonKey(name: 'loginAlerts') this.loginAlerts,
      @JsonKey(name: 'passwordChanges') this.passwordChanges,
      @JsonKey(name: 'failedLoginAttempts') this.failedLoginAttempts,
      @JsonKey(name: 'pickupEscalations') this.pickupEscalations,
      @JsonKey(name: 'agentStatusChanges') this.agentStatusChanges,
      @JsonKey(name: 'paymentApprovals') this.paymentApprovals,
      @JsonKey(name: 'floatAlerts') this.floatAlerts,
      @JsonKey(name: 'systemUpdates') this.systemUpdates,
      @JsonKey(name: 'priceUpdates') this.priceUpdates,
      @JsonKey(name: 'loginEmails') this.loginEmails});

  factory _$NotificationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsImplFromJson(json);

  @override
  @JsonKey(name: 'loginAlerts')
  final NotificationSettings? loginAlerts;
  @override
  @JsonKey(name: 'passwordChanges')
  final NotificationSettings? passwordChanges;
  @override
  @JsonKey(name: 'failedLoginAttempts')
  final NotificationSettings? failedLoginAttempts;
  @override
  @JsonKey(name: 'pickupEscalations')
  final NotificationSettings? pickupEscalations;
  @override
  @JsonKey(name: 'agentStatusChanges')
  final NotificationSettings? agentStatusChanges;
  @override
  @JsonKey(name: 'paymentApprovals')
  final NotificationSettings? paymentApprovals;
  @override
  @JsonKey(name: 'floatAlerts')
  final NotificationSettings? floatAlerts;
  @override
  @JsonKey(name: 'systemUpdates')
  final NotificationSettings? systemUpdates;
  @override
  @JsonKey(name: 'priceUpdates')
  final bool? priceUpdates;
  @override
  @JsonKey(name: 'loginEmails')
  final bool? loginEmails;

  @override
  String toString() {
    return 'Notifications(loginAlerts: $loginAlerts, passwordChanges: $passwordChanges, failedLoginAttempts: $failedLoginAttempts, pickupEscalations: $pickupEscalations, agentStatusChanges: $agentStatusChanges, paymentApprovals: $paymentApprovals, floatAlerts: $floatAlerts, systemUpdates: $systemUpdates, priceUpdates: $priceUpdates, loginEmails: $loginEmails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsImpl &&
            (identical(other.loginAlerts, loginAlerts) ||
                other.loginAlerts == loginAlerts) &&
            (identical(other.passwordChanges, passwordChanges) ||
                other.passwordChanges == passwordChanges) &&
            (identical(other.failedLoginAttempts, failedLoginAttempts) ||
                other.failedLoginAttempts == failedLoginAttempts) &&
            (identical(other.pickupEscalations, pickupEscalations) ||
                other.pickupEscalations == pickupEscalations) &&
            (identical(other.agentStatusChanges, agentStatusChanges) ||
                other.agentStatusChanges == agentStatusChanges) &&
            (identical(other.paymentApprovals, paymentApprovals) ||
                other.paymentApprovals == paymentApprovals) &&
            (identical(other.floatAlerts, floatAlerts) ||
                other.floatAlerts == floatAlerts) &&
            (identical(other.systemUpdates, systemUpdates) ||
                other.systemUpdates == systemUpdates) &&
            (identical(other.priceUpdates, priceUpdates) ||
                other.priceUpdates == priceUpdates) &&
            (identical(other.loginEmails, loginEmails) ||
                other.loginEmails == loginEmails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      loginAlerts,
      passwordChanges,
      failedLoginAttempts,
      pickupEscalations,
      agentStatusChanges,
      paymentApprovals,
      floatAlerts,
      systemUpdates,
      priceUpdates,
      loginEmails);

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsImplCopyWith<_$NotificationsImpl> get copyWith =>
      __$$NotificationsImplCopyWithImpl<_$NotificationsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsImplToJson(
      this,
    );
  }
}

abstract class _Notifications implements Notifications {
  const factory _Notifications(
      {@JsonKey(name: 'loginAlerts') final NotificationSettings? loginAlerts,
      @JsonKey(name: 'passwordChanges')
      final NotificationSettings? passwordChanges,
      @JsonKey(name: 'failedLoginAttempts')
      final NotificationSettings? failedLoginAttempts,
      @JsonKey(name: 'pickupEscalations')
      final NotificationSettings? pickupEscalations,
      @JsonKey(name: 'agentStatusChanges')
      final NotificationSettings? agentStatusChanges,
      @JsonKey(name: 'paymentApprovals')
      final NotificationSettings? paymentApprovals,
      @JsonKey(name: 'floatAlerts') final NotificationSettings? floatAlerts,
      @JsonKey(name: 'systemUpdates') final NotificationSettings? systemUpdates,
      @JsonKey(name: 'priceUpdates') final bool? priceUpdates,
      @JsonKey(name: 'loginEmails')
      final bool? loginEmails}) = _$NotificationsImpl;

  factory _Notifications.fromJson(Map<String, dynamic> json) =
      _$NotificationsImpl.fromJson;

  @override
  @JsonKey(name: 'loginAlerts')
  NotificationSettings? get loginAlerts;
  @override
  @JsonKey(name: 'passwordChanges')
  NotificationSettings? get passwordChanges;
  @override
  @JsonKey(name: 'failedLoginAttempts')
  NotificationSettings? get failedLoginAttempts;
  @override
  @JsonKey(name: 'pickupEscalations')
  NotificationSettings? get pickupEscalations;
  @override
  @JsonKey(name: 'agentStatusChanges')
  NotificationSettings? get agentStatusChanges;
  @override
  @JsonKey(name: 'paymentApprovals')
  NotificationSettings? get paymentApprovals;
  @override
  @JsonKey(name: 'floatAlerts')
  NotificationSettings? get floatAlerts;
  @override
  @JsonKey(name: 'systemUpdates')
  NotificationSettings? get systemUpdates;
  @override
  @JsonKey(name: 'priceUpdates')
  bool? get priceUpdates;
  @override
  @JsonKey(name: 'loginEmails')
  bool? get loginEmails;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsImplCopyWith<_$NotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool? get email => throw _privateConstructorUsedError;
  bool? get inApp => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call({bool? email, bool? inApp});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res,
        $Val extends NotificationSettings>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? inApp = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as bool?,
      inApp: freezed == inApp
          ? _value.inApp
          : inApp // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(_$NotificationSettingsImpl value,
          $Res Function(_$NotificationSettingsImpl) then) =
      __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? email, bool? inApp});
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(_$NotificationSettingsImpl _value,
      $Res Function(_$NotificationSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? inApp = freezed,
  }) {
    return _then(_$NotificationSettingsImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as bool?,
      inApp: freezed == inApp
          ? _value.inApp
          : inApp // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl({this.email, this.inApp});

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  final bool? email;
  @override
  final bool? inApp;

  @override
  String toString() {
    return 'NotificationSettings(email: $email, inApp: $inApp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.inApp, inApp) || other.inApp == inApp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, inApp);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith =>
          __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings({final bool? email, final bool? inApp}) =
      _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool? get email;
  @override
  bool? get inApp;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
