// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_benefit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardBenefit _$RewardBenefitFromJson(Map<String, dynamic> json) {
  return _RewardBenefit.fromJson(json);
}

/// @nodoc
mixin _$RewardBenefit {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get pointsRequired => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  BenefitType get type => throw _privateConstructorUsedError;

  /// Serializes this RewardBenefit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardBenefit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardBenefitCopyWith<RewardBenefit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardBenefitCopyWith<$Res> {
  factory $RewardBenefitCopyWith(
          RewardBenefit value, $Res Function(RewardBenefit) then) =
      _$RewardBenefitCopyWithImpl<$Res, RewardBenefit>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int pointsRequired,
      String icon,
      bool isAvailable,
      BenefitType type});

  $BenefitTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$RewardBenefitCopyWithImpl<$Res, $Val extends RewardBenefit>
    implements $RewardBenefitCopyWith<$Res> {
  _$RewardBenefitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardBenefit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? pointsRequired = null,
    Object? icon = null,
    Object? isAvailable = null,
    Object? type = null,
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
      pointsRequired: null == pointsRequired
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BenefitType,
    ) as $Val);
  }

  /// Create a copy of RewardBenefit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BenefitTypeCopyWith<$Res> get type {
    return $BenefitTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RewardBenefitImplCopyWith<$Res>
    implements $RewardBenefitCopyWith<$Res> {
  factory _$$RewardBenefitImplCopyWith(
          _$RewardBenefitImpl value, $Res Function(_$RewardBenefitImpl) then) =
      __$$RewardBenefitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int pointsRequired,
      String icon,
      bool isAvailable,
      BenefitType type});

  @override
  $BenefitTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$RewardBenefitImplCopyWithImpl<$Res>
    extends _$RewardBenefitCopyWithImpl<$Res, _$RewardBenefitImpl>
    implements _$$RewardBenefitImplCopyWith<$Res> {
  __$$RewardBenefitImplCopyWithImpl(
      _$RewardBenefitImpl _value, $Res Function(_$RewardBenefitImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardBenefit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? pointsRequired = null,
    Object? icon = null,
    Object? isAvailable = null,
    Object? type = null,
  }) {
    return _then(_$RewardBenefitImpl(
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
      pointsRequired: null == pointsRequired
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BenefitType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardBenefitImpl implements _RewardBenefit {
  const _$RewardBenefitImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.pointsRequired,
      required this.icon,
      required this.isAvailable,
      required this.type});

  factory _$RewardBenefitImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardBenefitImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int pointsRequired;
  @override
  final String icon;
  @override
  final bool isAvailable;
  @override
  final BenefitType type;

  @override
  String toString() {
    return 'RewardBenefit(id: $id, title: $title, description: $description, pointsRequired: $pointsRequired, icon: $icon, isAvailable: $isAvailable, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardBenefitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pointsRequired, pointsRequired) ||
                other.pointsRequired == pointsRequired) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      pointsRequired, icon, isAvailable, type);

  /// Create a copy of RewardBenefit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardBenefitImplCopyWith<_$RewardBenefitImpl> get copyWith =>
      __$$RewardBenefitImplCopyWithImpl<_$RewardBenefitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardBenefitImplToJson(
      this,
    );
  }
}

abstract class _RewardBenefit implements RewardBenefit {
  const factory _RewardBenefit(
      {required final String id,
      required final String title,
      required final String description,
      required final int pointsRequired,
      required final String icon,
      required final bool isAvailable,
      required final BenefitType type}) = _$RewardBenefitImpl;

  factory _RewardBenefit.fromJson(Map<String, dynamic> json) =
      _$RewardBenefitImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get pointsRequired;
  @override
  String get icon;
  @override
  bool get isAvailable;
  @override
  BenefitType get type;

  /// Create a copy of RewardBenefit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardBenefitImplCopyWith<_$RewardBenefitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BenefitType _$BenefitTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'walletCredits':
      return _WalletCredits.fromJson(json);
    case 'airtimeDiscount':
      return _AirtimeDiscount.fromJson(json);
    case 'priorityPickup':
      return _PriorityPickup.fromJson(json);
    case 'exclusiveBadge':
      return _ExclusiveBadge.fromJson(json);
    case 'raffleEntry':
      return _RaffleEntry.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'BenefitType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$BenefitType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() walletCredits,
    required TResult Function() airtimeDiscount,
    required TResult Function() priorityPickup,
    required TResult Function() exclusiveBadge,
    required TResult Function() raffleEntry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? walletCredits,
    TResult? Function()? airtimeDiscount,
    TResult? Function()? priorityPickup,
    TResult? Function()? exclusiveBadge,
    TResult? Function()? raffleEntry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? walletCredits,
    TResult Function()? airtimeDiscount,
    TResult Function()? priorityPickup,
    TResult Function()? exclusiveBadge,
    TResult Function()? raffleEntry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WalletCredits value) walletCredits,
    required TResult Function(_AirtimeDiscount value) airtimeDiscount,
    required TResult Function(_PriorityPickup value) priorityPickup,
    required TResult Function(_ExclusiveBadge value) exclusiveBadge,
    required TResult Function(_RaffleEntry value) raffleEntry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WalletCredits value)? walletCredits,
    TResult? Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult? Function(_PriorityPickup value)? priorityPickup,
    TResult? Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult? Function(_RaffleEntry value)? raffleEntry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WalletCredits value)? walletCredits,
    TResult Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult Function(_PriorityPickup value)? priorityPickup,
    TResult Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult Function(_RaffleEntry value)? raffleEntry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this BenefitType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BenefitTypeCopyWith<$Res> {
  factory $BenefitTypeCopyWith(
          BenefitType value, $Res Function(BenefitType) then) =
      _$BenefitTypeCopyWithImpl<$Res, BenefitType>;
}

/// @nodoc
class _$BenefitTypeCopyWithImpl<$Res, $Val extends BenefitType>
    implements $BenefitTypeCopyWith<$Res> {
  _$BenefitTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BenefitType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WalletCreditsImplCopyWith<$Res> {
  factory _$$WalletCreditsImplCopyWith(
          _$WalletCreditsImpl value, $Res Function(_$WalletCreditsImpl) then) =
      __$$WalletCreditsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WalletCreditsImplCopyWithImpl<$Res>
    extends _$BenefitTypeCopyWithImpl<$Res, _$WalletCreditsImpl>
    implements _$$WalletCreditsImplCopyWith<$Res> {
  __$$WalletCreditsImplCopyWithImpl(
      _$WalletCreditsImpl _value, $Res Function(_$WalletCreditsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BenefitType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$WalletCreditsImpl implements _WalletCredits {
  const _$WalletCreditsImpl({final String? $type})
      : $type = $type ?? 'walletCredits';

  factory _$WalletCreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletCreditsImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BenefitType.walletCredits()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WalletCreditsImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() walletCredits,
    required TResult Function() airtimeDiscount,
    required TResult Function() priorityPickup,
    required TResult Function() exclusiveBadge,
    required TResult Function() raffleEntry,
  }) {
    return walletCredits();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? walletCredits,
    TResult? Function()? airtimeDiscount,
    TResult? Function()? priorityPickup,
    TResult? Function()? exclusiveBadge,
    TResult? Function()? raffleEntry,
  }) {
    return walletCredits?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? walletCredits,
    TResult Function()? airtimeDiscount,
    TResult Function()? priorityPickup,
    TResult Function()? exclusiveBadge,
    TResult Function()? raffleEntry,
    required TResult orElse(),
  }) {
    if (walletCredits != null) {
      return walletCredits();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WalletCredits value) walletCredits,
    required TResult Function(_AirtimeDiscount value) airtimeDiscount,
    required TResult Function(_PriorityPickup value) priorityPickup,
    required TResult Function(_ExclusiveBadge value) exclusiveBadge,
    required TResult Function(_RaffleEntry value) raffleEntry,
  }) {
    return walletCredits(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WalletCredits value)? walletCredits,
    TResult? Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult? Function(_PriorityPickup value)? priorityPickup,
    TResult? Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult? Function(_RaffleEntry value)? raffleEntry,
  }) {
    return walletCredits?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WalletCredits value)? walletCredits,
    TResult Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult Function(_PriorityPickup value)? priorityPickup,
    TResult Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult Function(_RaffleEntry value)? raffleEntry,
    required TResult orElse(),
  }) {
    if (walletCredits != null) {
      return walletCredits(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletCreditsImplToJson(
      this,
    );
  }
}

abstract class _WalletCredits implements BenefitType {
  const factory _WalletCredits() = _$WalletCreditsImpl;

  factory _WalletCredits.fromJson(Map<String, dynamic> json) =
      _$WalletCreditsImpl.fromJson;
}

/// @nodoc
abstract class _$$AirtimeDiscountImplCopyWith<$Res> {
  factory _$$AirtimeDiscountImplCopyWith(_$AirtimeDiscountImpl value,
          $Res Function(_$AirtimeDiscountImpl) then) =
      __$$AirtimeDiscountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AirtimeDiscountImplCopyWithImpl<$Res>
    extends _$BenefitTypeCopyWithImpl<$Res, _$AirtimeDiscountImpl>
    implements _$$AirtimeDiscountImplCopyWith<$Res> {
  __$$AirtimeDiscountImplCopyWithImpl(
      _$AirtimeDiscountImpl _value, $Res Function(_$AirtimeDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of BenefitType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AirtimeDiscountImpl implements _AirtimeDiscount {
  const _$AirtimeDiscountImpl({final String? $type})
      : $type = $type ?? 'airtimeDiscount';

  factory _$AirtimeDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirtimeDiscountImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BenefitType.airtimeDiscount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AirtimeDiscountImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() walletCredits,
    required TResult Function() airtimeDiscount,
    required TResult Function() priorityPickup,
    required TResult Function() exclusiveBadge,
    required TResult Function() raffleEntry,
  }) {
    return airtimeDiscount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? walletCredits,
    TResult? Function()? airtimeDiscount,
    TResult? Function()? priorityPickup,
    TResult? Function()? exclusiveBadge,
    TResult? Function()? raffleEntry,
  }) {
    return airtimeDiscount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? walletCredits,
    TResult Function()? airtimeDiscount,
    TResult Function()? priorityPickup,
    TResult Function()? exclusiveBadge,
    TResult Function()? raffleEntry,
    required TResult orElse(),
  }) {
    if (airtimeDiscount != null) {
      return airtimeDiscount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WalletCredits value) walletCredits,
    required TResult Function(_AirtimeDiscount value) airtimeDiscount,
    required TResult Function(_PriorityPickup value) priorityPickup,
    required TResult Function(_ExclusiveBadge value) exclusiveBadge,
    required TResult Function(_RaffleEntry value) raffleEntry,
  }) {
    return airtimeDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WalletCredits value)? walletCredits,
    TResult? Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult? Function(_PriorityPickup value)? priorityPickup,
    TResult? Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult? Function(_RaffleEntry value)? raffleEntry,
  }) {
    return airtimeDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WalletCredits value)? walletCredits,
    TResult Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult Function(_PriorityPickup value)? priorityPickup,
    TResult Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult Function(_RaffleEntry value)? raffleEntry,
    required TResult orElse(),
  }) {
    if (airtimeDiscount != null) {
      return airtimeDiscount(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AirtimeDiscountImplToJson(
      this,
    );
  }
}

abstract class _AirtimeDiscount implements BenefitType {
  const factory _AirtimeDiscount() = _$AirtimeDiscountImpl;

  factory _AirtimeDiscount.fromJson(Map<String, dynamic> json) =
      _$AirtimeDiscountImpl.fromJson;
}

/// @nodoc
abstract class _$$PriorityPickupImplCopyWith<$Res> {
  factory _$$PriorityPickupImplCopyWith(_$PriorityPickupImpl value,
          $Res Function(_$PriorityPickupImpl) then) =
      __$$PriorityPickupImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PriorityPickupImplCopyWithImpl<$Res>
    extends _$BenefitTypeCopyWithImpl<$Res, _$PriorityPickupImpl>
    implements _$$PriorityPickupImplCopyWith<$Res> {
  __$$PriorityPickupImplCopyWithImpl(
      _$PriorityPickupImpl _value, $Res Function(_$PriorityPickupImpl) _then)
      : super(_value, _then);

  /// Create a copy of BenefitType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PriorityPickupImpl implements _PriorityPickup {
  const _$PriorityPickupImpl({final String? $type})
      : $type = $type ?? 'priorityPickup';

  factory _$PriorityPickupImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriorityPickupImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BenefitType.priorityPickup()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PriorityPickupImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() walletCredits,
    required TResult Function() airtimeDiscount,
    required TResult Function() priorityPickup,
    required TResult Function() exclusiveBadge,
    required TResult Function() raffleEntry,
  }) {
    return priorityPickup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? walletCredits,
    TResult? Function()? airtimeDiscount,
    TResult? Function()? priorityPickup,
    TResult? Function()? exclusiveBadge,
    TResult? Function()? raffleEntry,
  }) {
    return priorityPickup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? walletCredits,
    TResult Function()? airtimeDiscount,
    TResult Function()? priorityPickup,
    TResult Function()? exclusiveBadge,
    TResult Function()? raffleEntry,
    required TResult orElse(),
  }) {
    if (priorityPickup != null) {
      return priorityPickup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WalletCredits value) walletCredits,
    required TResult Function(_AirtimeDiscount value) airtimeDiscount,
    required TResult Function(_PriorityPickup value) priorityPickup,
    required TResult Function(_ExclusiveBadge value) exclusiveBadge,
    required TResult Function(_RaffleEntry value) raffleEntry,
  }) {
    return priorityPickup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WalletCredits value)? walletCredits,
    TResult? Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult? Function(_PriorityPickup value)? priorityPickup,
    TResult? Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult? Function(_RaffleEntry value)? raffleEntry,
  }) {
    return priorityPickup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WalletCredits value)? walletCredits,
    TResult Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult Function(_PriorityPickup value)? priorityPickup,
    TResult Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult Function(_RaffleEntry value)? raffleEntry,
    required TResult orElse(),
  }) {
    if (priorityPickup != null) {
      return priorityPickup(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PriorityPickupImplToJson(
      this,
    );
  }
}

abstract class _PriorityPickup implements BenefitType {
  const factory _PriorityPickup() = _$PriorityPickupImpl;

  factory _PriorityPickup.fromJson(Map<String, dynamic> json) =
      _$PriorityPickupImpl.fromJson;
}

/// @nodoc
abstract class _$$ExclusiveBadgeImplCopyWith<$Res> {
  factory _$$ExclusiveBadgeImplCopyWith(_$ExclusiveBadgeImpl value,
          $Res Function(_$ExclusiveBadgeImpl) then) =
      __$$ExclusiveBadgeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExclusiveBadgeImplCopyWithImpl<$Res>
    extends _$BenefitTypeCopyWithImpl<$Res, _$ExclusiveBadgeImpl>
    implements _$$ExclusiveBadgeImplCopyWith<$Res> {
  __$$ExclusiveBadgeImplCopyWithImpl(
      _$ExclusiveBadgeImpl _value, $Res Function(_$ExclusiveBadgeImpl) _then)
      : super(_value, _then);

  /// Create a copy of BenefitType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ExclusiveBadgeImpl implements _ExclusiveBadge {
  const _$ExclusiveBadgeImpl({final String? $type})
      : $type = $type ?? 'exclusiveBadge';

  factory _$ExclusiveBadgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExclusiveBadgeImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BenefitType.exclusiveBadge()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExclusiveBadgeImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() walletCredits,
    required TResult Function() airtimeDiscount,
    required TResult Function() priorityPickup,
    required TResult Function() exclusiveBadge,
    required TResult Function() raffleEntry,
  }) {
    return exclusiveBadge();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? walletCredits,
    TResult? Function()? airtimeDiscount,
    TResult? Function()? priorityPickup,
    TResult? Function()? exclusiveBadge,
    TResult? Function()? raffleEntry,
  }) {
    return exclusiveBadge?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? walletCredits,
    TResult Function()? airtimeDiscount,
    TResult Function()? priorityPickup,
    TResult Function()? exclusiveBadge,
    TResult Function()? raffleEntry,
    required TResult orElse(),
  }) {
    if (exclusiveBadge != null) {
      return exclusiveBadge();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WalletCredits value) walletCredits,
    required TResult Function(_AirtimeDiscount value) airtimeDiscount,
    required TResult Function(_PriorityPickup value) priorityPickup,
    required TResult Function(_ExclusiveBadge value) exclusiveBadge,
    required TResult Function(_RaffleEntry value) raffleEntry,
  }) {
    return exclusiveBadge(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WalletCredits value)? walletCredits,
    TResult? Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult? Function(_PriorityPickup value)? priorityPickup,
    TResult? Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult? Function(_RaffleEntry value)? raffleEntry,
  }) {
    return exclusiveBadge?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WalletCredits value)? walletCredits,
    TResult Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult Function(_PriorityPickup value)? priorityPickup,
    TResult Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult Function(_RaffleEntry value)? raffleEntry,
    required TResult orElse(),
  }) {
    if (exclusiveBadge != null) {
      return exclusiveBadge(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExclusiveBadgeImplToJson(
      this,
    );
  }
}

abstract class _ExclusiveBadge implements BenefitType {
  const factory _ExclusiveBadge() = _$ExclusiveBadgeImpl;

  factory _ExclusiveBadge.fromJson(Map<String, dynamic> json) =
      _$ExclusiveBadgeImpl.fromJson;
}

/// @nodoc
abstract class _$$RaffleEntryImplCopyWith<$Res> {
  factory _$$RaffleEntryImplCopyWith(
          _$RaffleEntryImpl value, $Res Function(_$RaffleEntryImpl) then) =
      __$$RaffleEntryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RaffleEntryImplCopyWithImpl<$Res>
    extends _$BenefitTypeCopyWithImpl<$Res, _$RaffleEntryImpl>
    implements _$$RaffleEntryImplCopyWith<$Res> {
  __$$RaffleEntryImplCopyWithImpl(
      _$RaffleEntryImpl _value, $Res Function(_$RaffleEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of BenefitType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$RaffleEntryImpl implements _RaffleEntry {
  const _$RaffleEntryImpl({final String? $type})
      : $type = $type ?? 'raffleEntry';

  factory _$RaffleEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RaffleEntryImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BenefitType.raffleEntry()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RaffleEntryImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() walletCredits,
    required TResult Function() airtimeDiscount,
    required TResult Function() priorityPickup,
    required TResult Function() exclusiveBadge,
    required TResult Function() raffleEntry,
  }) {
    return raffleEntry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? walletCredits,
    TResult? Function()? airtimeDiscount,
    TResult? Function()? priorityPickup,
    TResult? Function()? exclusiveBadge,
    TResult? Function()? raffleEntry,
  }) {
    return raffleEntry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? walletCredits,
    TResult Function()? airtimeDiscount,
    TResult Function()? priorityPickup,
    TResult Function()? exclusiveBadge,
    TResult Function()? raffleEntry,
    required TResult orElse(),
  }) {
    if (raffleEntry != null) {
      return raffleEntry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WalletCredits value) walletCredits,
    required TResult Function(_AirtimeDiscount value) airtimeDiscount,
    required TResult Function(_PriorityPickup value) priorityPickup,
    required TResult Function(_ExclusiveBadge value) exclusiveBadge,
    required TResult Function(_RaffleEntry value) raffleEntry,
  }) {
    return raffleEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WalletCredits value)? walletCredits,
    TResult? Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult? Function(_PriorityPickup value)? priorityPickup,
    TResult? Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult? Function(_RaffleEntry value)? raffleEntry,
  }) {
    return raffleEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WalletCredits value)? walletCredits,
    TResult Function(_AirtimeDiscount value)? airtimeDiscount,
    TResult Function(_PriorityPickup value)? priorityPickup,
    TResult Function(_ExclusiveBadge value)? exclusiveBadge,
    TResult Function(_RaffleEntry value)? raffleEntry,
    required TResult orElse(),
  }) {
    if (raffleEntry != null) {
      return raffleEntry(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RaffleEntryImplToJson(
      this,
    );
  }
}

abstract class _RaffleEntry implements BenefitType {
  const factory _RaffleEntry() = _$RaffleEntryImpl;

  factory _RaffleEntry.fromJson(Map<String, dynamic> json) =
      _$RaffleEntryImpl.fromJson;
}
