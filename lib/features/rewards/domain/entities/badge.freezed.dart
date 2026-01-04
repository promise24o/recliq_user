// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return _Badge.fromJson(json);
}

/// @nodoc
mixin _$Badge {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get criteria => throw _privateConstructorUsedError;
  bool get isEarned => throw _privateConstructorUsedError;
  DateTime? get earnedAt => throw _privateConstructorUsedError;
  BadgeCategory? get category => throw _privateConstructorUsedError;

  /// Serializes this Badge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Badge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BadgeCopyWith<Badge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeCopyWith<$Res> {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) then) =
      _$BadgeCopyWithImpl<$Res, Badge>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String icon,
      String criteria,
      bool isEarned,
      DateTime? earnedAt,
      BadgeCategory? category});

  $BadgeCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$BadgeCopyWithImpl<$Res, $Val extends Badge>
    implements $BadgeCopyWith<$Res> {
  _$BadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Badge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? icon = null,
    Object? criteria = null,
    Object? isEarned = null,
    Object? earnedAt = freezed,
    Object? category = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      criteria: null == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String,
      isEarned: null == isEarned
          ? _value.isEarned
          : isEarned // ignore: cast_nullable_to_non_nullable
              as bool,
      earnedAt: freezed == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as BadgeCategory?,
    ) as $Val);
  }

  /// Create a copy of Badge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BadgeCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $BadgeCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BadgeImplCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$$BadgeImplCopyWith(
          _$BadgeImpl value, $Res Function(_$BadgeImpl) then) =
      __$$BadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String icon,
      String criteria,
      bool isEarned,
      DateTime? earnedAt,
      BadgeCategory? category});

  @override
  $BadgeCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$BadgeImplCopyWithImpl<$Res>
    extends _$BadgeCopyWithImpl<$Res, _$BadgeImpl>
    implements _$$BadgeImplCopyWith<$Res> {
  __$$BadgeImplCopyWithImpl(
      _$BadgeImpl _value, $Res Function(_$BadgeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Badge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? icon = null,
    Object? criteria = null,
    Object? isEarned = null,
    Object? earnedAt = freezed,
    Object? category = freezed,
  }) {
    return _then(_$BadgeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      criteria: null == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String,
      isEarned: null == isEarned
          ? _value.isEarned
          : isEarned // ignore: cast_nullable_to_non_nullable
              as bool,
      earnedAt: freezed == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as BadgeCategory?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadgeImpl implements _Badge {
  const _$BadgeImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.icon,
      required this.criteria,
      required this.isEarned,
      this.earnedAt,
      this.category});

  factory _$BadgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadgeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String icon;
  @override
  final String criteria;
  @override
  final bool isEarned;
  @override
  final DateTime? earnedAt;
  @override
  final BadgeCategory? category;

  @override
  String toString() {
    return 'Badge(id: $id, name: $name, description: $description, icon: $icon, criteria: $criteria, isEarned: $isEarned, earnedAt: $earnedAt, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.criteria, criteria) ||
                other.criteria == criteria) &&
            (identical(other.isEarned, isEarned) ||
                other.isEarned == isEarned) &&
            (identical(other.earnedAt, earnedAt) ||
                other.earnedAt == earnedAt) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, icon,
      criteria, isEarned, earnedAt, category);

  /// Create a copy of Badge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgeImplCopyWith<_$BadgeImpl> get copyWith =>
      __$$BadgeImplCopyWithImpl<_$BadgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadgeImplToJson(
      this,
    );
  }
}

abstract class _Badge implements Badge {
  const factory _Badge(
      {required final String id,
      required final String name,
      required final String description,
      required final String icon,
      required final String criteria,
      required final bool isEarned,
      final DateTime? earnedAt,
      final BadgeCategory? category}) = _$BadgeImpl;

  factory _Badge.fromJson(Map<String, dynamic> json) = _$BadgeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get icon;
  @override
  String get criteria;
  @override
  bool get isEarned;
  @override
  DateTime? get earnedAt;
  @override
  BadgeCategory? get category;

  /// Create a copy of Badge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadgeImplCopyWith<_$BadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BadgeCategory _$BadgeCategoryFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'firstRecycle':
      return _FirstRecycle.fromJson(json);
    case 'weightMilestone':
      return _WeightMilestone.fromJson(json);
    case 'carbonSaver':
      return _CarbonSaver.fromJson(json);
    case 'communityContributor':
      return _CommunityContributor.fromJson(json);
    case 'consistencyChampion':
      return _ConsistencyChampion.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'BadgeCategory',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$BadgeCategory {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firstRecycle,
    required TResult Function() weightMilestone,
    required TResult Function() carbonSaver,
    required TResult Function() communityContributor,
    required TResult Function() consistencyChampion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firstRecycle,
    TResult? Function()? weightMilestone,
    TResult? Function()? carbonSaver,
    TResult? Function()? communityContributor,
    TResult? Function()? consistencyChampion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firstRecycle,
    TResult Function()? weightMilestone,
    TResult Function()? carbonSaver,
    TResult Function()? communityContributor,
    TResult Function()? consistencyChampion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirstRecycle value) firstRecycle,
    required TResult Function(_WeightMilestone value) weightMilestone,
    required TResult Function(_CarbonSaver value) carbonSaver,
    required TResult Function(_CommunityContributor value) communityContributor,
    required TResult Function(_ConsistencyChampion value) consistencyChampion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirstRecycle value)? firstRecycle,
    TResult? Function(_WeightMilestone value)? weightMilestone,
    TResult? Function(_CarbonSaver value)? carbonSaver,
    TResult? Function(_CommunityContributor value)? communityContributor,
    TResult? Function(_ConsistencyChampion value)? consistencyChampion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirstRecycle value)? firstRecycle,
    TResult Function(_WeightMilestone value)? weightMilestone,
    TResult Function(_CarbonSaver value)? carbonSaver,
    TResult Function(_CommunityContributor value)? communityContributor,
    TResult Function(_ConsistencyChampion value)? consistencyChampion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this BadgeCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeCategoryCopyWith<$Res> {
  factory $BadgeCategoryCopyWith(
          BadgeCategory value, $Res Function(BadgeCategory) then) =
      _$BadgeCategoryCopyWithImpl<$Res, BadgeCategory>;
}

/// @nodoc
class _$BadgeCategoryCopyWithImpl<$Res, $Val extends BadgeCategory>
    implements $BadgeCategoryCopyWith<$Res> {
  _$BadgeCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BadgeCategory
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FirstRecycleImplCopyWith<$Res> {
  factory _$$FirstRecycleImplCopyWith(
          _$FirstRecycleImpl value, $Res Function(_$FirstRecycleImpl) then) =
      __$$FirstRecycleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FirstRecycleImplCopyWithImpl<$Res>
    extends _$BadgeCategoryCopyWithImpl<$Res, _$FirstRecycleImpl>
    implements _$$FirstRecycleImplCopyWith<$Res> {
  __$$FirstRecycleImplCopyWithImpl(
      _$FirstRecycleImpl _value, $Res Function(_$FirstRecycleImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgeCategory
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FirstRecycleImpl implements _FirstRecycle {
  const _$FirstRecycleImpl({final String? $type})
      : $type = $type ?? 'firstRecycle';

  factory _$FirstRecycleImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirstRecycleImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BadgeCategory.firstRecycle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FirstRecycleImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firstRecycle,
    required TResult Function() weightMilestone,
    required TResult Function() carbonSaver,
    required TResult Function() communityContributor,
    required TResult Function() consistencyChampion,
  }) {
    return firstRecycle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firstRecycle,
    TResult? Function()? weightMilestone,
    TResult? Function()? carbonSaver,
    TResult? Function()? communityContributor,
    TResult? Function()? consistencyChampion,
  }) {
    return firstRecycle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firstRecycle,
    TResult Function()? weightMilestone,
    TResult Function()? carbonSaver,
    TResult Function()? communityContributor,
    TResult Function()? consistencyChampion,
    required TResult orElse(),
  }) {
    if (firstRecycle != null) {
      return firstRecycle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirstRecycle value) firstRecycle,
    required TResult Function(_WeightMilestone value) weightMilestone,
    required TResult Function(_CarbonSaver value) carbonSaver,
    required TResult Function(_CommunityContributor value) communityContributor,
    required TResult Function(_ConsistencyChampion value) consistencyChampion,
  }) {
    return firstRecycle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirstRecycle value)? firstRecycle,
    TResult? Function(_WeightMilestone value)? weightMilestone,
    TResult? Function(_CarbonSaver value)? carbonSaver,
    TResult? Function(_CommunityContributor value)? communityContributor,
    TResult? Function(_ConsistencyChampion value)? consistencyChampion,
  }) {
    return firstRecycle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirstRecycle value)? firstRecycle,
    TResult Function(_WeightMilestone value)? weightMilestone,
    TResult Function(_CarbonSaver value)? carbonSaver,
    TResult Function(_CommunityContributor value)? communityContributor,
    TResult Function(_ConsistencyChampion value)? consistencyChampion,
    required TResult orElse(),
  }) {
    if (firstRecycle != null) {
      return firstRecycle(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FirstRecycleImplToJson(
      this,
    );
  }
}

abstract class _FirstRecycle implements BadgeCategory {
  const factory _FirstRecycle() = _$FirstRecycleImpl;

  factory _FirstRecycle.fromJson(Map<String, dynamic> json) =
      _$FirstRecycleImpl.fromJson;
}

/// @nodoc
abstract class _$$WeightMilestoneImplCopyWith<$Res> {
  factory _$$WeightMilestoneImplCopyWith(_$WeightMilestoneImpl value,
          $Res Function(_$WeightMilestoneImpl) then) =
      __$$WeightMilestoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeightMilestoneImplCopyWithImpl<$Res>
    extends _$BadgeCategoryCopyWithImpl<$Res, _$WeightMilestoneImpl>
    implements _$$WeightMilestoneImplCopyWith<$Res> {
  __$$WeightMilestoneImplCopyWithImpl(
      _$WeightMilestoneImpl _value, $Res Function(_$WeightMilestoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgeCategory
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$WeightMilestoneImpl implements _WeightMilestone {
  const _$WeightMilestoneImpl({final String? $type})
      : $type = $type ?? 'weightMilestone';

  factory _$WeightMilestoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightMilestoneImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BadgeCategory.weightMilestone()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeightMilestoneImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firstRecycle,
    required TResult Function() weightMilestone,
    required TResult Function() carbonSaver,
    required TResult Function() communityContributor,
    required TResult Function() consistencyChampion,
  }) {
    return weightMilestone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firstRecycle,
    TResult? Function()? weightMilestone,
    TResult? Function()? carbonSaver,
    TResult? Function()? communityContributor,
    TResult? Function()? consistencyChampion,
  }) {
    return weightMilestone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firstRecycle,
    TResult Function()? weightMilestone,
    TResult Function()? carbonSaver,
    TResult Function()? communityContributor,
    TResult Function()? consistencyChampion,
    required TResult orElse(),
  }) {
    if (weightMilestone != null) {
      return weightMilestone();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirstRecycle value) firstRecycle,
    required TResult Function(_WeightMilestone value) weightMilestone,
    required TResult Function(_CarbonSaver value) carbonSaver,
    required TResult Function(_CommunityContributor value) communityContributor,
    required TResult Function(_ConsistencyChampion value) consistencyChampion,
  }) {
    return weightMilestone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirstRecycle value)? firstRecycle,
    TResult? Function(_WeightMilestone value)? weightMilestone,
    TResult? Function(_CarbonSaver value)? carbonSaver,
    TResult? Function(_CommunityContributor value)? communityContributor,
    TResult? Function(_ConsistencyChampion value)? consistencyChampion,
  }) {
    return weightMilestone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirstRecycle value)? firstRecycle,
    TResult Function(_WeightMilestone value)? weightMilestone,
    TResult Function(_CarbonSaver value)? carbonSaver,
    TResult Function(_CommunityContributor value)? communityContributor,
    TResult Function(_ConsistencyChampion value)? consistencyChampion,
    required TResult orElse(),
  }) {
    if (weightMilestone != null) {
      return weightMilestone(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightMilestoneImplToJson(
      this,
    );
  }
}

abstract class _WeightMilestone implements BadgeCategory {
  const factory _WeightMilestone() = _$WeightMilestoneImpl;

  factory _WeightMilestone.fromJson(Map<String, dynamic> json) =
      _$WeightMilestoneImpl.fromJson;
}

/// @nodoc
abstract class _$$CarbonSaverImplCopyWith<$Res> {
  factory _$$CarbonSaverImplCopyWith(
          _$CarbonSaverImpl value, $Res Function(_$CarbonSaverImpl) then) =
      __$$CarbonSaverImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CarbonSaverImplCopyWithImpl<$Res>
    extends _$BadgeCategoryCopyWithImpl<$Res, _$CarbonSaverImpl>
    implements _$$CarbonSaverImplCopyWith<$Res> {
  __$$CarbonSaverImplCopyWithImpl(
      _$CarbonSaverImpl _value, $Res Function(_$CarbonSaverImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgeCategory
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CarbonSaverImpl implements _CarbonSaver {
  const _$CarbonSaverImpl({final String? $type})
      : $type = $type ?? 'carbonSaver';

  factory _$CarbonSaverImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarbonSaverImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BadgeCategory.carbonSaver()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CarbonSaverImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firstRecycle,
    required TResult Function() weightMilestone,
    required TResult Function() carbonSaver,
    required TResult Function() communityContributor,
    required TResult Function() consistencyChampion,
  }) {
    return carbonSaver();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firstRecycle,
    TResult? Function()? weightMilestone,
    TResult? Function()? carbonSaver,
    TResult? Function()? communityContributor,
    TResult? Function()? consistencyChampion,
  }) {
    return carbonSaver?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firstRecycle,
    TResult Function()? weightMilestone,
    TResult Function()? carbonSaver,
    TResult Function()? communityContributor,
    TResult Function()? consistencyChampion,
    required TResult orElse(),
  }) {
    if (carbonSaver != null) {
      return carbonSaver();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirstRecycle value) firstRecycle,
    required TResult Function(_WeightMilestone value) weightMilestone,
    required TResult Function(_CarbonSaver value) carbonSaver,
    required TResult Function(_CommunityContributor value) communityContributor,
    required TResult Function(_ConsistencyChampion value) consistencyChampion,
  }) {
    return carbonSaver(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirstRecycle value)? firstRecycle,
    TResult? Function(_WeightMilestone value)? weightMilestone,
    TResult? Function(_CarbonSaver value)? carbonSaver,
    TResult? Function(_CommunityContributor value)? communityContributor,
    TResult? Function(_ConsistencyChampion value)? consistencyChampion,
  }) {
    return carbonSaver?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirstRecycle value)? firstRecycle,
    TResult Function(_WeightMilestone value)? weightMilestone,
    TResult Function(_CarbonSaver value)? carbonSaver,
    TResult Function(_CommunityContributor value)? communityContributor,
    TResult Function(_ConsistencyChampion value)? consistencyChampion,
    required TResult orElse(),
  }) {
    if (carbonSaver != null) {
      return carbonSaver(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CarbonSaverImplToJson(
      this,
    );
  }
}

abstract class _CarbonSaver implements BadgeCategory {
  const factory _CarbonSaver() = _$CarbonSaverImpl;

  factory _CarbonSaver.fromJson(Map<String, dynamic> json) =
      _$CarbonSaverImpl.fromJson;
}

/// @nodoc
abstract class _$$CommunityContributorImplCopyWith<$Res> {
  factory _$$CommunityContributorImplCopyWith(_$CommunityContributorImpl value,
          $Res Function(_$CommunityContributorImpl) then) =
      __$$CommunityContributorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CommunityContributorImplCopyWithImpl<$Res>
    extends _$BadgeCategoryCopyWithImpl<$Res, _$CommunityContributorImpl>
    implements _$$CommunityContributorImplCopyWith<$Res> {
  __$$CommunityContributorImplCopyWithImpl(_$CommunityContributorImpl _value,
      $Res Function(_$CommunityContributorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgeCategory
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CommunityContributorImpl implements _CommunityContributor {
  const _$CommunityContributorImpl({final String? $type})
      : $type = $type ?? 'communityContributor';

  factory _$CommunityContributorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityContributorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BadgeCategory.communityContributor()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityContributorImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firstRecycle,
    required TResult Function() weightMilestone,
    required TResult Function() carbonSaver,
    required TResult Function() communityContributor,
    required TResult Function() consistencyChampion,
  }) {
    return communityContributor();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firstRecycle,
    TResult? Function()? weightMilestone,
    TResult? Function()? carbonSaver,
    TResult? Function()? communityContributor,
    TResult? Function()? consistencyChampion,
  }) {
    return communityContributor?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firstRecycle,
    TResult Function()? weightMilestone,
    TResult Function()? carbonSaver,
    TResult Function()? communityContributor,
    TResult Function()? consistencyChampion,
    required TResult orElse(),
  }) {
    if (communityContributor != null) {
      return communityContributor();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirstRecycle value) firstRecycle,
    required TResult Function(_WeightMilestone value) weightMilestone,
    required TResult Function(_CarbonSaver value) carbonSaver,
    required TResult Function(_CommunityContributor value) communityContributor,
    required TResult Function(_ConsistencyChampion value) consistencyChampion,
  }) {
    return communityContributor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirstRecycle value)? firstRecycle,
    TResult? Function(_WeightMilestone value)? weightMilestone,
    TResult? Function(_CarbonSaver value)? carbonSaver,
    TResult? Function(_CommunityContributor value)? communityContributor,
    TResult? Function(_ConsistencyChampion value)? consistencyChampion,
  }) {
    return communityContributor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirstRecycle value)? firstRecycle,
    TResult Function(_WeightMilestone value)? weightMilestone,
    TResult Function(_CarbonSaver value)? carbonSaver,
    TResult Function(_CommunityContributor value)? communityContributor,
    TResult Function(_ConsistencyChampion value)? consistencyChampion,
    required TResult orElse(),
  }) {
    if (communityContributor != null) {
      return communityContributor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityContributorImplToJson(
      this,
    );
  }
}

abstract class _CommunityContributor implements BadgeCategory {
  const factory _CommunityContributor() = _$CommunityContributorImpl;

  factory _CommunityContributor.fromJson(Map<String, dynamic> json) =
      _$CommunityContributorImpl.fromJson;
}

/// @nodoc
abstract class _$$ConsistencyChampionImplCopyWith<$Res> {
  factory _$$ConsistencyChampionImplCopyWith(_$ConsistencyChampionImpl value,
          $Res Function(_$ConsistencyChampionImpl) then) =
      __$$ConsistencyChampionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConsistencyChampionImplCopyWithImpl<$Res>
    extends _$BadgeCategoryCopyWithImpl<$Res, _$ConsistencyChampionImpl>
    implements _$$ConsistencyChampionImplCopyWith<$Res> {
  __$$ConsistencyChampionImplCopyWithImpl(_$ConsistencyChampionImpl _value,
      $Res Function(_$ConsistencyChampionImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgeCategory
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ConsistencyChampionImpl implements _ConsistencyChampion {
  const _$ConsistencyChampionImpl({final String? $type})
      : $type = $type ?? 'consistencyChampion';

  factory _$ConsistencyChampionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsistencyChampionImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BadgeCategory.consistencyChampion()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsistencyChampionImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firstRecycle,
    required TResult Function() weightMilestone,
    required TResult Function() carbonSaver,
    required TResult Function() communityContributor,
    required TResult Function() consistencyChampion,
  }) {
    return consistencyChampion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firstRecycle,
    TResult? Function()? weightMilestone,
    TResult? Function()? carbonSaver,
    TResult? Function()? communityContributor,
    TResult? Function()? consistencyChampion,
  }) {
    return consistencyChampion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firstRecycle,
    TResult Function()? weightMilestone,
    TResult Function()? carbonSaver,
    TResult Function()? communityContributor,
    TResult Function()? consistencyChampion,
    required TResult orElse(),
  }) {
    if (consistencyChampion != null) {
      return consistencyChampion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirstRecycle value) firstRecycle,
    required TResult Function(_WeightMilestone value) weightMilestone,
    required TResult Function(_CarbonSaver value) carbonSaver,
    required TResult Function(_CommunityContributor value) communityContributor,
    required TResult Function(_ConsistencyChampion value) consistencyChampion,
  }) {
    return consistencyChampion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirstRecycle value)? firstRecycle,
    TResult? Function(_WeightMilestone value)? weightMilestone,
    TResult? Function(_CarbonSaver value)? carbonSaver,
    TResult? Function(_CommunityContributor value)? communityContributor,
    TResult? Function(_ConsistencyChampion value)? consistencyChampion,
  }) {
    return consistencyChampion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirstRecycle value)? firstRecycle,
    TResult Function(_WeightMilestone value)? weightMilestone,
    TResult Function(_CarbonSaver value)? carbonSaver,
    TResult Function(_CommunityContributor value)? communityContributor,
    TResult Function(_ConsistencyChampion value)? consistencyChampion,
    required TResult orElse(),
  }) {
    if (consistencyChampion != null) {
      return consistencyChampion(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsistencyChampionImplToJson(
      this,
    );
  }
}

abstract class _ConsistencyChampion implements BadgeCategory {
  const factory _ConsistencyChampion() = _$ConsistencyChampionImpl;

  factory _ConsistencyChampion.fromJson(Map<String, dynamic> json) =
      _$ConsistencyChampionImpl.fromJson;
}
