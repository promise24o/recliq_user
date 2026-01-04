// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Bank {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get longcode => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get payWithBank => throw _privateConstructorUsedError;
  bool get supportsTransfer => throw _privateConstructorUsedError;
  bool get availableForDirectDebit => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankCopyWith<Bank> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankCopyWith<$Res> {
  factory $BankCopyWith(Bank value, $Res Function(Bank) then) =
      _$BankCopyWithImpl<$Res, Bank>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String code,
      String longcode,
      String country,
      String currency,
      String type,
      bool payWithBank,
      bool supportsTransfer,
      bool availableForDirectDebit,
      bool active,
      bool isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BankCopyWithImpl<$Res, $Val extends Bank>
    implements $BankCopyWith<$Res> {
  _$BankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? code = null,
    Object? longcode = null,
    Object? country = null,
    Object? currency = null,
    Object? type = null,
    Object? payWithBank = null,
    Object? supportsTransfer = null,
    Object? availableForDirectDebit = null,
    Object? active = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      longcode: null == longcode
          ? _value.longcode
          : longcode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payWithBank: null == payWithBank
          ? _value.payWithBank
          : payWithBank // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsTransfer: null == supportsTransfer
          ? _value.supportsTransfer
          : supportsTransfer // ignore: cast_nullable_to_non_nullable
              as bool,
      availableForDirectDebit: null == availableForDirectDebit
          ? _value.availableForDirectDebit
          : availableForDirectDebit // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankImplCopyWith<$Res> implements $BankCopyWith<$Res> {
  factory _$$BankImplCopyWith(
          _$BankImpl value, $Res Function(_$BankImpl) then) =
      __$$BankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String code,
      String longcode,
      String country,
      String currency,
      String type,
      bool payWithBank,
      bool supportsTransfer,
      bool availableForDirectDebit,
      bool active,
      bool isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$BankImplCopyWithImpl<$Res>
    extends _$BankCopyWithImpl<$Res, _$BankImpl>
    implements _$$BankImplCopyWith<$Res> {
  __$$BankImplCopyWithImpl(_$BankImpl _value, $Res Function(_$BankImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? code = null,
    Object? longcode = null,
    Object? country = null,
    Object? currency = null,
    Object? type = null,
    Object? payWithBank = null,
    Object? supportsTransfer = null,
    Object? availableForDirectDebit = null,
    Object? active = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BankImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      longcode: null == longcode
          ? _value.longcode
          : longcode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payWithBank: null == payWithBank
          ? _value.payWithBank
          : payWithBank // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsTransfer: null == supportsTransfer
          ? _value.supportsTransfer
          : supportsTransfer // ignore: cast_nullable_to_non_nullable
              as bool,
      availableForDirectDebit: null == availableForDirectDebit
          ? _value.availableForDirectDebit
          : availableForDirectDebit // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$BankImpl implements _Bank {
  const _$BankImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.code,
      required this.longcode,
      required this.country,
      required this.currency,
      required this.type,
      this.payWithBank = false,
      this.supportsTransfer = true,
      this.availableForDirectDebit = false,
      this.active = true,
      this.isDeleted = false,
      this.createdAt,
      this.updatedAt});

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String code;
  @override
  final String longcode;
  @override
  final String country;
  @override
  final String currency;
  @override
  final String type;
  @override
  @JsonKey()
  final bool payWithBank;
  @override
  @JsonKey()
  final bool supportsTransfer;
  @override
  @JsonKey()
  final bool availableForDirectDebit;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.longcode, longcode) ||
                other.longcode == longcode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.payWithBank, payWithBank) ||
                other.payWithBank == payWithBank) &&
            (identical(other.supportsTransfer, supportsTransfer) ||
                other.supportsTransfer == supportsTransfer) &&
            (identical(
                    other.availableForDirectDebit, availableForDirectDebit) ||
                other.availableForDirectDebit == availableForDirectDebit) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      slug,
      code,
      longcode,
      country,
      currency,
      type,
      payWithBank,
      supportsTransfer,
      availableForDirectDebit,
      active,
      isDeleted,
      createdAt,
      updatedAt);

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankImplCopyWith<_$BankImpl> get copyWith =>
      __$$BankImplCopyWithImpl<_$BankImpl>(this, _$identity);
}

abstract class _Bank implements Bank {
  const factory _Bank(
      {required final int id,
      required final String name,
      required final String slug,
      required final String code,
      required final String longcode,
      required final String country,
      required final String currency,
      required final String type,
      final bool payWithBank,
      final bool supportsTransfer,
      final bool availableForDirectDebit,
      final bool active,
      final bool isDeleted,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$BankImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get code;
  @override
  String get longcode;
  @override
  String get country;
  @override
  String get currency;
  @override
  String get type;
  @override
  bool get payWithBank;
  @override
  bool get supportsTransfer;
  @override
  bool get availableForDirectDebit;
  @override
  bool get active;
  @override
  bool get isDeleted;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankImplCopyWith<_$BankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
