// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeItem _$ChallengeItemFromJson(Map<String, dynamic> json) {
  return _ChallengeItem.fromJson(json);
}

/// @nodoc
mixin _$ChallengeItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  double get target => throw _privateConstructorUsedError;
  int get percent => throw _privateConstructorUsedError;
  int get pointsReward => throw _privateConstructorUsedError;
  int get daysLeft => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this ChallengeItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeItemCopyWith<ChallengeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeItemCopyWith<$Res> {
  factory $ChallengeItemCopyWith(
          ChallengeItem value, $Res Function(ChallengeItem) then) =
      _$ChallengeItemCopyWithImpl<$Res, ChallengeItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      double progress,
      double target,
      int percent,
      int pointsReward,
      int daysLeft,
      bool completed,
      DateTime? completedAt});
}

/// @nodoc
class _$ChallengeItemCopyWithImpl<$Res, $Val extends ChallengeItem>
    implements $ChallengeItemCopyWith<$Res> {
  _$ChallengeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? progress = null,
    Object? target = null,
    Object? percent = null,
    Object? pointsReward = null,
    Object? daysLeft = null,
    Object? completed = null,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as int,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      daysLeft: null == daysLeft
          ? _value.daysLeft
          : daysLeft // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeItemImplCopyWith<$Res>
    implements $ChallengeItemCopyWith<$Res> {
  factory _$$ChallengeItemImplCopyWith(
          _$ChallengeItemImpl value, $Res Function(_$ChallengeItemImpl) then) =
      __$$ChallengeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      double progress,
      double target,
      int percent,
      int pointsReward,
      int daysLeft,
      bool completed,
      DateTime? completedAt});
}

/// @nodoc
class __$$ChallengeItemImplCopyWithImpl<$Res>
    extends _$ChallengeItemCopyWithImpl<$Res, _$ChallengeItemImpl>
    implements _$$ChallengeItemImplCopyWith<$Res> {
  __$$ChallengeItemImplCopyWithImpl(
      _$ChallengeItemImpl _value, $Res Function(_$ChallengeItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? progress = null,
    Object? target = null,
    Object? percent = null,
    Object? pointsReward = null,
    Object? daysLeft = null,
    Object? completed = null,
    Object? completedAt = freezed,
  }) {
    return _then(_$ChallengeItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as int,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      daysLeft: null == daysLeft
          ? _value.daysLeft
          : daysLeft // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeItemImpl implements _ChallengeItem {
  const _$ChallengeItemImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.progress,
      required this.target,
      required this.percent,
      required this.pointsReward,
      required this.daysLeft,
      required this.completed,
      this.completedAt});

  factory _$ChallengeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final double progress;
  @override
  final double target;
  @override
  final int percent;
  @override
  final int pointsReward;
  @override
  final int daysLeft;
  @override
  final bool completed;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'ChallengeItem(id: $id, title: $title, description: $description, progress: $progress, target: $target, percent: $percent, pointsReward: $pointsReward, daysLeft: $daysLeft, completed: $completed, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.pointsReward, pointsReward) ||
                other.pointsReward == pointsReward) &&
            (identical(other.daysLeft, daysLeft) ||
                other.daysLeft == daysLeft) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, progress,
      target, percent, pointsReward, daysLeft, completed, completedAt);

  /// Create a copy of ChallengeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeItemImplCopyWith<_$ChallengeItemImpl> get copyWith =>
      __$$ChallengeItemImplCopyWithImpl<_$ChallengeItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeItemImplToJson(
      this,
    );
  }
}

abstract class _ChallengeItem implements ChallengeItem {
  const factory _ChallengeItem(
      {required final String id,
      required final String title,
      required final String description,
      required final double progress,
      required final double target,
      required final int percent,
      required final int pointsReward,
      required final int daysLeft,
      required final bool completed,
      final DateTime? completedAt}) = _$ChallengeItemImpl;

  factory _ChallengeItem.fromJson(Map<String, dynamic> json) =
      _$ChallengeItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  double get progress;
  @override
  double get target;
  @override
  int get percent;
  @override
  int get pointsReward;
  @override
  int get daysLeft;
  @override
  bool get completed;
  @override
  DateTime? get completedAt;

  /// Create a copy of ChallengeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeItemImplCopyWith<_$ChallengeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChallengesResponse _$ChallengesResponseFromJson(Map<String, dynamic> json) {
  return _ChallengesResponse.fromJson(json);
}

/// @nodoc
mixin _$ChallengesResponse {
  List<ChallengeItem> get activeChallenges =>
      throw _privateConstructorUsedError;
  List<ChallengeItem> get completedChallenges =>
      throw _privateConstructorUsedError;

  /// Serializes this ChallengesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengesResponseCopyWith<ChallengesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengesResponseCopyWith<$Res> {
  factory $ChallengesResponseCopyWith(
          ChallengesResponse value, $Res Function(ChallengesResponse) then) =
      _$ChallengesResponseCopyWithImpl<$Res, ChallengesResponse>;
  @useResult
  $Res call(
      {List<ChallengeItem> activeChallenges,
      List<ChallengeItem> completedChallenges});
}

/// @nodoc
class _$ChallengesResponseCopyWithImpl<$Res, $Val extends ChallengesResponse>
    implements $ChallengesResponseCopyWith<$Res> {
  _$ChallengesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeChallenges = null,
    Object? completedChallenges = null,
  }) {
    return _then(_value.copyWith(
      activeChallenges: null == activeChallenges
          ? _value.activeChallenges
          : activeChallenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeItem>,
      completedChallenges: null == completedChallenges
          ? _value.completedChallenges
          : completedChallenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengesResponseImplCopyWith<$Res>
    implements $ChallengesResponseCopyWith<$Res> {
  factory _$$ChallengesResponseImplCopyWith(_$ChallengesResponseImpl value,
          $Res Function(_$ChallengesResponseImpl) then) =
      __$$ChallengesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChallengeItem> activeChallenges,
      List<ChallengeItem> completedChallenges});
}

/// @nodoc
class __$$ChallengesResponseImplCopyWithImpl<$Res>
    extends _$ChallengesResponseCopyWithImpl<$Res, _$ChallengesResponseImpl>
    implements _$$ChallengesResponseImplCopyWith<$Res> {
  __$$ChallengesResponseImplCopyWithImpl(_$ChallengesResponseImpl _value,
      $Res Function(_$ChallengesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeChallenges = null,
    Object? completedChallenges = null,
  }) {
    return _then(_$ChallengesResponseImpl(
      activeChallenges: null == activeChallenges
          ? _value._activeChallenges
          : activeChallenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeItem>,
      completedChallenges: null == completedChallenges
          ? _value._completedChallenges
          : completedChallenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengesResponseImpl implements _ChallengesResponse {
  const _$ChallengesResponseImpl(
      {required final List<ChallengeItem> activeChallenges,
      required final List<ChallengeItem> completedChallenges})
      : _activeChallenges = activeChallenges,
        _completedChallenges = completedChallenges;

  factory _$ChallengesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengesResponseImplFromJson(json);

  final List<ChallengeItem> _activeChallenges;
  @override
  List<ChallengeItem> get activeChallenges {
    if (_activeChallenges is EqualUnmodifiableListView)
      return _activeChallenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeChallenges);
  }

  final List<ChallengeItem> _completedChallenges;
  @override
  List<ChallengeItem> get completedChallenges {
    if (_completedChallenges is EqualUnmodifiableListView)
      return _completedChallenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedChallenges);
  }

  @override
  String toString() {
    return 'ChallengesResponse(activeChallenges: $activeChallenges, completedChallenges: $completedChallenges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengesResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._activeChallenges, _activeChallenges) &&
            const DeepCollectionEquality()
                .equals(other._completedChallenges, _completedChallenges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeChallenges),
      const DeepCollectionEquality().hash(_completedChallenges));

  /// Create a copy of ChallengesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengesResponseImplCopyWith<_$ChallengesResponseImpl> get copyWith =>
      __$$ChallengesResponseImplCopyWithImpl<_$ChallengesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengesResponseImplToJson(
      this,
    );
  }
}

abstract class _ChallengesResponse implements ChallengesResponse {
  const factory _ChallengesResponse(
          {required final List<ChallengeItem> activeChallenges,
          required final List<ChallengeItem> completedChallenges}) =
      _$ChallengesResponseImpl;

  factory _ChallengesResponse.fromJson(Map<String, dynamic> json) =
      _$ChallengesResponseImpl.fromJson;

  @override
  List<ChallengeItem> get activeChallenges;
  @override
  List<ChallengeItem> get completedChallenges;

  /// Create a copy of ChallengesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengesResponseImplCopyWith<_$ChallengesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
