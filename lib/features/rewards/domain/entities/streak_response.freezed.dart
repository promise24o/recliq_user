// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyActivity _$WeeklyActivityFromJson(Map<String, dynamic> json) {
  return _WeeklyActivity.fromJson(json);
}

/// @nodoc
mixin _$WeeklyActivity {
  bool get sun => throw _privateConstructorUsedError;
  bool get mon => throw _privateConstructorUsedError;
  bool get tue => throw _privateConstructorUsedError;
  bool get wed => throw _privateConstructorUsedError;
  bool get thu => throw _privateConstructorUsedError;
  bool get fri => throw _privateConstructorUsedError;
  bool get sat => throw _privateConstructorUsedError;

  /// Serializes this WeeklyActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyActivityCopyWith<WeeklyActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyActivityCopyWith<$Res> {
  factory $WeeklyActivityCopyWith(
          WeeklyActivity value, $Res Function(WeeklyActivity) then) =
      _$WeeklyActivityCopyWithImpl<$Res, WeeklyActivity>;
  @useResult
  $Res call(
      {bool sun, bool mon, bool tue, bool wed, bool thu, bool fri, bool sat});
}

/// @nodoc
class _$WeeklyActivityCopyWithImpl<$Res, $Val extends WeeklyActivity>
    implements $WeeklyActivityCopyWith<$Res> {
  _$WeeklyActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sun = null,
    Object? mon = null,
    Object? tue = null,
    Object? wed = null,
    Object? thu = null,
    Object? fri = null,
    Object? sat = null,
  }) {
    return _then(_value.copyWith(
      sun: null == sun
          ? _value.sun
          : sun // ignore: cast_nullable_to_non_nullable
              as bool,
      mon: null == mon
          ? _value.mon
          : mon // ignore: cast_nullable_to_non_nullable
              as bool,
      tue: null == tue
          ? _value.tue
          : tue // ignore: cast_nullable_to_non_nullable
              as bool,
      wed: null == wed
          ? _value.wed
          : wed // ignore: cast_nullable_to_non_nullable
              as bool,
      thu: null == thu
          ? _value.thu
          : thu // ignore: cast_nullable_to_non_nullable
              as bool,
      fri: null == fri
          ? _value.fri
          : fri // ignore: cast_nullable_to_non_nullable
              as bool,
      sat: null == sat
          ? _value.sat
          : sat // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyActivityImplCopyWith<$Res>
    implements $WeeklyActivityCopyWith<$Res> {
  factory _$$WeeklyActivityImplCopyWith(_$WeeklyActivityImpl value,
          $Res Function(_$WeeklyActivityImpl) then) =
      __$$WeeklyActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool sun, bool mon, bool tue, bool wed, bool thu, bool fri, bool sat});
}

/// @nodoc
class __$$WeeklyActivityImplCopyWithImpl<$Res>
    extends _$WeeklyActivityCopyWithImpl<$Res, _$WeeklyActivityImpl>
    implements _$$WeeklyActivityImplCopyWith<$Res> {
  __$$WeeklyActivityImplCopyWithImpl(
      _$WeeklyActivityImpl _value, $Res Function(_$WeeklyActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sun = null,
    Object? mon = null,
    Object? tue = null,
    Object? wed = null,
    Object? thu = null,
    Object? fri = null,
    Object? sat = null,
  }) {
    return _then(_$WeeklyActivityImpl(
      sun: null == sun
          ? _value.sun
          : sun // ignore: cast_nullable_to_non_nullable
              as bool,
      mon: null == mon
          ? _value.mon
          : mon // ignore: cast_nullable_to_non_nullable
              as bool,
      tue: null == tue
          ? _value.tue
          : tue // ignore: cast_nullable_to_non_nullable
              as bool,
      wed: null == wed
          ? _value.wed
          : wed // ignore: cast_nullable_to_non_nullable
              as bool,
      thu: null == thu
          ? _value.thu
          : thu // ignore: cast_nullable_to_non_nullable
              as bool,
      fri: null == fri
          ? _value.fri
          : fri // ignore: cast_nullable_to_non_nullable
              as bool,
      sat: null == sat
          ? _value.sat
          : sat // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyActivityImpl implements _WeeklyActivity {
  const _$WeeklyActivityImpl(
      {required this.sun,
      required this.mon,
      required this.tue,
      required this.wed,
      required this.thu,
      required this.fri,
      required this.sat});

  factory _$WeeklyActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyActivityImplFromJson(json);

  @override
  final bool sun;
  @override
  final bool mon;
  @override
  final bool tue;
  @override
  final bool wed;
  @override
  final bool thu;
  @override
  final bool fri;
  @override
  final bool sat;

  @override
  String toString() {
    return 'WeeklyActivity(sun: $sun, mon: $mon, tue: $tue, wed: $wed, thu: $thu, fri: $fri, sat: $sat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyActivityImpl &&
            (identical(other.sun, sun) || other.sun == sun) &&
            (identical(other.mon, mon) || other.mon == mon) &&
            (identical(other.tue, tue) || other.tue == tue) &&
            (identical(other.wed, wed) || other.wed == wed) &&
            (identical(other.thu, thu) || other.thu == thu) &&
            (identical(other.fri, fri) || other.fri == fri) &&
            (identical(other.sat, sat) || other.sat == sat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sun, mon, tue, wed, thu, fri, sat);

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyActivityImplCopyWith<_$WeeklyActivityImpl> get copyWith =>
      __$$WeeklyActivityImplCopyWithImpl<_$WeeklyActivityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyActivityImplToJson(
      this,
    );
  }
}

abstract class _WeeklyActivity implements WeeklyActivity {
  const factory _WeeklyActivity(
      {required final bool sun,
      required final bool mon,
      required final bool tue,
      required final bool wed,
      required final bool thu,
      required final bool fri,
      required final bool sat}) = _$WeeklyActivityImpl;

  factory _WeeklyActivity.fromJson(Map<String, dynamic> json) =
      _$WeeklyActivityImpl.fromJson;

  @override
  bool get sun;
  @override
  bool get mon;
  @override
  bool get tue;
  @override
  bool get wed;
  @override
  bool get thu;
  @override
  bool get fri;
  @override
  bool get sat;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyActivityImplCopyWith<_$WeeklyActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StreakResponse _$StreakResponseFromJson(Map<String, dynamic> json) {
  return _StreakResponse.fromJson(json);
}

/// @nodoc
mixin _$StreakResponse {
  int get currentStreakWeeks => throw _privateConstructorUsedError;
  int get bestStreakWeeks => throw _privateConstructorUsedError;
  WeeklyActivity get weeklyActivity => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get daysUntilBreak => throw _privateConstructorUsedError;

  /// Serializes this StreakResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreakResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreakResponseCopyWith<StreakResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakResponseCopyWith<$Res> {
  factory $StreakResponseCopyWith(
          StreakResponse value, $Res Function(StreakResponse) then) =
      _$StreakResponseCopyWithImpl<$Res, StreakResponse>;
  @useResult
  $Res call(
      {int currentStreakWeeks,
      int bestStreakWeeks,
      WeeklyActivity weeklyActivity,
      bool isActive,
      int daysUntilBreak});

  $WeeklyActivityCopyWith<$Res> get weeklyActivity;
}

/// @nodoc
class _$StreakResponseCopyWithImpl<$Res, $Val extends StreakResponse>
    implements $StreakResponseCopyWith<$Res> {
  _$StreakResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreakResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreakWeeks = null,
    Object? bestStreakWeeks = null,
    Object? weeklyActivity = null,
    Object? isActive = null,
    Object? daysUntilBreak = null,
  }) {
    return _then(_value.copyWith(
      currentStreakWeeks: null == currentStreakWeeks
          ? _value.currentStreakWeeks
          : currentStreakWeeks // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreakWeeks: null == bestStreakWeeks
          ? _value.bestStreakWeeks
          : bestStreakWeeks // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyActivity: null == weeklyActivity
          ? _value.weeklyActivity
          : weeklyActivity // ignore: cast_nullable_to_non_nullable
              as WeeklyActivity,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      daysUntilBreak: null == daysUntilBreak
          ? _value.daysUntilBreak
          : daysUntilBreak // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of StreakResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeklyActivityCopyWith<$Res> get weeklyActivity {
    return $WeeklyActivityCopyWith<$Res>(_value.weeklyActivity, (value) {
      return _then(_value.copyWith(weeklyActivity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StreakResponseImplCopyWith<$Res>
    implements $StreakResponseCopyWith<$Res> {
  factory _$$StreakResponseImplCopyWith(_$StreakResponseImpl value,
          $Res Function(_$StreakResponseImpl) then) =
      __$$StreakResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStreakWeeks,
      int bestStreakWeeks,
      WeeklyActivity weeklyActivity,
      bool isActive,
      int daysUntilBreak});

  @override
  $WeeklyActivityCopyWith<$Res> get weeklyActivity;
}

/// @nodoc
class __$$StreakResponseImplCopyWithImpl<$Res>
    extends _$StreakResponseCopyWithImpl<$Res, _$StreakResponseImpl>
    implements _$$StreakResponseImplCopyWith<$Res> {
  __$$StreakResponseImplCopyWithImpl(
      _$StreakResponseImpl _value, $Res Function(_$StreakResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreakResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreakWeeks = null,
    Object? bestStreakWeeks = null,
    Object? weeklyActivity = null,
    Object? isActive = null,
    Object? daysUntilBreak = null,
  }) {
    return _then(_$StreakResponseImpl(
      currentStreakWeeks: null == currentStreakWeeks
          ? _value.currentStreakWeeks
          : currentStreakWeeks // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreakWeeks: null == bestStreakWeeks
          ? _value.bestStreakWeeks
          : bestStreakWeeks // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyActivity: null == weeklyActivity
          ? _value.weeklyActivity
          : weeklyActivity // ignore: cast_nullable_to_non_nullable
              as WeeklyActivity,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      daysUntilBreak: null == daysUntilBreak
          ? _value.daysUntilBreak
          : daysUntilBreak // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakResponseImpl implements _StreakResponse {
  const _$StreakResponseImpl(
      {required this.currentStreakWeeks,
      required this.bestStreakWeeks,
      required this.weeklyActivity,
      required this.isActive,
      required this.daysUntilBreak});

  factory _$StreakResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakResponseImplFromJson(json);

  @override
  final int currentStreakWeeks;
  @override
  final int bestStreakWeeks;
  @override
  final WeeklyActivity weeklyActivity;
  @override
  final bool isActive;
  @override
  final int daysUntilBreak;

  @override
  String toString() {
    return 'StreakResponse(currentStreakWeeks: $currentStreakWeeks, bestStreakWeeks: $bestStreakWeeks, weeklyActivity: $weeklyActivity, isActive: $isActive, daysUntilBreak: $daysUntilBreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakResponseImpl &&
            (identical(other.currentStreakWeeks, currentStreakWeeks) ||
                other.currentStreakWeeks == currentStreakWeeks) &&
            (identical(other.bestStreakWeeks, bestStreakWeeks) ||
                other.bestStreakWeeks == bestStreakWeeks) &&
            (identical(other.weeklyActivity, weeklyActivity) ||
                other.weeklyActivity == weeklyActivity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.daysUntilBreak, daysUntilBreak) ||
                other.daysUntilBreak == daysUntilBreak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentStreakWeeks,
      bestStreakWeeks, weeklyActivity, isActive, daysUntilBreak);

  /// Create a copy of StreakResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakResponseImplCopyWith<_$StreakResponseImpl> get copyWith =>
      __$$StreakResponseImplCopyWithImpl<_$StreakResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakResponseImplToJson(
      this,
    );
  }
}

abstract class _StreakResponse implements StreakResponse {
  const factory _StreakResponse(
      {required final int currentStreakWeeks,
      required final int bestStreakWeeks,
      required final WeeklyActivity weeklyActivity,
      required final bool isActive,
      required final int daysUntilBreak}) = _$StreakResponseImpl;

  factory _StreakResponse.fromJson(Map<String, dynamic> json) =
      _$StreakResponseImpl.fromJson;

  @override
  int get currentStreakWeeks;
  @override
  int get bestStreakWeeks;
  @override
  WeeklyActivity get weeklyActivity;
  @override
  bool get isActive;
  @override
  int get daysUntilBreak;

  /// Create a copy of StreakResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakResponseImplCopyWith<_$StreakResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
