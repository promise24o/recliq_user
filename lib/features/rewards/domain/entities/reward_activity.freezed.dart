// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardActivity _$RewardActivityFromJson(Map<String, dynamic> json) {
  return _RewardActivity.fromJson(json);
}

/// @nodoc
mixin _$RewardActivity {
  String get id => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @ActivityTypeConverter()
  ActivityType get type => throw _privateConstructorUsedError;

  /// Serializes this RewardActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardActivityCopyWith<RewardActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardActivityCopyWith<$Res> {
  factory $RewardActivityCopyWith(
          RewardActivity value, $Res Function(RewardActivity) then) =
      _$RewardActivityCopyWithImpl<$Res, RewardActivity>;
  @useResult
  $Res call(
      {String id,
      int points,
      String description,
      DateTime date,
      @ActivityTypeConverter() ActivityType type});

  $ActivityTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$RewardActivityCopyWithImpl<$Res, $Val extends RewardActivity>
    implements $RewardActivityCopyWith<$Res> {
  _$RewardActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? description = null,
    Object? date = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
    ) as $Val);
  }

  /// Create a copy of RewardActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivityTypeCopyWith<$Res> get type {
    return $ActivityTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RewardActivityImplCopyWith<$Res>
    implements $RewardActivityCopyWith<$Res> {
  factory _$$RewardActivityImplCopyWith(_$RewardActivityImpl value,
          $Res Function(_$RewardActivityImpl) then) =
      __$$RewardActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int points,
      String description,
      DateTime date,
      @ActivityTypeConverter() ActivityType type});

  @override
  $ActivityTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$RewardActivityImplCopyWithImpl<$Res>
    extends _$RewardActivityCopyWithImpl<$Res, _$RewardActivityImpl>
    implements _$$RewardActivityImplCopyWith<$Res> {
  __$$RewardActivityImplCopyWithImpl(
      _$RewardActivityImpl _value, $Res Function(_$RewardActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? description = null,
    Object? date = null,
    Object? type = null,
  }) {
    return _then(_$RewardActivityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardActivityImpl implements _RewardActivity {
  const _$RewardActivityImpl(
      {required this.id,
      required this.points,
      required this.description,
      required this.date,
      @ActivityTypeConverter() required this.type});

  factory _$RewardActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardActivityImplFromJson(json);

  @override
  final String id;
  @override
  final int points;
  @override
  final String description;
  @override
  final DateTime date;
  @override
  @ActivityTypeConverter()
  final ActivityType type;

  @override
  String toString() {
    return 'RewardActivity(id: $id, points: $points, description: $description, date: $date, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, points, description, date, type);

  /// Create a copy of RewardActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardActivityImplCopyWith<_$RewardActivityImpl> get copyWith =>
      __$$RewardActivityImplCopyWithImpl<_$RewardActivityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardActivityImplToJson(
      this,
    );
  }
}

abstract class _RewardActivity implements RewardActivity {
  const factory _RewardActivity(
          {required final String id,
          required final int points,
          required final String description,
          required final DateTime date,
          @ActivityTypeConverter() required final ActivityType type}) =
      _$RewardActivityImpl;

  factory _RewardActivity.fromJson(Map<String, dynamic> json) =
      _$RewardActivityImpl.fromJson;

  @override
  String get id;
  @override
  int get points;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  @ActivityTypeConverter()
  ActivityType get type;

  /// Create a copy of RewardActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardActivityImplCopyWith<_$RewardActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ActivityType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recyle,
    required TResult Function() streak,
    required TResult Function() badge,
    required TResult Function() challenge,
    required TResult Function() referral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recyle,
    TResult? Function()? streak,
    TResult? Function()? badge,
    TResult? Function()? challenge,
    TResult? Function()? referral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recyle,
    TResult Function()? streak,
    TResult Function()? badge,
    TResult Function()? challenge,
    TResult Function()? referral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Recyle value) recyle,
    required TResult Function(_Streak value) streak,
    required TResult Function(_Badge value) badge,
    required TResult Function(_Challenge value) challenge,
    required TResult Function(_Referral value) referral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Recyle value)? recyle,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_Badge value)? badge,
    TResult? Function(_Challenge value)? challenge,
    TResult? Function(_Referral value)? referral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Recyle value)? recyle,
    TResult Function(_Streak value)? streak,
    TResult Function(_Badge value)? badge,
    TResult Function(_Challenge value)? challenge,
    TResult Function(_Referral value)? referral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityTypeCopyWith<$Res> {
  factory $ActivityTypeCopyWith(
          ActivityType value, $Res Function(ActivityType) then) =
      _$ActivityTypeCopyWithImpl<$Res, ActivityType>;
}

/// @nodoc
class _$ActivityTypeCopyWithImpl<$Res, $Val extends ActivityType>
    implements $ActivityTypeCopyWith<$Res> {
  _$ActivityTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RecyleImplCopyWith<$Res> {
  factory _$$RecyleImplCopyWith(
          _$RecyleImpl value, $Res Function(_$RecyleImpl) then) =
      __$$RecyleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecyleImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$RecyleImpl>
    implements _$$RecyleImplCopyWith<$Res> {
  __$$RecyleImplCopyWithImpl(
      _$RecyleImpl _value, $Res Function(_$RecyleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RecyleImpl implements _Recyle {
  const _$RecyleImpl();

  @override
  String toString() {
    return 'ActivityType.recyle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecyleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recyle,
    required TResult Function() streak,
    required TResult Function() badge,
    required TResult Function() challenge,
    required TResult Function() referral,
  }) {
    return recyle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recyle,
    TResult? Function()? streak,
    TResult? Function()? badge,
    TResult? Function()? challenge,
    TResult? Function()? referral,
  }) {
    return recyle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recyle,
    TResult Function()? streak,
    TResult Function()? badge,
    TResult Function()? challenge,
    TResult Function()? referral,
    required TResult orElse(),
  }) {
    if (recyle != null) {
      return recyle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Recyle value) recyle,
    required TResult Function(_Streak value) streak,
    required TResult Function(_Badge value) badge,
    required TResult Function(_Challenge value) challenge,
    required TResult Function(_Referral value) referral,
  }) {
    return recyle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Recyle value)? recyle,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_Badge value)? badge,
    TResult? Function(_Challenge value)? challenge,
    TResult? Function(_Referral value)? referral,
  }) {
    return recyle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Recyle value)? recyle,
    TResult Function(_Streak value)? streak,
    TResult Function(_Badge value)? badge,
    TResult Function(_Challenge value)? challenge,
    TResult Function(_Referral value)? referral,
    required TResult orElse(),
  }) {
    if (recyle != null) {
      return recyle(this);
    }
    return orElse();
  }
}

abstract class _Recyle implements ActivityType {
  const factory _Recyle() = _$RecyleImpl;
}

/// @nodoc
abstract class _$$StreakImplCopyWith<$Res> {
  factory _$$StreakImplCopyWith(
          _$StreakImpl value, $Res Function(_$StreakImpl) then) =
      __$$StreakImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StreakImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$StreakImpl>
    implements _$$StreakImplCopyWith<$Res> {
  __$$StreakImplCopyWithImpl(
      _$StreakImpl _value, $Res Function(_$StreakImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StreakImpl implements _Streak {
  const _$StreakImpl();

  @override
  String toString() {
    return 'ActivityType.streak()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StreakImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recyle,
    required TResult Function() streak,
    required TResult Function() badge,
    required TResult Function() challenge,
    required TResult Function() referral,
  }) {
    return streak();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recyle,
    TResult? Function()? streak,
    TResult? Function()? badge,
    TResult? Function()? challenge,
    TResult? Function()? referral,
  }) {
    return streak?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recyle,
    TResult Function()? streak,
    TResult Function()? badge,
    TResult Function()? challenge,
    TResult Function()? referral,
    required TResult orElse(),
  }) {
    if (streak != null) {
      return streak();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Recyle value) recyle,
    required TResult Function(_Streak value) streak,
    required TResult Function(_Badge value) badge,
    required TResult Function(_Challenge value) challenge,
    required TResult Function(_Referral value) referral,
  }) {
    return streak(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Recyle value)? recyle,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_Badge value)? badge,
    TResult? Function(_Challenge value)? challenge,
    TResult? Function(_Referral value)? referral,
  }) {
    return streak?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Recyle value)? recyle,
    TResult Function(_Streak value)? streak,
    TResult Function(_Badge value)? badge,
    TResult Function(_Challenge value)? challenge,
    TResult Function(_Referral value)? referral,
    required TResult orElse(),
  }) {
    if (streak != null) {
      return streak(this);
    }
    return orElse();
  }
}

abstract class _Streak implements ActivityType {
  const factory _Streak() = _$StreakImpl;
}

/// @nodoc
abstract class _$$BadgeImplCopyWith<$Res> {
  factory _$$BadgeImplCopyWith(
          _$BadgeImpl value, $Res Function(_$BadgeImpl) then) =
      __$$BadgeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BadgeImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$BadgeImpl>
    implements _$$BadgeImplCopyWith<$Res> {
  __$$BadgeImplCopyWithImpl(
      _$BadgeImpl _value, $Res Function(_$BadgeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BadgeImpl implements _Badge {
  const _$BadgeImpl();

  @override
  String toString() {
    return 'ActivityType.badge()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BadgeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recyle,
    required TResult Function() streak,
    required TResult Function() badge,
    required TResult Function() challenge,
    required TResult Function() referral,
  }) {
    return badge();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recyle,
    TResult? Function()? streak,
    TResult? Function()? badge,
    TResult? Function()? challenge,
    TResult? Function()? referral,
  }) {
    return badge?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recyle,
    TResult Function()? streak,
    TResult Function()? badge,
    TResult Function()? challenge,
    TResult Function()? referral,
    required TResult orElse(),
  }) {
    if (badge != null) {
      return badge();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Recyle value) recyle,
    required TResult Function(_Streak value) streak,
    required TResult Function(_Badge value) badge,
    required TResult Function(_Challenge value) challenge,
    required TResult Function(_Referral value) referral,
  }) {
    return badge(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Recyle value)? recyle,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_Badge value)? badge,
    TResult? Function(_Challenge value)? challenge,
    TResult? Function(_Referral value)? referral,
  }) {
    return badge?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Recyle value)? recyle,
    TResult Function(_Streak value)? streak,
    TResult Function(_Badge value)? badge,
    TResult Function(_Challenge value)? challenge,
    TResult Function(_Referral value)? referral,
    required TResult orElse(),
  }) {
    if (badge != null) {
      return badge(this);
    }
    return orElse();
  }
}

abstract class _Badge implements ActivityType {
  const factory _Badge() = _$BadgeImpl;
}

/// @nodoc
abstract class _$$ChallengeImplCopyWith<$Res> {
  factory _$$ChallengeImplCopyWith(
          _$ChallengeImpl value, $Res Function(_$ChallengeImpl) then) =
      __$$ChallengeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChallengeImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$ChallengeImpl>
    implements _$$ChallengeImplCopyWith<$Res> {
  __$$ChallengeImplCopyWithImpl(
      _$ChallengeImpl _value, $Res Function(_$ChallengeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChallengeImpl implements _Challenge {
  const _$ChallengeImpl();

  @override
  String toString() {
    return 'ActivityType.challenge()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChallengeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recyle,
    required TResult Function() streak,
    required TResult Function() badge,
    required TResult Function() challenge,
    required TResult Function() referral,
  }) {
    return challenge();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recyle,
    TResult? Function()? streak,
    TResult? Function()? badge,
    TResult? Function()? challenge,
    TResult? Function()? referral,
  }) {
    return challenge?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recyle,
    TResult Function()? streak,
    TResult Function()? badge,
    TResult Function()? challenge,
    TResult Function()? referral,
    required TResult orElse(),
  }) {
    if (challenge != null) {
      return challenge();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Recyle value) recyle,
    required TResult Function(_Streak value) streak,
    required TResult Function(_Badge value) badge,
    required TResult Function(_Challenge value) challenge,
    required TResult Function(_Referral value) referral,
  }) {
    return challenge(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Recyle value)? recyle,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_Badge value)? badge,
    TResult? Function(_Challenge value)? challenge,
    TResult? Function(_Referral value)? referral,
  }) {
    return challenge?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Recyle value)? recyle,
    TResult Function(_Streak value)? streak,
    TResult Function(_Badge value)? badge,
    TResult Function(_Challenge value)? challenge,
    TResult Function(_Referral value)? referral,
    required TResult orElse(),
  }) {
    if (challenge != null) {
      return challenge(this);
    }
    return orElse();
  }
}

abstract class _Challenge implements ActivityType {
  const factory _Challenge() = _$ChallengeImpl;
}

/// @nodoc
abstract class _$$ReferralImplCopyWith<$Res> {
  factory _$$ReferralImplCopyWith(
          _$ReferralImpl value, $Res Function(_$ReferralImpl) then) =
      __$$ReferralImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReferralImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$ReferralImpl>
    implements _$$ReferralImplCopyWith<$Res> {
  __$$ReferralImplCopyWithImpl(
      _$ReferralImpl _value, $Res Function(_$ReferralImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReferralImpl implements _Referral {
  const _$ReferralImpl();

  @override
  String toString() {
    return 'ActivityType.referral()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReferralImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recyle,
    required TResult Function() streak,
    required TResult Function() badge,
    required TResult Function() challenge,
    required TResult Function() referral,
  }) {
    return referral();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recyle,
    TResult? Function()? streak,
    TResult? Function()? badge,
    TResult? Function()? challenge,
    TResult? Function()? referral,
  }) {
    return referral?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recyle,
    TResult Function()? streak,
    TResult Function()? badge,
    TResult Function()? challenge,
    TResult Function()? referral,
    required TResult orElse(),
  }) {
    if (referral != null) {
      return referral();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Recyle value) recyle,
    required TResult Function(_Streak value) streak,
    required TResult Function(_Badge value) badge,
    required TResult Function(_Challenge value) challenge,
    required TResult Function(_Referral value) referral,
  }) {
    return referral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Recyle value)? recyle,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_Badge value)? badge,
    TResult? Function(_Challenge value)? challenge,
    TResult? Function(_Referral value)? referral,
  }) {
    return referral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Recyle value)? recyle,
    TResult Function(_Streak value)? streak,
    TResult Function(_Badge value)? badge,
    TResult Function(_Challenge value)? challenge,
    TResult Function(_Referral value)? referral,
    required TResult orElse(),
  }) {
    if (referral != null) {
      return referral(this);
    }
    return orElse();
  }
}

abstract class _Referral implements ActivityType {
  const factory _Referral() = _$ReferralImpl;
}
