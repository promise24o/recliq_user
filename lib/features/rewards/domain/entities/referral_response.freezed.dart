// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferralItem _$ReferralItemFromJson(Map<String, dynamic> json) {
  return _ReferralItem.fromJson(json);
}

/// @nodoc
mixin _$ReferralItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ReferralItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralItemCopyWith<ReferralItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralItemCopyWith<$Res> {
  factory $ReferralItemCopyWith(
          ReferralItem value, $Res Function(ReferralItem) then) =
      _$ReferralItemCopyWithImpl<$Res, ReferralItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      String status,
      int points,
      DateTime? completedAt,
      DateTime createdAt});
}

/// @nodoc
class _$ReferralItemCopyWithImpl<$Res, $Val extends ReferralItem>
    implements $ReferralItemCopyWith<$Res> {
  _$ReferralItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? points = null,
    Object? completedAt = freezed,
    Object? createdAt = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralItemImplCopyWith<$Res>
    implements $ReferralItemCopyWith<$Res> {
  factory _$$ReferralItemImplCopyWith(
          _$ReferralItemImpl value, $Res Function(_$ReferralItemImpl) then) =
      __$$ReferralItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String status,
      int points,
      DateTime? completedAt,
      DateTime createdAt});
}

/// @nodoc
class __$$ReferralItemImplCopyWithImpl<$Res>
    extends _$ReferralItemCopyWithImpl<$Res, _$ReferralItemImpl>
    implements _$$ReferralItemImplCopyWith<$Res> {
  __$$ReferralItemImplCopyWithImpl(
      _$ReferralItemImpl _value, $Res Function(_$ReferralItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? points = null,
    Object? completedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$ReferralItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralItemImpl implements _ReferralItem {
  const _$ReferralItemImpl(
      {required this.id,
      required this.name,
      required this.status,
      required this.points,
      this.completedAt,
      required this.createdAt});

  factory _$ReferralItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String status;
  @override
  final int points;
  @override
  final DateTime? completedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ReferralItem(id: $id, name: $name, status: $status, points: $points, completedAt: $completedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, status, points, completedAt, createdAt);

  /// Create a copy of ReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralItemImplCopyWith<_$ReferralItemImpl> get copyWith =>
      __$$ReferralItemImplCopyWithImpl<_$ReferralItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralItemImplToJson(
      this,
    );
  }
}

abstract class _ReferralItem implements ReferralItem {
  const factory _ReferralItem(
      {required final String id,
      required final String name,
      required final String status,
      required final int points,
      final DateTime? completedAt,
      required final DateTime createdAt}) = _$ReferralItemImpl;

  factory _ReferralItem.fromJson(Map<String, dynamic> json) =
      _$ReferralItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get status;
  @override
  int get points;
  @override
  DateTime? get completedAt;
  @override
  DateTime get createdAt;

  /// Create a copy of ReferralItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralItemImplCopyWith<_$ReferralItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferralResponse _$ReferralResponseFromJson(Map<String, dynamic> json) {
  return _ReferralResponse.fromJson(json);
}

/// @nodoc
mixin _$ReferralResponse {
  int get totalReferrals => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;
  List<ReferralItem> get recentReferrals => throw _privateConstructorUsedError;

  /// Serializes this ReferralResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralResponseCopyWith<ReferralResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralResponseCopyWith<$Res> {
  factory $ReferralResponseCopyWith(
          ReferralResponse value, $Res Function(ReferralResponse) then) =
      _$ReferralResponseCopyWithImpl<$Res, ReferralResponse>;
  @useResult
  $Res call(
      {int totalReferrals,
      int pointsEarned,
      List<ReferralItem> recentReferrals});
}

/// @nodoc
class _$ReferralResponseCopyWithImpl<$Res, $Val extends ReferralResponse>
    implements $ReferralResponseCopyWith<$Res> {
  _$ReferralResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferrals = null,
    Object? pointsEarned = null,
    Object? recentReferrals = null,
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
      recentReferrals: null == recentReferrals
          ? _value.recentReferrals
          : recentReferrals // ignore: cast_nullable_to_non_nullable
              as List<ReferralItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralResponseImplCopyWith<$Res>
    implements $ReferralResponseCopyWith<$Res> {
  factory _$$ReferralResponseImplCopyWith(_$ReferralResponseImpl value,
          $Res Function(_$ReferralResponseImpl) then) =
      __$$ReferralResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalReferrals,
      int pointsEarned,
      List<ReferralItem> recentReferrals});
}

/// @nodoc
class __$$ReferralResponseImplCopyWithImpl<$Res>
    extends _$ReferralResponseCopyWithImpl<$Res, _$ReferralResponseImpl>
    implements _$$ReferralResponseImplCopyWith<$Res> {
  __$$ReferralResponseImplCopyWithImpl(_$ReferralResponseImpl _value,
      $Res Function(_$ReferralResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferrals = null,
    Object? pointsEarned = null,
    Object? recentReferrals = null,
  }) {
    return _then(_$ReferralResponseImpl(
      totalReferrals: null == totalReferrals
          ? _value.totalReferrals
          : totalReferrals // ignore: cast_nullable_to_non_nullable
              as int,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      recentReferrals: null == recentReferrals
          ? _value._recentReferrals
          : recentReferrals // ignore: cast_nullable_to_non_nullable
              as List<ReferralItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralResponseImpl implements _ReferralResponse {
  const _$ReferralResponseImpl(
      {required this.totalReferrals,
      required this.pointsEarned,
      required final List<ReferralItem> recentReferrals})
      : _recentReferrals = recentReferrals;

  factory _$ReferralResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralResponseImplFromJson(json);

  @override
  final int totalReferrals;
  @override
  final int pointsEarned;
  final List<ReferralItem> _recentReferrals;
  @override
  List<ReferralItem> get recentReferrals {
    if (_recentReferrals is EqualUnmodifiableListView) return _recentReferrals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentReferrals);
  }

  @override
  String toString() {
    return 'ReferralResponse(totalReferrals: $totalReferrals, pointsEarned: $pointsEarned, recentReferrals: $recentReferrals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralResponseImpl &&
            (identical(other.totalReferrals, totalReferrals) ||
                other.totalReferrals == totalReferrals) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            const DeepCollectionEquality()
                .equals(other._recentReferrals, _recentReferrals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalReferrals, pointsEarned,
      const DeepCollectionEquality().hash(_recentReferrals));

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralResponseImplCopyWith<_$ReferralResponseImpl> get copyWith =>
      __$$ReferralResponseImplCopyWithImpl<_$ReferralResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralResponseImplToJson(
      this,
    );
  }
}

abstract class _ReferralResponse implements ReferralResponse {
  const factory _ReferralResponse(
          {required final int totalReferrals,
          required final int pointsEarned,
          required final List<ReferralItem> recentReferrals}) =
      _$ReferralResponseImpl;

  factory _ReferralResponse.fromJson(Map<String, dynamic> json) =
      _$ReferralResponseImpl.fromJson;

  @override
  int get totalReferrals;
  @override
  int get pointsEarned;
  @override
  List<ReferralItem> get recentReferrals;

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralResponseImplCopyWith<_$ReferralResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
