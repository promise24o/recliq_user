// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  return _Challenge.fromJson(json);
}

/// @nodoc
mixin _$Challenge {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get targetValue => throw _privateConstructorUsedError;
  int get currentValue => throw _privateConstructorUsedError;
  int get rewardPoints => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  ChallengeType get type => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this Challenge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeCopyWith<Challenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeCopyWith<$Res> {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) then) =
      _$ChallengeCopyWithImpl<$Res, Challenge>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int targetValue,
      int currentValue,
      int rewardPoints,
      DateTime deadline,
      ChallengeType type,
      bool isCompleted});

  $ChallengeTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res, $Val extends Challenge>
    implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? targetValue = null,
    Object? currentValue = null,
    Object? rewardPoints = null,
    Object? deadline = null,
    Object? type = null,
    Object? isCompleted = null,
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
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      rewardPoints: null == rewardPoints
          ? _value.rewardPoints
          : rewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChallengeType,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChallengeTypeCopyWith<$Res> get type {
    return $ChallengeTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChallengeImplCopyWith<$Res>
    implements $ChallengeCopyWith<$Res> {
  factory _$$ChallengeImplCopyWith(
          _$ChallengeImpl value, $Res Function(_$ChallengeImpl) then) =
      __$$ChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int targetValue,
      int currentValue,
      int rewardPoints,
      DateTime deadline,
      ChallengeType type,
      bool isCompleted});

  @override
  $ChallengeTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$ChallengeImplCopyWithImpl<$Res>
    extends _$ChallengeCopyWithImpl<$Res, _$ChallengeImpl>
    implements _$$ChallengeImplCopyWith<$Res> {
  __$$ChallengeImplCopyWithImpl(
      _$ChallengeImpl _value, $Res Function(_$ChallengeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? targetValue = null,
    Object? currentValue = null,
    Object? rewardPoints = null,
    Object? deadline = null,
    Object? type = null,
    Object? isCompleted = null,
  }) {
    return _then(_$ChallengeImpl(
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
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      rewardPoints: null == rewardPoints
          ? _value.rewardPoints
          : rewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChallengeType,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeImpl implements _Challenge {
  const _$ChallengeImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.targetValue,
      required this.currentValue,
      required this.rewardPoints,
      required this.deadline,
      required this.type,
      required this.isCompleted});

  factory _$ChallengeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int targetValue;
  @override
  final int currentValue;
  @override
  final int rewardPoints;
  @override
  final DateTime deadline;
  @override
  final ChallengeType type;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'Challenge(id: $id, title: $title, description: $description, targetValue: $targetValue, currentValue: $currentValue, rewardPoints: $rewardPoints, deadline: $deadline, type: $type, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.rewardPoints, rewardPoints) ||
                other.rewardPoints == rewardPoints) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      targetValue, currentValue, rewardPoints, deadline, type, isCompleted);

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith =>
      __$$ChallengeImplCopyWithImpl<_$ChallengeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeImplToJson(
      this,
    );
  }
}

abstract class _Challenge implements Challenge {
  const factory _Challenge(
      {required final String id,
      required final String title,
      required final String description,
      required final int targetValue,
      required final int currentValue,
      required final int rewardPoints,
      required final DateTime deadline,
      required final ChallengeType type,
      required final bool isCompleted}) = _$ChallengeImpl;

  factory _Challenge.fromJson(Map<String, dynamic> json) =
      _$ChallengeImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get targetValue;
  @override
  int get currentValue;
  @override
  int get rewardPoints;
  @override
  DateTime get deadline;
  @override
  ChallengeType get type;
  @override
  bool get isCompleted;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChallengeType _$ChallengeTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'weeklyRecycling':
      return _WeeklyRecycling.fromJson(json);
    case 'monthlyPickups':
      return _MonthlyPickups.fromJson(json);
    case 'referral':
      return _Referral.fromJson(json);
    case 'weightGoal':
      return _WeightGoal.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ChallengeType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ChallengeType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() weeklyRecycling,
    required TResult Function() monthlyPickups,
    required TResult Function() referral,
    required TResult Function() weightGoal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? weeklyRecycling,
    TResult? Function()? monthlyPickups,
    TResult? Function()? referral,
    TResult? Function()? weightGoal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? weeklyRecycling,
    TResult Function()? monthlyPickups,
    TResult Function()? referral,
    TResult Function()? weightGoal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeeklyRecycling value) weeklyRecycling,
    required TResult Function(_MonthlyPickups value) monthlyPickups,
    required TResult Function(_Referral value) referral,
    required TResult Function(_WeightGoal value) weightGoal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult? Function(_MonthlyPickups value)? monthlyPickups,
    TResult? Function(_Referral value)? referral,
    TResult? Function(_WeightGoal value)? weightGoal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult Function(_MonthlyPickups value)? monthlyPickups,
    TResult Function(_Referral value)? referral,
    TResult Function(_WeightGoal value)? weightGoal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ChallengeType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeTypeCopyWith<$Res> {
  factory $ChallengeTypeCopyWith(
          ChallengeType value, $Res Function(ChallengeType) then) =
      _$ChallengeTypeCopyWithImpl<$Res, ChallengeType>;
}

/// @nodoc
class _$ChallengeTypeCopyWithImpl<$Res, $Val extends ChallengeType>
    implements $ChallengeTypeCopyWith<$Res> {
  _$ChallengeTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WeeklyRecyclingImplCopyWith<$Res> {
  factory _$$WeeklyRecyclingImplCopyWith(_$WeeklyRecyclingImpl value,
          $Res Function(_$WeeklyRecyclingImpl) then) =
      __$$WeeklyRecyclingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeeklyRecyclingImplCopyWithImpl<$Res>
    extends _$ChallengeTypeCopyWithImpl<$Res, _$WeeklyRecyclingImpl>
    implements _$$WeeklyRecyclingImplCopyWith<$Res> {
  __$$WeeklyRecyclingImplCopyWithImpl(
      _$WeeklyRecyclingImpl _value, $Res Function(_$WeeklyRecyclingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$WeeklyRecyclingImpl implements _WeeklyRecycling {
  const _$WeeklyRecyclingImpl({final String? $type})
      : $type = $type ?? 'weeklyRecycling';

  factory _$WeeklyRecyclingImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyRecyclingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChallengeType.weeklyRecycling()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeeklyRecyclingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() weeklyRecycling,
    required TResult Function() monthlyPickups,
    required TResult Function() referral,
    required TResult Function() weightGoal,
  }) {
    return weeklyRecycling();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? weeklyRecycling,
    TResult? Function()? monthlyPickups,
    TResult? Function()? referral,
    TResult? Function()? weightGoal,
  }) {
    return weeklyRecycling?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? weeklyRecycling,
    TResult Function()? monthlyPickups,
    TResult Function()? referral,
    TResult Function()? weightGoal,
    required TResult orElse(),
  }) {
    if (weeklyRecycling != null) {
      return weeklyRecycling();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeeklyRecycling value) weeklyRecycling,
    required TResult Function(_MonthlyPickups value) monthlyPickups,
    required TResult Function(_Referral value) referral,
    required TResult Function(_WeightGoal value) weightGoal,
  }) {
    return weeklyRecycling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult? Function(_MonthlyPickups value)? monthlyPickups,
    TResult? Function(_Referral value)? referral,
    TResult? Function(_WeightGoal value)? weightGoal,
  }) {
    return weeklyRecycling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult Function(_MonthlyPickups value)? monthlyPickups,
    TResult Function(_Referral value)? referral,
    TResult Function(_WeightGoal value)? weightGoal,
    required TResult orElse(),
  }) {
    if (weeklyRecycling != null) {
      return weeklyRecycling(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyRecyclingImplToJson(
      this,
    );
  }
}

abstract class _WeeklyRecycling implements ChallengeType {
  const factory _WeeklyRecycling() = _$WeeklyRecyclingImpl;

  factory _WeeklyRecycling.fromJson(Map<String, dynamic> json) =
      _$WeeklyRecyclingImpl.fromJson;
}

/// @nodoc
abstract class _$$MonthlyPickupsImplCopyWith<$Res> {
  factory _$$MonthlyPickupsImplCopyWith(_$MonthlyPickupsImpl value,
          $Res Function(_$MonthlyPickupsImpl) then) =
      __$$MonthlyPickupsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MonthlyPickupsImplCopyWithImpl<$Res>
    extends _$ChallengeTypeCopyWithImpl<$Res, _$MonthlyPickupsImpl>
    implements _$$MonthlyPickupsImplCopyWith<$Res> {
  __$$MonthlyPickupsImplCopyWithImpl(
      _$MonthlyPickupsImpl _value, $Res Function(_$MonthlyPickupsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MonthlyPickupsImpl implements _MonthlyPickups {
  const _$MonthlyPickupsImpl({final String? $type})
      : $type = $type ?? 'monthlyPickups';

  factory _$MonthlyPickupsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyPickupsImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChallengeType.monthlyPickups()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MonthlyPickupsImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() weeklyRecycling,
    required TResult Function() monthlyPickups,
    required TResult Function() referral,
    required TResult Function() weightGoal,
  }) {
    return monthlyPickups();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? weeklyRecycling,
    TResult? Function()? monthlyPickups,
    TResult? Function()? referral,
    TResult? Function()? weightGoal,
  }) {
    return monthlyPickups?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? weeklyRecycling,
    TResult Function()? monthlyPickups,
    TResult Function()? referral,
    TResult Function()? weightGoal,
    required TResult orElse(),
  }) {
    if (monthlyPickups != null) {
      return monthlyPickups();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeeklyRecycling value) weeklyRecycling,
    required TResult Function(_MonthlyPickups value) monthlyPickups,
    required TResult Function(_Referral value) referral,
    required TResult Function(_WeightGoal value) weightGoal,
  }) {
    return monthlyPickups(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult? Function(_MonthlyPickups value)? monthlyPickups,
    TResult? Function(_Referral value)? referral,
    TResult? Function(_WeightGoal value)? weightGoal,
  }) {
    return monthlyPickups?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult Function(_MonthlyPickups value)? monthlyPickups,
    TResult Function(_Referral value)? referral,
    TResult Function(_WeightGoal value)? weightGoal,
    required TResult orElse(),
  }) {
    if (monthlyPickups != null) {
      return monthlyPickups(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyPickupsImplToJson(
      this,
    );
  }
}

abstract class _MonthlyPickups implements ChallengeType {
  const factory _MonthlyPickups() = _$MonthlyPickupsImpl;

  factory _MonthlyPickups.fromJson(Map<String, dynamic> json) =
      _$MonthlyPickupsImpl.fromJson;
}

/// @nodoc
abstract class _$$ReferralImplCopyWith<$Res> {
  factory _$$ReferralImplCopyWith(
          _$ReferralImpl value, $Res Function(_$ReferralImpl) then) =
      __$$ReferralImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReferralImplCopyWithImpl<$Res>
    extends _$ChallengeTypeCopyWithImpl<$Res, _$ReferralImpl>
    implements _$$ReferralImplCopyWith<$Res> {
  __$$ReferralImplCopyWithImpl(
      _$ReferralImpl _value, $Res Function(_$ReferralImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ReferralImpl implements _Referral {
  const _$ReferralImpl({final String? $type}) : $type = $type ?? 'referral';

  factory _$ReferralImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChallengeType.referral()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReferralImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() weeklyRecycling,
    required TResult Function() monthlyPickups,
    required TResult Function() referral,
    required TResult Function() weightGoal,
  }) {
    return referral();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? weeklyRecycling,
    TResult? Function()? monthlyPickups,
    TResult? Function()? referral,
    TResult? Function()? weightGoal,
  }) {
    return referral?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? weeklyRecycling,
    TResult Function()? monthlyPickups,
    TResult Function()? referral,
    TResult Function()? weightGoal,
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
    required TResult Function(_WeeklyRecycling value) weeklyRecycling,
    required TResult Function(_MonthlyPickups value) monthlyPickups,
    required TResult Function(_Referral value) referral,
    required TResult Function(_WeightGoal value) weightGoal,
  }) {
    return referral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult? Function(_MonthlyPickups value)? monthlyPickups,
    TResult? Function(_Referral value)? referral,
    TResult? Function(_WeightGoal value)? weightGoal,
  }) {
    return referral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult Function(_MonthlyPickups value)? monthlyPickups,
    TResult Function(_Referral value)? referral,
    TResult Function(_WeightGoal value)? weightGoal,
    required TResult orElse(),
  }) {
    if (referral != null) {
      return referral(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralImplToJson(
      this,
    );
  }
}

abstract class _Referral implements ChallengeType {
  const factory _Referral() = _$ReferralImpl;

  factory _Referral.fromJson(Map<String, dynamic> json) =
      _$ReferralImpl.fromJson;
}

/// @nodoc
abstract class _$$WeightGoalImplCopyWith<$Res> {
  factory _$$WeightGoalImplCopyWith(
          _$WeightGoalImpl value, $Res Function(_$WeightGoalImpl) then) =
      __$$WeightGoalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeightGoalImplCopyWithImpl<$Res>
    extends _$ChallengeTypeCopyWithImpl<$Res, _$WeightGoalImpl>
    implements _$$WeightGoalImplCopyWith<$Res> {
  __$$WeightGoalImplCopyWithImpl(
      _$WeightGoalImpl _value, $Res Function(_$WeightGoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$WeightGoalImpl implements _WeightGoal {
  const _$WeightGoalImpl({final String? $type}) : $type = $type ?? 'weightGoal';

  factory _$WeightGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightGoalImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChallengeType.weightGoal()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeightGoalImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() weeklyRecycling,
    required TResult Function() monthlyPickups,
    required TResult Function() referral,
    required TResult Function() weightGoal,
  }) {
    return weightGoal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? weeklyRecycling,
    TResult? Function()? monthlyPickups,
    TResult? Function()? referral,
    TResult? Function()? weightGoal,
  }) {
    return weightGoal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? weeklyRecycling,
    TResult Function()? monthlyPickups,
    TResult Function()? referral,
    TResult Function()? weightGoal,
    required TResult orElse(),
  }) {
    if (weightGoal != null) {
      return weightGoal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeeklyRecycling value) weeklyRecycling,
    required TResult Function(_MonthlyPickups value) monthlyPickups,
    required TResult Function(_Referral value) referral,
    required TResult Function(_WeightGoal value) weightGoal,
  }) {
    return weightGoal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult? Function(_MonthlyPickups value)? monthlyPickups,
    TResult? Function(_Referral value)? referral,
    TResult? Function(_WeightGoal value)? weightGoal,
  }) {
    return weightGoal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeeklyRecycling value)? weeklyRecycling,
    TResult Function(_MonthlyPickups value)? monthlyPickups,
    TResult Function(_Referral value)? referral,
    TResult Function(_WeightGoal value)? weightGoal,
    required TResult orElse(),
  }) {
    if (weightGoal != null) {
      return weightGoal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightGoalImplToJson(
      this,
    );
  }
}

abstract class _WeightGoal implements ChallengeType {
  const factory _WeightGoal() = _$WeightGoalImpl;

  factory _WeightGoal.fromJson(Map<String, dynamic> json) =
      _$WeightGoalImpl.fromJson;
}
