// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bvn_verification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BvnVerificationResponse _$BvnVerificationResponseFromJson(
    Map<String, dynamic> json) {
  return _BvnVerificationResponse.fromJson(json);
}

/// @nodoc
mixin _$BvnVerificationResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get tier => throw _privateConstructorUsedError;
  KycLimits get limits => throw _privateConstructorUsedError;

  /// Serializes this BvnVerificationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BvnVerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BvnVerificationResponseCopyWith<BvnVerificationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BvnVerificationResponseCopyWith<$Res> {
  factory $BvnVerificationResponseCopyWith(BvnVerificationResponse value,
          $Res Function(BvnVerificationResponse) then) =
      _$BvnVerificationResponseCopyWithImpl<$Res, BvnVerificationResponse>;
  @useResult
  $Res call({bool success, String message, String tier, KycLimits limits});

  $KycLimitsCopyWith<$Res> get limits;
}

/// @nodoc
class _$BvnVerificationResponseCopyWithImpl<$Res,
        $Val extends BvnVerificationResponse>
    implements $BvnVerificationResponseCopyWith<$Res> {
  _$BvnVerificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BvnVerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? tier = null,
    Object? limits = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      limits: null == limits
          ? _value.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as KycLimits,
    ) as $Val);
  }

  /// Create a copy of BvnVerificationResponse
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
abstract class _$$BvnVerificationResponseImplCopyWith<$Res>
    implements $BvnVerificationResponseCopyWith<$Res> {
  factory _$$BvnVerificationResponseImplCopyWith(
          _$BvnVerificationResponseImpl value,
          $Res Function(_$BvnVerificationResponseImpl) then) =
      __$$BvnVerificationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, String tier, KycLimits limits});

  @override
  $KycLimitsCopyWith<$Res> get limits;
}

/// @nodoc
class __$$BvnVerificationResponseImplCopyWithImpl<$Res>
    extends _$BvnVerificationResponseCopyWithImpl<$Res,
        _$BvnVerificationResponseImpl>
    implements _$$BvnVerificationResponseImplCopyWith<$Res> {
  __$$BvnVerificationResponseImplCopyWithImpl(
      _$BvnVerificationResponseImpl _value,
      $Res Function(_$BvnVerificationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BvnVerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? tier = null,
    Object? limits = null,
  }) {
    return _then(_$BvnVerificationResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      limits: null == limits
          ? _value.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as KycLimits,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BvnVerificationResponseImpl implements _BvnVerificationResponse {
  const _$BvnVerificationResponseImpl(
      {required this.success,
      required this.message,
      required this.tier,
      required this.limits});

  factory _$BvnVerificationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BvnVerificationResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final String tier;
  @override
  final KycLimits limits;

  @override
  String toString() {
    return 'BvnVerificationResponse(success: $success, message: $message, tier: $tier, limits: $limits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BvnVerificationResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.limits, limits) || other.limits == limits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, tier, limits);

  /// Create a copy of BvnVerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BvnVerificationResponseImplCopyWith<_$BvnVerificationResponseImpl>
      get copyWith => __$$BvnVerificationResponseImplCopyWithImpl<
          _$BvnVerificationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BvnVerificationResponseImplToJson(
      this,
    );
  }
}

abstract class _BvnVerificationResponse implements BvnVerificationResponse {
  const factory _BvnVerificationResponse(
      {required final bool success,
      required final String message,
      required final String tier,
      required final KycLimits limits}) = _$BvnVerificationResponseImpl;

  factory _BvnVerificationResponse.fromJson(Map<String, dynamic> json) =
      _$BvnVerificationResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  String get tier;
  @override
  KycLimits get limits;

  /// Create a copy of BvnVerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BvnVerificationResponseImplCopyWith<_$BvnVerificationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
