// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rewards_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardsOverview _$RewardsOverviewFromJson(Map<String, dynamic> json) {
  return _RewardsOverview.fromJson(json);
}

/// @nodoc
mixin _$RewardsOverview {
  int get totalPoints => throw _privateConstructorUsedError;
  Level get level => throw _privateConstructorUsedError;
  int get pointsToNextLevel => throw _privateConstructorUsedError;
  int get levelProgressPercent => throw _privateConstructorUsedError;

  /// Serializes this RewardsOverview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardsOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardsOverviewCopyWith<RewardsOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardsOverviewCopyWith<$Res> {
  factory $RewardsOverviewCopyWith(
          RewardsOverview value, $Res Function(RewardsOverview) then) =
      _$RewardsOverviewCopyWithImpl<$Res, RewardsOverview>;
  @useResult
  $Res call(
      {int totalPoints,
      Level level,
      int pointsToNextLevel,
      int levelProgressPercent});

  $LevelCopyWith<$Res> get level;
}

/// @nodoc
class _$RewardsOverviewCopyWithImpl<$Res, $Val extends RewardsOverview>
    implements $RewardsOverviewCopyWith<$Res> {
  _$RewardsOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardsOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? level = null,
    Object? pointsToNextLevel = null,
    Object? levelProgressPercent = null,
  }) {
    return _then(_value.copyWith(
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      pointsToNextLevel: null == pointsToNextLevel
          ? _value.pointsToNextLevel
          : pointsToNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      levelProgressPercent: null == levelProgressPercent
          ? _value.levelProgressPercent
          : levelProgressPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of RewardsOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LevelCopyWith<$Res> get level {
    return $LevelCopyWith<$Res>(_value.level, (value) {
      return _then(_value.copyWith(level: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RewardsOverviewImplCopyWith<$Res>
    implements $RewardsOverviewCopyWith<$Res> {
  factory _$$RewardsOverviewImplCopyWith(_$RewardsOverviewImpl value,
          $Res Function(_$RewardsOverviewImpl) then) =
      __$$RewardsOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalPoints,
      Level level,
      int pointsToNextLevel,
      int levelProgressPercent});

  @override
  $LevelCopyWith<$Res> get level;
}

/// @nodoc
class __$$RewardsOverviewImplCopyWithImpl<$Res>
    extends _$RewardsOverviewCopyWithImpl<$Res, _$RewardsOverviewImpl>
    implements _$$RewardsOverviewImplCopyWith<$Res> {
  __$$RewardsOverviewImplCopyWithImpl(
      _$RewardsOverviewImpl _value, $Res Function(_$RewardsOverviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardsOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? level = null,
    Object? pointsToNextLevel = null,
    Object? levelProgressPercent = null,
  }) {
    return _then(_$RewardsOverviewImpl(
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      pointsToNextLevel: null == pointsToNextLevel
          ? _value.pointsToNextLevel
          : pointsToNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      levelProgressPercent: null == levelProgressPercent
          ? _value.levelProgressPercent
          : levelProgressPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardsOverviewImpl implements _RewardsOverview {
  const _$RewardsOverviewImpl(
      {required this.totalPoints,
      required this.level,
      required this.pointsToNextLevel,
      required this.levelProgressPercent});

  factory _$RewardsOverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardsOverviewImplFromJson(json);

  @override
  final int totalPoints;
  @override
  final Level level;
  @override
  final int pointsToNextLevel;
  @override
  final int levelProgressPercent;

  @override
  String toString() {
    return 'RewardsOverview(totalPoints: $totalPoints, level: $level, pointsToNextLevel: $pointsToNextLevel, levelProgressPercent: $levelProgressPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardsOverviewImpl &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.pointsToNextLevel, pointsToNextLevel) ||
                other.pointsToNextLevel == pointsToNextLevel) &&
            (identical(other.levelProgressPercent, levelProgressPercent) ||
                other.levelProgressPercent == levelProgressPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalPoints, level, pointsToNextLevel, levelProgressPercent);

  /// Create a copy of RewardsOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardsOverviewImplCopyWith<_$RewardsOverviewImpl> get copyWith =>
      __$$RewardsOverviewImplCopyWithImpl<_$RewardsOverviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardsOverviewImplToJson(
      this,
    );
  }
}

abstract class _RewardsOverview implements RewardsOverview {
  const factory _RewardsOverview(
      {required final int totalPoints,
      required final Level level,
      required final int pointsToNextLevel,
      required final int levelProgressPercent}) = _$RewardsOverviewImpl;

  factory _RewardsOverview.fromJson(Map<String, dynamic> json) =
      _$RewardsOverviewImpl.fromJson;

  @override
  int get totalPoints;
  @override
  Level get level;
  @override
  int get pointsToNextLevel;
  @override
  int get levelProgressPercent;

  /// Create a copy of RewardsOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardsOverviewImplCopyWith<_$RewardsOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
