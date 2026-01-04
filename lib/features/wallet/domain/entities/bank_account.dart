import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account.freezed.dart';

@freezed
class BankAccount with _$BankAccount {
  const factory BankAccount({
    String? id,
    required String bankName,
    required String bankCode,
    required String accountNumber,
    required String accountName,
    required String type,
    bool? isDefault,
    bool? isActive,
    DateTime? createdAt,
  }) = _BankAccount;

  factory BankAccount.create({
    required String id,
    required String bankName,
    required String bankCode,
    required String accountNumber,
    required String accountName,
    required String type,
  }) {
    return BankAccount(
      id: id,
      bankName: bankName,
      bankCode: bankCode,
      accountNumber: accountNumber,
      accountName: accountName,
      type: type,
      isDefault: false,
      isActive: true,
      createdAt: DateTime.now(),
    );
  }
}

extension BankAccountExtension on BankAccount {
  bool get isDefault => this.isDefault ?? false;
  bool get isActive => this.isActive ?? false;

  String get maskedAccountNumber {
    if (accountNumber.length <= 4) return accountNumber;
    return '****${accountNumber.substring(accountNumber.length - 4)}';
  }

  String get displayName => '$bankName - $maskedAccountNumber';
}
