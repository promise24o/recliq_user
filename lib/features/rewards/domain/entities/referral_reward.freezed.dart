// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferralReward _$ReferralRewardFromJson(Map<String, dynamic> json) {
  return _ReferralReward.fromJson(json);
}

/// @nodoc
mixin _$ReferralReward {
  int get totalReferrals => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;
  List<ReferralInfo> get referrals => throw _privateConstructorUsedError;

  /// Serializes this ReferralReward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralRewardCopyWith<ReferralReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralRewardCopyWith<$Res> {
  factory $ReferralRewardCopyWith(
          ReferralReward value, $Res Function(ReferralReward) then) =
      _$ReferralRewardCopyWithImpl<$Res, ReferralReward>;
  @useResult
  $Res call(
      {int totalReferrals, int pointsEarned, List<ReferralInfo> referrals});
}

/// @nodoc
class _$ReferralRewardCopyWithImpl<$Res, $Val extends ReferralReward>
    implements $ReferralRewardCopyWith<$Res> {
  _$ReferralRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferrals = null,
    Object? pointsEarned = null,
    Object? referrals = null,
  }) {
    return _then(_value.copyWith(
      totalReferrals: null == totalReferrals
          ? _value.totalReferrals
          : totalReferrals // ignore: cast_nullable_to_non_nullable
              as int,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      referrals: null == referrals
          ? _value.referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<ReferralInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralRewardImplCopyWith<$Res>
    implements $ReferralRewardCopyWith<$Res> {
  factory _$$ReferralRewardImplCopyWith(_$ReferralRewardImpl value,
          $Res Function(_$ReferralRewardImpl) then) =
      __$$ReferralRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalReferrals, int pointsEarned, List<ReferralInfo> referrals});
}

/// @nodoc
class __$$ReferralRewardImplCopyWithImpl<$Res>
    extends _$ReferralRewardCopyWithImpl<$Res, _$ReferralRewardImpl>
    implements _$$ReferralRewardImplCopyWith<$Res> {
  __$$ReferralRewardImplCopyWithImpl(
      _$ReferralRewardImpl _value, $Res Function(_$ReferralRewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferrals = null,
    Object? pointsEarned = null,
    Object? referrals = null,
  }) {
    return _then(_$ReferralRewardImpl(
      totalReferrals: null == totalReferrals
          ? _value.totalReferrals
          : totalReferrals // ignore: cast_nullable_to_non_nullable
              as int,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      referrals: null == referrals
          ? _value._referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<ReferralInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralRewardImpl implements _ReferralReward {
  const _$ReferralRewardImpl(
      {required this.totalReferrals,
      required this.pointsEarned,
      required final List<ReferralInfo> referrals})
      : _referrals = referrals;

  factory _$ReferralRewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralRewardImplFromJson(json);

  @override
  final int totalReferrals;
  @override
  final int pointsEarned;
  final List<ReferralInfo> _referrals;
  @override
  List<ReferralInfo> get referrals {
    if (_referrals is EqualUnmodifiableListView) return _referrals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referrals);
  }

  @override
  String toString() {
    return 'ReferralReward(totalReferrals: $totalReferrals, pointsEarned: $pointsEarned, referrals: $referrals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralRewardImpl &&
            (identical(other.totalReferrals, totalReferrals) ||
                other.totalReferrals == totalReferrals) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            const DeepCollectionEquality()
                .equals(other._referrals, _referrals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalReferrals, pointsEarned,
      const DeepCollectionEquality().hash(_referrals));

  /// Create a copy of ReferralReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralRewardImplCopyWith<_$ReferralRewardImpl> get copyWith =>
      __$$ReferralRewardImplCopyWithImpl<_$ReferralRewardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralRewardImplToJson(
      this,
    );
  }
}

abstract class _ReferralReward implements ReferralReward {
  const factory _ReferralReward(
      {required final int totalReferrals,
      required final int pointsEarned,
      required final List<ReferralInfo> referrals}) = _$ReferralRewardImpl;

  factory _ReferralReward.fromJson(Map<String, dynamic> json) =
      _$ReferralRewardImpl.fromJson;

  @override
  int get totalReferrals;
  @override
  int get pointsEarned;
  @override
  List<ReferralInfo> get referrals;

  /// Create a copy of ReferralReward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralRewardImplCopyWith<_$ReferralRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferralInfo _$ReferralInfoFromJson(Map<String, dynamic> json) {
  return _ReferralInfo.fromJson(json);
}

/// @nodoc
mixin _$ReferralInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get referralDate => throw _privateConstructorUsedError;
  bool get hasRecycled => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;

  /// Serializes this ReferralInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralInfoCopyWith<ReferralInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralInfoCopyWith<$Res> {
  factory $ReferralInfoCopyWith(
          ReferralInfo value, $Res Function(ReferralInfo) then) =
      _$ReferralInfoCopyWithImpl<$Res, ReferralInfo>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime referralDate,
      bool hasRecycled,
      int pointsEarned});
}

/// @nodoc
class _$ReferralInfoCopyWithImpl<$Res, $Val extends ReferralInfo>
    implements $ReferralInfoCopyWith<$Res> {
  _$ReferralInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? referralDate = null,
    Object? hasRecycled = null,
    Object? pointsEarned = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      referralDate: null == referralDate
          ? _value.referralDate
          : referralDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasRecycled: null == hasRecycled
          ? _value.hasRecycled
          : hasRecycled // ignore: cast_nullable_to_non_nullable
              as bool,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralInfoImplCopyWith<$Res>
    implements $ReferralInfoCopyWith<$Res> {
  factory _$$ReferralInfoImplCopyWith(
          _$ReferralInfoImpl value, $Res Function(_$ReferralInfoImpl) then) =
      __$$ReferralInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime referralDate,
      bool hasRecycled,
      int pointsEarned});
}

/// @nodoc
class __$$ReferralInfoImplCopyWithImpl<$Res>
    extends _$ReferralInfoCopyWithImpl<$Res, _$ReferralInfoImpl>
    implements _$$ReferralInfoImplCopyWith<$Res> {
  __$$ReferralInfoImplCopyWithImpl(
      _$ReferralInfoImpl _value, $Res Function(_$ReferralInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? referralDate = null,
    Object? hasRecycled = null,
    Object? pointsEarned = null,
  }) {
    return _then(_$ReferralInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      referralDate: null == referralDate
          ? _value.referralDate
          : referralDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasRecycled: null == hasRecycled
          ? _value.hasRecycled
          : hasRecycled // ignore: cast_nullable_to_non_nullable
              as bool,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralInfoImpl implements _ReferralInfo {
  const _$ReferralInfoImpl(
      {required this.id,
      required this.name,
      required this.referralDate,
      required this.hasRecycled,
      required this.pointsEarned});

  factory _$ReferralInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime referralDate;
  @override
  final bool hasRecycled;
  @override
  final int pointsEarned;

  @override
  String toString() {
    return 'ReferralInfo(id: $id, name: $name, referralDate: $referralDate, hasRecycled: $hasRecycled, pointsEarned: $pointsEarned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.referralDate, referralDate) ||
                other.referralDate == referralDate) &&
            (identical(other.hasRecycled, hasRecycled) ||
                other.hasRecycled == hasRecycled) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, referralDate, hasRecycled, pointsEarned);

  /// Create a copy of ReferralInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralInfoImplCopyWith<_$ReferralInfoImpl> get copyWith =>
      __$$ReferralInfoImplCopyWithImpl<_$ReferralInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralInfoImplToJson(
      this,
    );
  }
}

abstract class _ReferralInfo implements ReferralInfo {
  const factory _ReferralInfo(
      {required final String id,
      required final String name,
      required final DateTime referralDate,
      required final bool hasRecycled,
      required final int pointsEarned}) = _$ReferralInfoImpl;

  factory _ReferralInfo.fromJson(Map<String, dynamic> json) =
      _$ReferralInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get referralDate;
  @override
  bool get hasRecycled;
  @override
  int get pointsEarned;

  /// Create a copy of ReferralInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralInfoImplCopyWith<_$ReferralInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
