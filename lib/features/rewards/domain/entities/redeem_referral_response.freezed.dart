// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_referral_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RedeemReferralResponse _$RedeemReferralResponseFromJson(
    Map<String, dynamic> json) {
  return _RedeemReferralResponse.fromJson(json);
}

/// @nodoc
mixin _$RedeemReferralResponse {
  int get redeemedCount => throw _privateConstructorUsedError;
  int get totalPointsRedeemed => throw _privateConstructorUsedError;
  double get amountCredited => throw _privateConstructorUsedError;
  List<RedeemedReferralItem> get referrals =>
      throw _privateConstructorUsedError;

  /// Serializes this RedeemReferralResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RedeemReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RedeemReferralResponseCopyWith<RedeemReferralResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemReferralResponseCopyWith<$Res> {
  factory $RedeemReferralResponseCopyWith(RedeemReferralResponse value,
          $Res Function(RedeemReferralResponse) then) =
      _$RedeemReferralResponseCopyWithImpl<$Res, RedeemReferralResponse>;
  @useResult
  $Res call(
      {int redeemedCount,
      int totalPointsRedeemed,
      double amountCredited,
      List<RedeemedReferralItem> referrals});
}

/// @nodoc
class _$RedeemReferralResponseCopyWithImpl<$Res,
        $Val extends RedeemReferralResponse>
    implements $RedeemReferralResponseCopyWith<$Res> {
  _$RedeemReferralResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RedeemReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redeemedCount = null,
    Object? totalPointsRedeemed = null,
    Object? amountCredited = null,
    Object? referrals = null,
  }) {
    return _then(_value.copyWith(
      redeemedCount: null == redeemedCount
          ? _value.redeemedCount
          : redeemedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPointsRedeemed: null == totalPointsRedeemed
          ? _value.totalPointsRedeemed
          : totalPointsRedeemed // ignore: cast_nullable_to_non_nullable
              as int,
      amountCredited: null == amountCredited
          ? _value.amountCredited
          : amountCredited // ignore: cast_nullable_to_non_nullable
              as double,
      referrals: null == referrals
          ? _value.referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<RedeemedReferralItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RedeemReferralResponseImplCopyWith<$Res>
    implements $RedeemReferralResponseCopyWith<$Res> {
  factory _$$RedeemReferralResponseImplCopyWith(
          _$RedeemReferralResponseImpl value,
          $Res Function(_$RedeemReferralResponseImpl) then) =
      __$$RedeemReferralResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int redeemedCount,
      int totalPointsRedeemed,
      double amountCredited,
      List<RedeemedReferralItem> referrals});
}

/// @nodoc
class __$$RedeemReferralResponseImplCopyWithImpl<$Res>
    extends _$RedeemReferralResponseCopyWithImpl<$Res,
        _$RedeemReferralResponseImpl>
    implements _$$RedeemReferralResponseImplCopyWith<$Res> {
  __$$RedeemReferralResponseImplCopyWithImpl(
      _$RedeemReferralResponseImpl _value,
      $Res Function(_$RedeemReferralResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RedeemReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redeemedCount = null,
    Object? totalPointsRedeemed = null,
    Object? amountCredited = null,
    Object? referrals = null,
  }) {
    return _then(_$RedeemReferralResponseImpl(
      redeemedCount: null == redeemedCount
          ? _value.redeemedCount
          : redeemedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPointsRedeemed: null == totalPointsRedeemed
          ? _value.totalPointsRedeemed
          : totalPointsRedeemed // ignore: cast_nullable_to_non_nullable
              as int,
      amountCredited: null == amountCredited
          ? _value.amountCredited
          : amountCredited // ignore: cast_nullable_to_non_nullable
              as double,
      referrals: null == referrals
          ? _value._referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<RedeemedReferralItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RedeemReferralResponseImpl implements _RedeemReferralResponse {
  const _$RedeemReferralResponseImpl(
      {required this.redeemedCount,
      required this.totalPointsRedeemed,
      required this.amountCredited,
      required final List<RedeemedReferralItem> referrals})
      : _referrals = referrals;

  factory _$RedeemReferralResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedeemReferralResponseImplFromJson(json);

  @override
  final int redeemedCount;
  @override
  final int totalPointsRedeemed;
  @override
  final double amountCredited;
  final List<RedeemedReferralItem> _referrals;
  @override
  List<RedeemedReferralItem> get referrals {
    if (_referrals is EqualUnmodifiableListView) return _referrals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referrals);
  }

  @override
  String toString() {
    return 'RedeemReferralResponse(redeemedCount: $redeemedCount, totalPointsRedeemed: $totalPointsRedeemed, amountCredited: $amountCredited, referrals: $referrals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedeemReferralResponseImpl &&
            (identical(other.redeemedCount, redeemedCount) ||
                other.redeemedCount == redeemedCount) &&
            (identical(other.totalPointsRedeemed, totalPointsRedeemed) ||
                other.totalPointsRedeemed == totalPointsRedeemed) &&
            (identical(other.amountCredited, amountCredited) ||
                other.amountCredited == amountCredited) &&
            const DeepCollectionEquality()
                .equals(other._referrals, _referrals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      redeemedCount,
      totalPointsRedeemed,
      amountCredited,
      const DeepCollectionEquality().hash(_referrals));

  /// Create a copy of RedeemReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedeemReferralResponseImplCopyWith<_$RedeemReferralResponseImpl>
      get copyWith => __$$RedeemReferralResponseImplCopyWithImpl<
          _$RedeemReferralResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RedeemReferralResponseImplToJson(
      this,
    );
  }
}

abstract class _RedeemReferralResponse implements RedeemReferralResponse {
  const factory _RedeemReferralResponse(
          {required final int redeemedCount,
          required final int totalPointsRedeemed,
          required final double amountCredited,
          required final List<RedeemedReferralItem> referrals}) =
      _$RedeemReferralResponseImpl;

  factory _RedeemReferralResponse.fromJson(Map<String, dynamic> json) =
      _$RedeemReferralResponseImpl.fromJson;

  @override
  int get redeemedCount;
  @override
  int get totalPointsRedeemed;
  @override
  double get amountCredited;
  @override
  List<RedeemedReferralItem> get referrals;

  /// Create a copy of RedeemReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedeemReferralResponseImplCopyWith<_$RedeemReferralResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
