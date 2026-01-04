// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return _BankModel.fromJson(json);
}

/// @nodoc
mixin _$BankModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get longcode => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'Nigeria')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'NGN')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'nuban')
  String get type => throw _privateConstructorUsedError;
  bool get payWithBank => throw _privateConstructorUsedError;
  bool get supportsTransfer => throw _privateConstructorUsedError;
  bool get availableForDirectDebit => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BankModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankModelCopyWith<BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankModelCopyWith<$Res> {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) then) =
      _$BankModelCopyWithImpl<$Res, BankModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String code,
      String longcode,
      @JsonKey(defaultValue: 'Nigeria') String country,
      @JsonKey(defaultValue: 'NGN') String currency,
      @JsonKey(defaultValue: 'nuban') String type,
      bool payWithBank,
      bool supportsTransfer,
      bool availableForDirectDebit,
      bool active,
      bool isDeleted,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class _$BankModelCopyWithImpl<$Res, $Val extends BankModel>
    implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankModel
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
abstract class _$$BankModelImplCopyWith<$Res>
    implements $BankModelCopyWith<$Res> {
  factory _$$BankModelImplCopyWith(
          _$BankModelImpl value, $Res Function(_$BankModelImpl) then) =
      __$$BankModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String code,
      String longcode,
      @JsonKey(defaultValue: 'Nigeria') String country,
      @JsonKey(defaultValue: 'NGN') String currency,
      @JsonKey(defaultValue: 'nuban') String type,
      bool payWithBank,
      bool supportsTransfer,
      bool availableForDirectDebit,
      bool active,
      bool isDeleted,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class __$$BankModelImplCopyWithImpl<$Res>
    extends _$BankModelCopyWithImpl<$Res, _$BankModelImpl>
    implements _$$BankModelImplCopyWith<$Res> {
  __$$BankModelImplCopyWithImpl(
      _$BankModelImpl _value, $Res Function(_$BankModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BankModel
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
    return _then(_$BankModelImpl(
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
@JsonSerializable()
class _$BankModelImpl extends _BankModel {
  const _$BankModelImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.code,
      required this.longcode,
      @JsonKey(defaultValue: 'Nigeria') required this.country,
      @JsonKey(defaultValue: 'NGN') required this.currency,
      @JsonKey(defaultValue: 'nuban') required this.type,
      this.payWithBank = false,
      this.supportsTransfer = true,
      this.availableForDirectDebit = false,
      this.active = true,
      this.isDeleted = false,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt})
      : super._();

  factory _$BankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankModelImplFromJson(json);

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
  @JsonKey(defaultValue: 'Nigeria')
  final String country;
  @override
  @JsonKey(defaultValue: 'NGN')
  final String currency;
  @override
  @JsonKey(defaultValue: 'nuban')
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
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BankModel(id: $id, name: $name, slug: $slug, code: $code, longcode: $longcode, country: $country, currency: $currency, type: $type, payWithBank: $payWithBank, supportsTransfer: $supportsTransfer, availableForDirectDebit: $availableForDirectDebit, active: $active, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      __$$BankModelImplCopyWithImpl<_$BankModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankModelImplToJson(
      this,
    );
  }
}

abstract class _BankModel extends BankModel {
  const factory _BankModel(
      {required final int id,
      required final String name,
      required final String slug,
      required final String code,
      required final String longcode,
      @JsonKey(defaultValue: 'Nigeria') required final String country,
      @JsonKey(defaultValue: 'NGN') required final String currency,
      @JsonKey(defaultValue: 'nuban') required final String type,
      final bool payWithBank,
      final bool supportsTransfer,
      final bool availableForDirectDebit,
      final bool active,
      final bool isDeleted,
      @JsonKey(name: 'createdAt') final DateTime? createdAt,
      @JsonKey(name: 'updatedAt') final DateTime? updatedAt}) = _$BankModelImpl;
  const _BankModel._() : super._();

  factory _BankModel.fromJson(Map<String, dynamic> json) =
      _$BankModelImpl.fromJson;

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
  @JsonKey(defaultValue: 'Nigeria')
  String get country;
  @override
  @JsonKey(defaultValue: 'NGN')
  String get currency;
  @override
  @JsonKey(defaultValue: 'nuban')
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
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankListResponse _$BankListResponseFromJson(Map<String, dynamic> json) {
  return _BankListResponse.fromJson(json);
}

/// @nodoc
mixin _$BankListResponse {
  List<BankModel> get banks => throw _privateConstructorUsedError;

  /// Serializes this BankListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankListResponseCopyWith<BankListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankListResponseCopyWith<$Res> {
  factory $BankListResponseCopyWith(
          BankListResponse value, $Res Function(BankListResponse) then) =
      _$BankListResponseCopyWithImpl<$Res, BankListResponse>;
  @useResult
  $Res call({List<BankModel> banks});
}

/// @nodoc
class _$BankListResponseCopyWithImpl<$Res, $Val extends BankListResponse>
    implements $BankListResponseCopyWith<$Res> {
  _$BankListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banks = null,
  }) {
    return _then(_value.copyWith(
      banks: null == banks
          ? _value.banks
          : banks // ignore: cast_nullable_to_non_nullable
              as List<BankModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankListResponseImplCopyWith<$Res>
    implements $BankListResponseCopyWith<$Res> {
  factory _$$BankListResponseImplCopyWith(_$BankListResponseImpl value,
          $Res Function(_$BankListResponseImpl) then) =
      __$$BankListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BankModel> banks});
}

/// @nodoc
class __$$BankListResponseImplCopyWithImpl<$Res>
    extends _$BankListResponseCopyWithImpl<$Res, _$BankListResponseImpl>
    implements _$$BankListResponseImplCopyWith<$Res> {
  __$$BankListResponseImplCopyWithImpl(_$BankListResponseImpl _value,
      $Res Function(_$BankListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BankListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banks = null,
  }) {
    return _then(_$BankListResponseImpl(
      banks: null == banks
          ? _value._banks
          : banks // ignore: cast_nullable_to_non_nullable
              as List<BankModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankListResponseImpl implements _BankListResponse {
  const _$BankListResponseImpl({required final List<BankModel> banks})
      : _banks = banks;

  factory _$BankListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankListResponseImplFromJson(json);

  final List<BankModel> _banks;
  @override
  List<BankModel> get banks {
    if (_banks is EqualUnmodifiableListView) return _banks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banks);
  }

  @override
  String toString() {
    return 'BankListResponse(banks: $banks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankListResponseImpl &&
            const DeepCollectionEquality().equals(other._banks, _banks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_banks));

  /// Create a copy of BankListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankListResponseImplCopyWith<_$BankListResponseImpl> get copyWith =>
      __$$BankListResponseImplCopyWithImpl<_$BankListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankListResponseImplToJson(
      this,
    );
  }
}

abstract class _BankListResponse implements BankListResponse {
  const factory _BankListResponse({required final List<BankModel> banks}) =
      _$BankListResponseImpl;

  factory _BankListResponse.fromJson(Map<String, dynamic> json) =
      _$BankListResponseImpl.fromJson;

  @override
  List<BankModel> get banks;

  /// Create a copy of BankListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankListResponseImplCopyWith<_$BankListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
