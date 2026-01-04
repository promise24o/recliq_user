// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_accounts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankAccountsStore on _BankAccountsStore, Store {
  Computed<bool>? _$hasBankAccountsComputed;

  @override
  bool get hasBankAccounts =>
      (_$hasBankAccountsComputed ??= Computed<bool>(() => super.hasBankAccounts,
              name: '_BankAccountsStore.hasBankAccounts'))
          .value;
  Computed<BankAccount?>? _$defaultAccountComputed;

  @override
  BankAccount? get defaultAccount => (_$defaultAccountComputed ??=
          Computed<BankAccount?>(() => super.defaultAccount,
              name: '_BankAccountsStore.defaultAccount'))
      .value;

  late final _$bankAccountsAtom =
      Atom(name: '_BankAccountsStore.bankAccounts', context: context);

  @override
  ObservableList<BankAccount> get bankAccounts {
    _$bankAccountsAtom.reportRead();
    return super.bankAccounts;
  }

  @override
  set bankAccounts(ObservableList<BankAccount> value) {
    _$bankAccountsAtom.reportWrite(value, super.bankAccounts, () {
      super.bankAccounts = value;
    });
  }

  late final _$banksAtom =
      Atom(name: '_BankAccountsStore.banks', context: context);

  @override
  ObservableList<Bank> get banks {
    _$banksAtom.reportRead();
    return super.banks;
  }

  @override
  set banks(ObservableList<Bank> value) {
    _$banksAtom.reportWrite(value, super.banks, () {
      super.banks = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_BankAccountsStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isBanksLoadingAtom =
      Atom(name: '_BankAccountsStore.isBanksLoading', context: context);

  @override
  bool get isBanksLoading {
    _$isBanksLoadingAtom.reportRead();
    return super.isBanksLoading;
  }

  @override
  set isBanksLoading(bool value) {
    _$isBanksLoadingAtom.reportWrite(value, super.isBanksLoading, () {
      super.isBanksLoading = value;
    });
  }

  late final _$isAddingAccountAtom =
      Atom(name: '_BankAccountsStore.isAddingAccount', context: context);

  @override
  bool get isAddingAccount {
    _$isAddingAccountAtom.reportRead();
    return super.isAddingAccount;
  }

  @override
  set isAddingAccount(bool value) {
    _$isAddingAccountAtom.reportWrite(value, super.isAddingAccount, () {
      super.isAddingAccount = value;
    });
  }

  late final _$isVerifyingAccountAtom =
      Atom(name: '_BankAccountsStore.isVerifyingAccount', context: context);

  @override
  bool get isVerifyingAccount {
    _$isVerifyingAccountAtom.reportRead();
    return super.isVerifyingAccount;
  }

  @override
  set isVerifyingAccount(bool value) {
    _$isVerifyingAccountAtom.reportWrite(value, super.isVerifyingAccount, () {
      super.isVerifyingAccount = value;
    });
  }

  late final _$verificationErrorAtom =
      Atom(name: '_BankAccountsStore.verificationError', context: context);

  @override
  String? get verificationError {
    _$verificationErrorAtom.reportRead();
    return super.verificationError;
  }

  @override
  set verificationError(String? value) {
    _$verificationErrorAtom.reportWrite(value, super.verificationError, () {
      super.verificationError = value;
    });
  }

  late final _$addAccountErrorAtom =
      Atom(name: '_BankAccountsStore.addAccountError', context: context);

  @override
  String? get addAccountError {
    _$addAccountErrorAtom.reportRead();
    return super.addAccountError;
  }

  @override
  set addAccountError(String? value) {
    _$addAccountErrorAtom.reportWrite(value, super.addAccountError, () {
      super.addAccountError = value;
    });
  }

  late final _$loadBankAccountsAsyncAction =
      AsyncAction('_BankAccountsStore.loadBankAccounts', context: context);

  @override
  Future<void> loadBankAccounts() {
    return _$loadBankAccountsAsyncAction.run(() => super.loadBankAccounts());
  }

  late final _$loadBanksAsyncAction =
      AsyncAction('_BankAccountsStore.loadBanks', context: context);

  @override
  Future<void> loadBanks() {
    return _$loadBanksAsyncAction.run(() => super.loadBanks());
  }

  late final _$verifyBankAccountAsyncAction =
      AsyncAction('_BankAccountsStore.verifyBankAccount', context: context);

  @override
  Future<String?> verifyBankAccount(
      {required Bank bank, required String accountNumber}) {
    return _$verifyBankAccountAsyncAction.run(() =>
        super.verifyBankAccount(bank: bank, accountNumber: accountNumber));
  }

  late final _$addBankAccountAsyncAction =
      AsyncAction('_BankAccountsStore.addBankAccount', context: context);

  @override
  Future<bool> addBankAccount(
      {required Bank bank,
      required String accountNumber,
      required String accountName,
      required String type}) {
    return _$addBankAccountAsyncAction.run(() => super.addBankAccount(
        bank: bank,
        accountNumber: accountNumber,
        accountName: accountName,
        type: type));
  }

  late final _$setDefaultAccountAsyncAction =
      AsyncAction('_BankAccountsStore.setDefaultAccount', context: context);

  @override
  Future<bool> setDefaultAccount(String accountId) {
    return _$setDefaultAccountAsyncAction
        .run(() => super.setDefaultAccount(accountId));
  }

  late final _$removeAccountAsyncAction =
      AsyncAction('_BankAccountsStore.removeAccount', context: context);

  @override
  Future<bool> removeAccount(String accountId) {
    return _$removeAccountAsyncAction.run(() => super.removeAccount(accountId));
  }

  late final _$_BankAccountsStoreActionController =
      ActionController(name: '_BankAccountsStore', context: context);

  @override
  void clearErrors() {
    final _$actionInfo = _$_BankAccountsStoreActionController.startAction(
        name: '_BankAccountsStore.clearErrors');
    try {
      return super.clearErrors();
    } finally {
      _$_BankAccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bankAccounts: ${bankAccounts},
banks: ${banks},
isLoading: ${isLoading},
isBanksLoading: ${isBanksLoading},
isAddingAccount: ${isAddingAccount},
isVerifyingAccount: ${isVerifyingAccount},
verificationError: ${verificationError},
addAccountError: ${addAccountError},
hasBankAccounts: ${hasBankAccounts},
defaultAccount: ${defaultAccount}
    ''';
  }
}
