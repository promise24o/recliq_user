// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankInfo _$BankInfoFromJson(Map<String, dynamic> json) {
  return _BankInfo.fromJson(json);
}

/// @nodoc
mixin _$BankInfo {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  /// Serializes this BankInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankInfoCopyWith<BankInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInfoCopyWith<$Res> {
  factory $BankInfoCopyWith(BankInfo value, $Res Function(BankInfo) then) =
      _$BankInfoCopyWithImpl<$Res, BankInfo>;
  @useResult
  $Res call({String name, String code, String slug});
}

/// @nodoc
class _$BankInfoCopyWithImpl<$Res, $Val extends BankInfo>
    implements $BankInfoCopyWith<$Res> {
  _$BankInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankInfoImplCopyWith<$Res>
    implements $BankInfoCopyWith<$Res> {
  factory _$$BankInfoImplCopyWith(
          _$BankInfoImpl value, $Res Function(_$BankInfoImpl) then) =
      __$$BankInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code, String slug});
}

/// @nodoc
class __$$BankInfoImplCopyWithImpl<$Res>
    extends _$BankInfoCopyWithImpl<$Res, _$BankInfoImpl>
    implements _$$BankInfoImplCopyWith<$Res> {
  __$$BankInfoImplCopyWithImpl(
      _$BankInfoImpl _value, $Res Function(_$BankInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BankInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? slug = null,
  }) {
    return _then(_$BankInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankInfoImpl implements _BankInfo {
  const _$BankInfoImpl(
      {required this.name, required this.code, required this.slug});

  factory _$BankInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final String slug;

  @override
  String toString() {
    return 'BankInfo(name: $name, code: $code, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, slug);

  /// Create a copy of BankInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankInfoImplCopyWith<_$BankInfoImpl> get copyWith =>
      __$$BankInfoImplCopyWithImpl<_$BankInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankInfoImplToJson(
      this,
    );
  }
}

abstract class _BankInfo implements BankInfo {
  const factory _BankInfo(
      {required final String name,
      required final String code,
      required final String slug}) = _$BankInfoImpl;

  factory _BankInfo.fromJson(Map<String, dynamic> json) =
      _$BankInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  String get slug;

  /// Create a copy of BankInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankInfoImplCopyWith<_$BankInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountResolution _$AccountResolutionFromJson(Map<String, dynamic> json) {
  return _AccountResolution.fromJson(json);
}

/// @nodoc
mixin _$AccountResolution {
  @JsonKey(name: 'account_number')
  String get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name')
  String get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_id')
  int get bankId => throw _privateConstructorUsedError;

  /// Serializes this AccountResolution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountResolutionCopyWith<AccountResolution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountResolutionCopyWith<$Res> {
  factory $AccountResolutionCopyWith(
          AccountResolution value, $Res Function(AccountResolution) then) =
      _$AccountResolutionCopyWithImpl<$Res, AccountResolution>;
  @useResult
  $Res call(
      {@JsonKey(name: 'account_number') String accountNumber,
      @JsonKey(name: 'account_name') String accountName,
      @JsonKey(name: 'bank_id') int bankId});
}

/// @nodoc
class _$AccountResolutionCopyWithImpl<$Res, $Val extends AccountResolution>
    implements $AccountResolutionCopyWith<$Res> {
  _$AccountResolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? accountName = null,
    Object? bankId = null,
  }) {
    return _then(_value.copyWith(
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountResolutionImplCopyWith<$Res>
    implements $AccountResolutionCopyWith<$Res> {
  factory _$$AccountResolutionImplCopyWith(_$AccountResolutionImpl value,
          $Res Function(_$AccountResolutionImpl) then) =
      __$$AccountResolutionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'account_number') String accountNumber,
      @JsonKey(name: 'account_name') String accountName,
      @JsonKey(name: 'bank_id') int bankId});
}

/// @nodoc
class __$$AccountResolutionImplCopyWithImpl<$Res>
    extends _$AccountResolutionCopyWithImpl<$Res, _$AccountResolutionImpl>
    implements _$$AccountResolutionImplCopyWith<$Res> {
  __$$AccountResolutionImplCopyWithImpl(_$AccountResolutionImpl _value,
      $Res Function(_$AccountResolutionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? accountName = null,
    Object? bankId = null,
  }) {
    return _then(_$AccountResolutionImpl(
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountResolutionImpl implements _AccountResolution {
  const _$AccountResolutionImpl(
      {@JsonKey(name: 'account_number') required this.accountNumber,
      @JsonKey(name: 'account_name') required this.accountName,
      @JsonKey(name: 'bank_id') required this.bankId});

  factory _$AccountResolutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountResolutionImplFromJson(json);

  @override
  @JsonKey(name: 'account_number')
  final String accountNumber;
  @override
  @JsonKey(name: 'account_name')
  final String accountName;
  @override
  @JsonKey(name: 'bank_id')
  final int bankId;

  @override
  String toString() {
    return 'AccountResolution(accountNumber: $accountNumber, accountName: $accountName, bankId: $bankId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountResolutionImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.bankId, bankId) || other.bankId == bankId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accountNumber, accountName, bankId);

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountResolutionImplCopyWith<_$AccountResolutionImpl> get copyWith =>
      __$$AccountResolutionImplCopyWithImpl<_$AccountResolutionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountResolutionImplToJson(
      this,
    );
  }
}

abstract class _AccountResolution implements AccountResolution {
  const factory _AccountResolution(
          {@JsonKey(name: 'account_number') required final String accountNumber,
          @JsonKey(name: 'account_name') required final String accountName,
          @JsonKey(name: 'bank_id') required final int bankId}) =
      _$AccountResolutionImpl;

  factory _AccountResolution.fromJson(Map<String, dynamic> json) =
      _$AccountResolutionImpl.fromJson;

  @override
  @JsonKey(name: 'account_number')
  String get accountNumber;
  @override
  @JsonKey(name: 'account_name')
  String get accountName;
  @override
  @JsonKey(name: 'bank_id')
  int get bankId;

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountResolutionImplCopyWith<_$AccountResolutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
