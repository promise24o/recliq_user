// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recycling_streak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecyclingStreak _$RecyclingStreakFromJson(Map<String, dynamic> json) {
  return _RecyclingStreak.fromJson(json);
}

/// @nodoc
mixin _$RecyclingStreak {
  int get currentStreak => throw _privateConstructorUsedError;
  int get bestStreak => throw _privateConstructorUsedError;
  List<bool> get weeklyActivity => throw _privateConstructorUsedError;
  DateTime get lastActivityDate => throw _privateConstructorUsedError;
  String get streakDescription => throw _privateConstructorUsedError;

  /// Serializes this RecyclingStreak to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecyclingStreak
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecyclingStreakCopyWith<RecyclingStreak> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecyclingStreakCopyWith<$Res> {
  factory $RecyclingStreakCopyWith(
          RecyclingStreak value, $Res Function(RecyclingStreak) then) =
      _$RecyclingStreakCopyWithImpl<$Res, RecyclingStreak>;
  @useResult
  $Res call(
      {int currentStreak,
      int bestStreak,
      List<bool> weeklyActivity,
      DateTime lastActivityDate,
      String streakDescription});
}

/// @nodoc
class _$RecyclingStreakCopyWithImpl<$Res, $Val extends RecyclingStreak>
    implements $RecyclingStreakCopyWith<$Res> {
  _$RecyclingStreakCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecyclingStreak
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? weeklyActivity = null,
    Object? lastActivityDate = null,
    Object? streakDescription = null,
  }) {
    return _then(_value.copyWith(
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreak: null == bestStreak
          ? _value.bestStreak
          : bestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyActivity: null == weeklyActivity
          ? _value.weeklyActivity
          : weeklyActivity // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lastActivityDate: null == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakDescription: null == streakDescription
          ? _value.streakDescription
          : streakDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecyclingStreakImplCopyWith<$Res>
    implements $RecyclingStreakCopyWith<$Res> {
  factory _$$RecyclingStreakImplCopyWith(_$RecyclingStreakImpl value,
          $Res Function(_$RecyclingStreakImpl) then) =
      __$$RecyclingStreakImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStreak,
      int bestStreak,
      List<bool> weeklyActivity,
      DateTime lastActivityDate,
      String streakDescription});
}

/// @nodoc
class __$$RecyclingStreakImplCopyWithImpl<$Res>
    extends _$RecyclingStreakCopyWithImpl<$Res, _$RecyclingStreakImpl>
    implements _$$RecyclingStreakImplCopyWith<$Res> {
  __$$RecyclingStreakImplCopyWithImpl(
      _$RecyclingStreakImpl _value, $Res Function(_$RecyclingStreakImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecyclingStreak
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? weeklyActivity = null,
    Object? lastActivityDate = null,
    Object? streakDescription = null,
  }) {
    return _then(_$RecyclingStreakImpl(
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreak: null == bestStreak
          ? _value.bestStreak
          : bestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyActivity: null == weeklyActivity
          ? _value._weeklyActivity
          : weeklyActivity // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lastActivityDate: null == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakDescription: null == streakDescription
          ? _value.streakDescription
          : streakDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecyclingStreakImpl implements _RecyclingStreak {
  const _$RecyclingStreakImpl(
      {required this.currentStreak,
      required this.bestStreak,
      required final List<bool> weeklyActivity,
      required this.lastActivityDate,
      required this.streakDescription})
      : _weeklyActivity = weeklyActivity;

  factory _$RecyclingStreakImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecyclingStreakImplFromJson(json);

  @override
  final int currentStreak;
  @override
  final int bestStreak;
  final List<bool> _weeklyActivity;
  @override
  List<bool> get weeklyActivity {
    if (_weeklyActivity is EqualUnmodifiableListView) return _weeklyActivity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyActivity);
  }

  @override
  final DateTime lastActivityDate;
  @override
  final String streakDescription;

  @override
  String toString() {
    return 'RecyclingStreak(currentStreak: $currentStreak, bestStreak: $bestStreak, weeklyActivity: $weeklyActivity, lastActivityDate: $lastActivityDate, streakDescription: $streakDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecyclingStreakImpl &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.bestStreak, bestStreak) ||
                other.bestStreak == bestStreak) &&
            const DeepCollectionEquality()
                .equals(other._weeklyActivity, _weeklyActivity) &&
            (identical(other.lastActivityDate, lastActivityDate) ||
                other.lastActivityDate == lastActivityDate) &&
            (identical(other.streakDescription, streakDescription) ||
                other.streakDescription == streakDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentStreak,
      bestStreak,
      const DeepCollectionEquality().hash(_weeklyActivity),
      lastActivityDate,
      streakDescription);

  /// Create a copy of RecyclingStreak
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecyclingStreakImplCopyWith<_$RecyclingStreakImpl> get copyWith =>
      __$$RecyclingStreakImplCopyWithImpl<_$RecyclingStreakImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecyclingStreakImplToJson(
      this,
    );
  }
}

abstract class _RecyclingStreak implements RecyclingStreak {
  const factory _RecyclingStreak(
      {required final int currentStreak,
      required final int bestStreak,
      required final List<bool> weeklyActivity,
      required final DateTime lastActivityDate,
      required final String streakDescription}) = _$RecyclingStreakImpl;

  factory _RecyclingStreak.fromJson(Map<String, dynamic> json) =
      _$RecyclingStreakImpl.fromJson;

  @override
  int get currentStreak;
  @override
  int get bestStreak;
  @override
  List<bool> get weeklyActivity;
  @override
  DateTime get lastActivityDate;
  @override
  String get streakDescription;

  /// Create a copy of RecyclingStreak
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecyclingStreakImplCopyWith<_$RecyclingStreakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
