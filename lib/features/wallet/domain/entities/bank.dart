import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';

@freezed
class Bank with _$Bank {
  const factory Bank({
    required int id,
    required String name,
    required String slug,
    required String code,
    required String longcode,
    required String country,
    required String currency,
    required String type,
    @Default(false) bool payWithBank,
    @Default(true) bool supportsTransfer,
    @Default(false) bool availableForDirectDebit,
    @Default(true) bool active,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Bank;

  @override
  String toString() => name;
}
