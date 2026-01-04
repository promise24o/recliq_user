// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_overview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletOverviewResponse _$WalletOverviewResponseFromJson(
    Map<String, dynamic> json) {
  return _WalletOverviewResponse.fromJson(json);
}

/// @nodoc
mixin _$WalletOverviewResponse {
  double get availableBalance => throw _privateConstructorUsedError;
  double get todayEarnings => throw _privateConstructorUsedError;
  double? get lastWithdrawnAmount => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  DateTime? get lastTransactionDate => throw _privateConstructorUsedError;

  /// Serializes this WalletOverviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletOverviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletOverviewResponseCopyWith<WalletOverviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletOverviewResponseCopyWith<$Res> {
  factory $WalletOverviewResponseCopyWith(WalletOverviewResponse value,
          $Res Function(WalletOverviewResponse) then) =
      _$WalletOverviewResponseCopyWithImpl<$Res, WalletOverviewResponse>;
  @useResult
  $Res call(
      {double availableBalance,
      double todayEarnings,
      double? lastWithdrawnAmount,
      String accountNumber,
      String accountName,
      double totalEarnings,
      DateTime? lastTransactionDate});
}

/// @nodoc
class _$WalletOverviewResponseCopyWithImpl<$Res,
        $Val extends WalletOverviewResponse>
    implements $WalletOverviewResponseCopyWith<$Res> {
  _$WalletOverviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletOverviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = null,
    Object? todayEarnings = null,
    Object? lastWithdrawnAmount = freezed,
    Object? accountNumber = null,
    Object? accountName = null,
    Object? totalEarnings = null,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_value.copyWith(
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double,
      todayEarnings: null == todayEarnings
          ? _value.todayEarnings
          : todayEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      lastWithdrawnAmount: freezed == lastWithdrawnAmount
          ? _value.lastWithdrawnAmount
          : lastWithdrawnAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      lastTransactionDate: freezed == lastTransactionDate
          ? _value.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletOverviewResponseImplCopyWith<$Res>
    implements $WalletOverviewResponseCopyWith<$Res> {
  factory _$$WalletOverviewResponseImplCopyWith(
          _$WalletOverviewResponseImpl value,
          $Res Function(_$WalletOverviewResponseImpl) then) =
      __$$WalletOverviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double availableBalance,
      double todayEarnings,
      double? lastWithdrawnAmount,
      String accountNumber,
      String accountName,
      double totalEarnings,
      DateTime? lastTransactionDate});
}

/// @nodoc
class __$$WalletOverviewResponseImplCopyWithImpl<$Res>
    extends _$WalletOverviewResponseCopyWithImpl<$Res,
        _$WalletOverviewResponseImpl>
    implements _$$WalletOverviewResponseImplCopyWith<$Res> {
  __$$WalletOverviewResponseImplCopyWithImpl(
      _$WalletOverviewResponseImpl _value,
      $Res Function(_$WalletOverviewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletOverviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = null,
    Object? todayEarnings = null,
    Object? lastWithdrawnAmount = freezed,
    Object? accountNumber = null,
    Object? accountName = null,
    Object? totalEarnings = null,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_$WalletOverviewResponseImpl(
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double,
      todayEarnings: null == todayEarnings
          ? _value.todayEarnings
          : todayEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      lastWithdrawnAmount: freezed == lastWithdrawnAmount
          ? _value.lastWithdrawnAmount
          : lastWithdrawnAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      lastTransactionDate: freezed == lastTransactionDate
          ? _value.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletOverviewResponseImpl implements _WalletOverviewResponse {
  const _$WalletOverviewResponseImpl(
      {required this.availableBalance,
      required this.todayEarnings,
      required this.lastWithdrawnAmount,
      required this.accountNumber,
      required this.accountName,
      required this.totalEarnings,
      required this.lastTransactionDate});

  factory _$WalletOverviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletOverviewResponseImplFromJson(json);

  @override
  final double availableBalance;
  @override
  final double todayEarnings;
  @override
  final double? lastWithdrawnAmount;
  @override
  final String accountNumber;
  @override
  final String accountName;
  @override
  final double totalEarnings;
  @override
  final DateTime? lastTransactionDate;

  @override
  String toString() {
    return 'WalletOverviewResponse(availableBalance: $availableBalance, todayEarnings: $todayEarnings, lastWithdrawnAmount: $lastWithdrawnAmount, accountNumber: $accountNumber, accountName: $accountName, totalEarnings: $totalEarnings, lastTransactionDate: $lastTransactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletOverviewResponseImpl &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.todayEarnings, todayEarnings) ||
                other.todayEarnings == todayEarnings) &&
            (identical(other.lastWithdrawnAmount, lastWithdrawnAmount) ||
                other.lastWithdrawnAmount == lastWithdrawnAmount) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.lastTransactionDate, lastTransactionDate) ||
                other.lastTransactionDate == lastTransactionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      availableBalance,
      todayEarnings,
      lastWithdrawnAmount,
      accountNumber,
      accountName,
      totalEarnings,
      lastTransactionDate);

  /// Create a copy of WalletOverviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletOverviewResponseImplCopyWith<_$WalletOverviewResponseImpl>
      get copyWith => __$$WalletOverviewResponseImplCopyWithImpl<
          _$WalletOverviewResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletOverviewResponseImplToJson(
      this,
    );
  }
}

abstract class _WalletOverviewResponse implements WalletOverviewResponse {
  const factory _WalletOverviewResponse(
          {required final double availableBalance,
          required final double todayEarnings,
          required final double? lastWithdrawnAmount,
          required final String accountNumber,
          required final String accountName,
          required final double totalEarnings,
          required final DateTime? lastTransactionDate}) =
      _$WalletOverviewResponseImpl;

  factory _WalletOverviewResponse.fromJson(Map<String, dynamic> json) =
      _$WalletOverviewResponseImpl.fromJson;

  @override
  double get availableBalance;
  @override
  double get todayEarnings;
  @override
  double? get lastWithdrawnAmount;
  @override
  String get accountNumber;
  @override
  String get accountName;
  @override
  double get totalEarnings;
  @override
  DateTime? get lastTransactionDate;

  /// Create a copy of WalletOverviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletOverviewResponseImplCopyWith<_$WalletOverviewResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
