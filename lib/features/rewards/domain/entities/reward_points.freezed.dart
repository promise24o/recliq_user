// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_points.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardPoints _$RewardPointsFromJson(Map<String, dynamic> json) {
  return _RewardPoints.fromJson(json);
}

/// @nodoc
mixin _$RewardPoints {
  int get totalPoints => throw _privateConstructorUsedError;
  int get currentLevel => throw _privateConstructorUsedError;
  String get levelName => throw _privateConstructorUsedError;
  int get pointsToNextLevel => throw _privateConstructorUsedError;
  int get levelProgress => throw _privateConstructorUsedError;

  /// Serializes this RewardPoints to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardPointsCopyWith<RewardPoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardPointsCopyWith<$Res> {
  factory $RewardPointsCopyWith(
          RewardPoints value, $Res Function(RewardPoints) then) =
      _$RewardPointsCopyWithImpl<$Res, RewardPoints>;
  @useResult
  $Res call(
      {int totalPoints,
      int currentLevel,
      String levelName,
      int pointsToNextLevel,
      int levelProgress});
}

/// @nodoc
class _$RewardPointsCopyWithImpl<$Res, $Val extends RewardPoints>
    implements $RewardPointsCopyWith<$Res> {
  _$RewardPointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? currentLevel = null,
    Object? levelName = null,
    Object? pointsToNextLevel = null,
    Object? levelProgress = null,
  }) {
    return _then(_value.copyWith(
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      levelName: null == levelName
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String,
      pointsToNextLevel: null == pointsToNextLevel
          ? _value.pointsToNextLevel
          : pointsToNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      levelProgress: null == levelProgress
          ? _value.levelProgress
          : levelProgress // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardPointsImplCopyWith<$Res>
    implements $RewardPointsCopyWith<$Res> {
  factory _$$RewardPointsImplCopyWith(
          _$RewardPointsImpl value, $Res Function(_$RewardPointsImpl) then) =
      __$$RewardPointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalPoints,
      int currentLevel,
      String levelName,
      int pointsToNextLevel,
      int levelProgress});
}

/// @nodoc
class __$$RewardPointsImplCopyWithImpl<$Res>
    extends _$RewardPointsCopyWithImpl<$Res, _$RewardPointsImpl>
    implements _$$RewardPointsImplCopyWith<$Res> {
  __$$RewardPointsImplCopyWithImpl(
      _$RewardPointsImpl _value, $Res Function(_$RewardPointsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? currentLevel = null,
    Object? levelName = null,
    Object? pointsToNextLevel = null,
    Object? levelProgress = null,
  }) {
    return _then(_$RewardPointsImpl(
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      levelName: null == levelName
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String,
      pointsToNextLevel: null == pointsToNextLevel
          ? _value.pointsToNextLevel
          : pointsToNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      levelProgress: null == levelProgress
          ? _value.levelProgress
          : levelProgress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardPointsImpl implements _RewardPoints {
  const _$RewardPointsImpl(
      {required this.totalPoints,
      required this.currentLevel,
      required this.levelName,
      required this.pointsToNextLevel,
      required this.levelProgress});

  factory _$RewardPointsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardPointsImplFromJson(json);

  @override
  final int totalPoints;
  @override
  final int currentLevel;
  @override
  final String levelName;
  @override
  final int pointsToNextLevel;
  @override
  final int levelProgress;

  @override
  String toString() {
    return 'RewardPoints(totalPoints: $totalPoints, currentLevel: $currentLevel, levelName: $levelName, pointsToNextLevel: $pointsToNextLevel, levelProgress: $levelProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardPointsImpl &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.levelName, levelName) ||
                other.levelName == levelName) &&
            (identical(other.pointsToNextLevel, pointsToNextLevel) ||
                other.pointsToNextLevel == pointsToNextLevel) &&
            (identical(other.levelProgress, levelProgress) ||
                other.levelProgress == levelProgress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalPoints, currentLevel,
      levelName, pointsToNextLevel, levelProgress);

  /// Create a copy of RewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardPointsImplCopyWith<_$RewardPointsImpl> get copyWith =>
      __$$RewardPointsImplCopyWithImpl<_$RewardPointsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardPointsImplToJson(
      this,
    );
  }
}

abstract class _RewardPoints implements RewardPoints {
  const factory _RewardPoints(
      {required final int totalPoints,
      required final int currentLevel,
      required final String levelName,
      required final int pointsToNextLevel,
      required final int levelProgress}) = _$RewardPointsImpl;

  factory _RewardPoints.fromJson(Map<String, dynamic> json) =
      _$RewardPointsImpl.fromJson;

  @override
  int get totalPoints;
  @override
  int get currentLevel;
  @override
  String get levelName;
  @override
  int get pointsToNextLevel;
  @override
  int get levelProgress;

  /// Create a copy of RewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardPointsImplCopyWith<_$RewardPointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
