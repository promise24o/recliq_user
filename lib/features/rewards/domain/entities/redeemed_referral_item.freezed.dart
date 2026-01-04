// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeemed_referral_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RedeemedReferralItem _$RedeemedReferralItemFromJson(Map<String, dynamic> json) {
  return _RedeemedReferralItem.fromJson(json);
}

/// @nodoc
mixin _$RedeemedReferralItem {
  String get id => throw _privateConstructorUsedError;
  int get pointsAwarded => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this RedeemedReferralItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RedeemedReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RedeemedReferralItemCopyWith<RedeemedReferralItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemedReferralItemCopyWith<$Res> {
  factory $RedeemedReferralItemCopyWith(RedeemedReferralItem value,
          $Res Function(RedeemedReferralItem) then) =
      _$RedeemedReferralItemCopyWithImpl<$Res, RedeemedReferralItem>;
  @useResult
  $Res call({String id, int pointsAwarded, double amount});
}

/// @nodoc
class _$RedeemedReferralItemCopyWithImpl<$Res,
        $Val extends RedeemedReferralItem>
    implements $RedeemedReferralItemCopyWith<$Res> {
  _$RedeemedReferralItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RedeemedReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pointsAwarded = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pointsAwarded: null == pointsAwarded
          ? _value.pointsAwarded
          : pointsAwarded // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RedeemedReferralItemImplCopyWith<$Res>
    implements $RedeemedReferralItemCopyWith<$Res> {
  factory _$$RedeemedReferralItemImplCopyWith(_$RedeemedReferralItemImpl value,
          $Res Function(_$RedeemedReferralItemImpl) then) =
      __$$RedeemedReferralItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int pointsAwarded, double amount});
}

/// @nodoc
class __$$RedeemedReferralItemImplCopyWithImpl<$Res>
    extends _$RedeemedReferralItemCopyWithImpl<$Res, _$RedeemedReferralItemImpl>
    implements _$$RedeemedReferralItemImplCopyWith<$Res> {
  __$$RedeemedReferralItemImplCopyWithImpl(_$RedeemedReferralItemImpl _value,
      $Res Function(_$RedeemedReferralItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of RedeemedReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pointsAwarded = null,
    Object? amount = null,
  }) {
    return _then(_$RedeemedReferralItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pointsAwarded: null == pointsAwarded
          ? _value.pointsAwarded
          : pointsAwarded // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RedeemedReferralItemImpl implements _RedeemedReferralItem {
  const _$RedeemedReferralItemImpl(
      {required this.id, required this.pointsAwarded, required this.amount});

  factory _$RedeemedReferralItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedeemedReferralItemImplFromJson(json);

  @override
  final String id;
  @override
  final int pointsAwarded;
  @override
  final double amount;

  @override
  String toString() {
    return 'RedeemedReferralItem(id: $id, pointsAwarded: $pointsAwarded, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedeemedReferralItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pointsAwarded, pointsAwarded) ||
                other.pointsAwarded == pointsAwarded) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pointsAwarded, amount);

  /// Create a copy of RedeemedReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedeemedReferralItemImplCopyWith<_$RedeemedReferralItemImpl>
      get copyWith =>
          __$$RedeemedReferralItemImplCopyWithImpl<_$RedeemedReferralItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RedeemedReferralItemImplToJson(
      this,
    );
  }
}

abstract class _RedeemedReferralItem implements RedeemedReferralItem {
  const factory _RedeemedReferralItem(
      {required final String id,
      required final int pointsAwarded,
      required final double amount}) = _$RedeemedReferralItemImpl;

  factory _RedeemedReferralItem.fromJson(Map<String, dynamic> json) =
      _$RedeemedReferralItemImpl.fromJson;

  @override
  String get id;
  @override
  int get pointsAwarded;
  @override
  double get amount;

  /// Create a copy of RedeemedReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedeemedReferralItemImplCopyWith<_$RedeemedReferralItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
