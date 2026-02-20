// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KycStatus _$KycStatusFromJson(Map<String, dynamic> json) {
  return _KycStatus.fromJson(json);
}

/// @nodoc
mixin _$KycStatus {
  String get userId => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;
  String get currentTier => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  bool get bvnVerified => throw _privateConstructorUsedError;
  bool get documentsUploaded => throw _privateConstructorUsedError;
  bool get selfieUploaded => throw _privateConstructorUsedError;
  bool get businessDocumentsUploaded => throw _privateConstructorUsedError;
  KycLimits get limits => throw _privateConstructorUsedError;
  List<String> get availableTiers => throw _privateConstructorUsedError;
  List<String> get nextTierRequirements => throw _privateConstructorUsedError;

  /// Serializes this KycStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KycStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KycStatusCopyWith<KycStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycStatusCopyWith<$Res> {
  factory $KycStatusCopyWith(KycStatus value, $Res Function(KycStatus) then) =
      _$KycStatusCopyWithImpl<$Res, KycStatus>;
  @useResult
  $Res call(
      {String userId,
      String userType,
      String currentTier,
      String status,
      bool emailVerified,
      bool bvnVerified,
      bool documentsUploaded,
      bool selfieUploaded,
      bool businessDocumentsUploaded,
      KycLimits limits,
      List<String> availableTiers,
      List<String> nextTierRequirements});

  $KycLimitsCopyWith<$Res> get limits;
}

/// @nodoc
class _$KycStatusCopyWithImpl<$Res, $Val extends KycStatus>
    implements $KycStatusCopyWith<$Res> {
  _$KycStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KycStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userType = null,
    Object? currentTier = null,
    Object? status = null,
    Object? emailVerified = null,
    Object? bvnVerified = null,
    Object? documentsUploaded = null,
    Object? selfieUploaded = null,
    Object? businessDocumentsUploaded = null,
    Object? limits = null,
    Object? availableTiers = null,
    Object? nextTierRequirements = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      currentTier: null == currentTier
          ? _value.currentTier
          : currentTier // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      bvnVerified: null == bvnVerified
          ? _value.bvnVerified
          : bvnVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      documentsUploaded: null == documentsUploaded
          ? _value.documentsUploaded
          : documentsUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      selfieUploaded: null == selfieUploaded
          ? _value.selfieUploaded
          : selfieUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      businessDocumentsUploaded: null == businessDocumentsUploaded
          ? _value.businessDocumentsUploaded
          : businessDocumentsUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      limits: null == limits
          ? _value.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as KycLimits,
      availableTiers: null == availableTiers
          ? _value.availableTiers
          : availableTiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextTierRequirements: null == nextTierRequirements
          ? _value.nextTierRequirements
          : nextTierRequirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of KycStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KycLimitsCopyWith<$Res> get limits {
    return $KycLimitsCopyWith<$Res>(_value.limits, (value) {
      return _then(_value.copyWith(limits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KycStatusImplCopyWith<$Res>
    implements $KycStatusCopyWith<$Res> {
  factory _$$KycStatusImplCopyWith(
          _$KycStatusImpl value, $Res Function(_$KycStatusImpl) then) =
      __$$KycStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userType,
      String currentTier,
      String status,
      bool emailVerified,
      bool bvnVerified,
      bool documentsUploaded,
      bool selfieUploaded,
      bool businessDocumentsUploaded,
      KycLimits limits,
      List<String> availableTiers,
      List<String> nextTierRequirements});

  @override
  $KycLimitsCopyWith<$Res> get limits;
}

/// @nodoc
class __$$KycStatusImplCopyWithImpl<$Res>
    extends _$KycStatusCopyWithImpl<$Res, _$KycStatusImpl>
    implements _$$KycStatusImplCopyWith<$Res> {
  __$$KycStatusImplCopyWithImpl(
      _$KycStatusImpl _value, $Res Function(_$KycStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of KycStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userType = null,
    Object? currentTier = null,
    Object? status = null,
    Object? emailVerified = null,
    Object? bvnVerified = null,
    Object? documentsUploaded = null,
    Object? selfieUploaded = null,
    Object? businessDocumentsUploaded = null,
    Object? limits = null,
    Object? availableTiers = null,
    Object? nextTierRequirements = null,
  }) {
    return _then(_$KycStatusImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      currentTier: null == currentTier
          ? _value.currentTier
          : currentTier // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      bvnVerified: null == bvnVerified
          ? _value.bvnVerified
          : bvnVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      documentsUploaded: null == documentsUploaded
          ? _value.documentsUploaded
          : documentsUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      selfieUploaded: null == selfieUploaded
          ? _value.selfieUploaded
          : selfieUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      businessDocumentsUploaded: null == businessDocumentsUploaded
          ? _value.businessDocumentsUploaded
          : businessDocumentsUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      limits: null == limits
          ? _value.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as KycLimits,
      availableTiers: null == availableTiers
          ? _value._availableTiers
          : availableTiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextTierRequirements: null == nextTierRequirements
          ? _value._nextTierRequirements
          : nextTierRequirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycStatusImpl implements _KycStatus {
  const _$KycStatusImpl(
      {required this.userId,
      required this.userType,
      required this.currentTier,
      required this.status,
      required this.emailVerified,
      required this.bvnVerified,
      required this.documentsUploaded,
      required this.selfieUploaded,
      required this.businessDocumentsUploaded,
      required this.limits,
      required final List<String> availableTiers,
      required final List<String> nextTierRequirements})
      : _availableTiers = availableTiers,
        _nextTierRequirements = nextTierRequirements;

  factory _$KycStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycStatusImplFromJson(json);

  @override
  final String userId;
  @override
  final String userType;
  @override
  final String currentTier;
  @override
  final String status;
  @override
  final bool emailVerified;
  @override
  final bool bvnVerified;
  @override
  final bool documentsUploaded;
  @override
  final bool selfieUploaded;
  @override
  final bool businessDocumentsUploaded;
  @override
  final KycLimits limits;
  final List<String> _availableTiers;
  @override
  List<String> get availableTiers {
    if (_availableTiers is EqualUnmodifiableListView) return _availableTiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableTiers);
  }

  final List<String> _nextTierRequirements;
  @override
  List<String> get nextTierRequirements {
    if (_nextTierRequirements is EqualUnmodifiableListView)
      return _nextTierRequirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextTierRequirements);
  }

  @override
  String toString() {
    return 'KycStatus(userId: $userId, userType: $userType, currentTier: $currentTier, status: $status, emailVerified: $emailVerified, bvnVerified: $bvnVerified, documentsUploaded: $documentsUploaded, selfieUploaded: $selfieUploaded, businessDocumentsUploaded: $businessDocumentsUploaded, limits: $limits, availableTiers: $availableTiers, nextTierRequirements: $nextTierRequirements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycStatusImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.currentTier, currentTier) ||
                other.currentTier == currentTier) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.bvnVerified, bvnVerified) ||
                other.bvnVerified == bvnVerified) &&
            (identical(other.documentsUploaded, documentsUploaded) ||
                other.documentsUploaded == documentsUploaded) &&
            (identical(other.selfieUploaded, selfieUploaded) ||
                other.selfieUploaded == selfieUploaded) &&
            (identical(other.businessDocumentsUploaded,
                    businessDocumentsUploaded) ||
                other.businessDocumentsUploaded == businessDocumentsUploaded) &&
            (identical(other.limits, limits) || other.limits == limits) &&
            const DeepCollectionEquality()
                .equals(other._availableTiers, _availableTiers) &&
            const DeepCollectionEquality()
                .equals(other._nextTierRequirements, _nextTierRequirements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userType,
      currentTier,
      status,
      emailVerified,
      bvnVerified,
      documentsUploaded,
      selfieUploaded,
      businessDocumentsUploaded,
      limits,
      const DeepCollectionEquality().hash(_availableTiers),
      const DeepCollectionEquality().hash(_nextTierRequirements));

  /// Create a copy of KycStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KycStatusImplCopyWith<_$KycStatusImpl> get copyWith =>
      __$$KycStatusImplCopyWithImpl<_$KycStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycStatusImplToJson(
      this,
    );
  }
}

abstract class _KycStatus implements KycStatus {
  const factory _KycStatus(
      {required final String userId,
      required final String userType,
      required final String currentTier,
      required final String status,
      required final bool emailVerified,
      required final bool bvnVerified,
      required final bool documentsUploaded,
      required final bool selfieUploaded,
      required final bool businessDocumentsUploaded,
      required final KycLimits limits,
      required final List<String> availableTiers,
      required final List<String> nextTierRequirements}) = _$KycStatusImpl;

  factory _KycStatus.fromJson(Map<String, dynamic> json) =
      _$KycStatusImpl.fromJson;

  @override
  String get userId;
  @override
  String get userType;
  @override
  String get currentTier;
  @override
  String get status;
  @override
  bool get emailVerified;
  @override
  bool get bvnVerified;
  @override
  bool get documentsUploaded;
  @override
  bool get selfieUploaded;
  @override
  bool get businessDocumentsUploaded;
  @override
  KycLimits get limits;
  @override
  List<String> get availableTiers;
  @override
  List<String> get nextTierRequirements;

  /// Create a copy of KycStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KycStatusImplCopyWith<_$KycStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KycLimits _$KycLimitsFromJson(Map<String, dynamic> json) {
  return _KycLimits.fromJson(json);
}

/// @nodoc
mixin _$KycLimits {
  double get dailyWithdrawal => throw _privateConstructorUsedError;
  double get maxWalletBalance => throw _privateConstructorUsedError;

  /// Serializes this KycLimits to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KycLimits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KycLimitsCopyWith<KycLimits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycLimitsCopyWith<$Res> {
  factory $KycLimitsCopyWith(KycLimits value, $Res Function(KycLimits) then) =
      _$KycLimitsCopyWithImpl<$Res, KycLimits>;
  @useResult
  $Res call({double dailyWithdrawal, double maxWalletBalance});
}

/// @nodoc
class _$KycLimitsCopyWithImpl<$Res, $Val extends KycLimits>
    implements $KycLimitsCopyWith<$Res> {
  _$KycLimitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KycLimits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyWithdrawal = null,
    Object? maxWalletBalance = null,
  }) {
    return _then(_value.copyWith(
      dailyWithdrawal: null == dailyWithdrawal
          ? _value.dailyWithdrawal
          : dailyWithdrawal // ignore: cast_nullable_to_non_nullable
              as double,
      maxWalletBalance: null == maxWalletBalance
          ? _value.maxWalletBalance
          : maxWalletBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KycLimitsImplCopyWith<$Res>
    implements $KycLimitsCopyWith<$Res> {
  factory _$$KycLimitsImplCopyWith(
          _$KycLimitsImpl value, $Res Function(_$KycLimitsImpl) then) =
      __$$KycLimitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double dailyWithdrawal, double maxWalletBalance});
}

/// @nodoc
class __$$KycLimitsImplCopyWithImpl<$Res>
    extends _$KycLimitsCopyWithImpl<$Res, _$KycLimitsImpl>
    implements _$$KycLimitsImplCopyWith<$Res> {
  __$$KycLimitsImplCopyWithImpl(
      _$KycLimitsImpl _value, $Res Function(_$KycLimitsImpl) _then)
      : super(_value, _then);

  /// Create a copy of KycLimits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyWithdrawal = null,
    Object? maxWalletBalance = null,
  }) {
    return _then(_$KycLimitsImpl(
      dailyWithdrawal: null == dailyWithdrawal
          ? _value.dailyWithdrawal
          : dailyWithdrawal // ignore: cast_nullable_to_non_nullable
              as double,
      maxWalletBalance: null == maxWalletBalance
          ? _value.maxWalletBalance
          : maxWalletBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycLimitsImpl implements _KycLimits {
  const _$KycLimitsImpl(
      {required this.dailyWithdrawal, required this.maxWalletBalance});

  factory _$KycLimitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycLimitsImplFromJson(json);

  @override
  final double dailyWithdrawal;
  @override
  final double maxWalletBalance;

  @override
  String toString() {
    return 'KycLimits(dailyWithdrawal: $dailyWithdrawal, maxWalletBalance: $maxWalletBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycLimitsImpl &&
            (identical(other.dailyWithdrawal, dailyWithdrawal) ||
                other.dailyWithdrawal == dailyWithdrawal) &&
            (identical(other.maxWalletBalance, maxWalletBalance) ||
                other.maxWalletBalance == maxWalletBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dailyWithdrawal, maxWalletBalance);

  /// Create a copy of KycLimits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KycLimitsImplCopyWith<_$KycLimitsImpl> get copyWith =>
      __$$KycLimitsImplCopyWithImpl<_$KycLimitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycLimitsImplToJson(
      this,
    );
  }
}

abstract class _KycLimits implements KycLimits {
  const factory _KycLimits(
      {required final double dailyWithdrawal,
      required final double maxWalletBalance}) = _$KycLimitsImpl;

  factory _KycLimits.fromJson(Map<String, dynamic> json) =
      _$KycLimitsImpl.fromJson;

  @override
  double get dailyWithdrawal;
  @override
  double get maxWalletBalance;

  /// Create a copy of KycLimits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KycLimitsImplCopyWith<_$KycLimitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
