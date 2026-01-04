// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WalletStore on _WalletStore, Store {
  Computed<double>? _$availableBalanceComputed;

  @override
  double get availableBalance => (_$availableBalanceComputed ??=
          Computed<double>(() => super.availableBalance,
              name: '_WalletStore.availableBalance'))
      .value;
  Computed<double>? _$totalEarningsComputed;

  @override
  double get totalEarnings =>
      (_$totalEarningsComputed ??= Computed<double>(() => super.totalEarnings,
              name: '_WalletStore.totalEarnings'))
          .value;
  Computed<double>? _$todayEarningsComputed;

  @override
  double get todayEarnings =>
      (_$todayEarningsComputed ??= Computed<double>(() => super.todayEarnings,
              name: '_WalletStore.todayEarnings'))
          .value;
  Computed<Transaction?>? _$lastTransactionComputed;

  @override
  Transaction? get lastTransaction => (_$lastTransactionComputed ??=
          Computed<Transaction?>(() => super.lastTransaction,
              name: '_WalletStore.lastTransaction'))
      .value;
  Computed<List<Transaction>>? _$recentTransactionsComputed;

  @override
  List<Transaction> get recentTransactions => (_$recentTransactionsComputed ??=
          Computed<List<Transaction>>(() => super.recentTransactions,
              name: '_WalletStore.recentTransactions'))
      .value;
  Computed<List<Transaction>>? _$monthlyTransactionsComputed;

  @override
  List<Transaction> get monthlyTransactions =>
      (_$monthlyTransactionsComputed ??= Computed<List<Transaction>>(
              () => super.monthlyTransactions,
              name: '_WalletStore.monthlyTransactions'))
          .value;
  Computed<BankAccount?>? _$defaultBankAccountComputed;

  @override
  BankAccount? get defaultBankAccount => (_$defaultBankAccountComputed ??=
          Computed<BankAccount?>(() => super.defaultBankAccount,
              name: '_WalletStore.defaultBankAccount'))
      .value;
  Computed<int>? _$rewardPointsComputed;

  @override
  int get rewardPoints =>
      (_$rewardPointsComputed ??= Computed<int>(() => super.rewardPoints,
              name: '_WalletStore.rewardPoints'))
          .value;
  Computed<List<String>>? _$badgesComputed;

  @override
  List<String> get badges =>
      (_$badgesComputed ??= Computed<List<String>>(() => super.badges,
              name: '_WalletStore.badges'))
          .value;
  Computed<int>? _$recyclingStreakComputed;

  @override
  int get recyclingStreak =>
      (_$recyclingStreakComputed ??= Computed<int>(() => super.recyclingStreak,
              name: '_WalletStore.recyclingStreak'))
          .value;
  Computed<double>? _$bonusCreditsComputed;

  @override
  double get bonusCredits =>
      (_$bonusCreditsComputed ??= Computed<double>(() => super.bonusCredits,
              name: '_WalletStore.bonusCredits'))
          .value;

  late final _$earningsAtom =
      Atom(name: '_WalletStore.earnings', context: context);

  @override
  Earnings? get earnings {
    _$earningsAtom.reportRead();
    return super.earnings;
  }

  @override
  set earnings(Earnings? value) {
    _$earningsAtom.reportWrite(value, super.earnings, () {
      super.earnings = value;
    });
  }

  late final _$transactionsAtom =
      Atom(name: '_WalletStore.transactions', context: context);

  @override
  ObservableList<Transaction> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<Transaction> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$bankAccountsAtom =
      Atom(name: '_WalletStore.bankAccounts', context: context);

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

  late final _$rewardsAtom =
      Atom(name: '_WalletStore.rewards', context: context);

  @override
  Map<String, dynamic>? get rewards {
    _$rewardsAtom.reportRead();
    return super.rewards;
  }

  @override
  set rewards(Map<String, dynamic>? value) {
    _$rewardsAtom.reportWrite(value, super.rewards, () {
      super.rewards = value;
    });
  }

  late final _$accountNumberAtom =
      Atom(name: '_WalletStore.accountNumber', context: context);

  @override
  String get accountNumber {
    _$accountNumberAtom.reportRead();
    return super.accountNumber;
  }

  @override
  set accountNumber(String value) {
    _$accountNumberAtom.reportWrite(value, super.accountNumber, () {
      super.accountNumber = value;
    });
  }

  late final _$accountNameAtom =
      Atom(name: '_WalletStore.accountName', context: context);

  @override
  String get accountName {
    _$accountNameAtom.reportRead();
    return super.accountName;
  }

  @override
  set accountName(String value) {
    _$accountNameAtom.reportWrite(value, super.accountName, () {
      super.accountName = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_WalletStore.isLoading', context: context);

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

  late final _$errorAtom = Atom(name: '_WalletStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$hasMoreTransactionsAtom =
      Atom(name: '_WalletStore.hasMoreTransactions', context: context);

  @override
  bool get hasMoreTransactions {
    _$hasMoreTransactionsAtom.reportRead();
    return super.hasMoreTransactions;
  }

  @override
  set hasMoreTransactions(bool value) {
    _$hasMoreTransactionsAtom.reportWrite(value, super.hasMoreTransactions, () {
      super.hasMoreTransactions = value;
    });
  }

  late final _$currentTransactionOffsetAtom =
      Atom(name: '_WalletStore.currentTransactionOffset', context: context);

  @override
  int get currentTransactionOffset {
    _$currentTransactionOffsetAtom.reportRead();
    return super.currentTransactionOffset;
  }

  @override
  set currentTransactionOffset(int value) {
    _$currentTransactionOffsetAtom
        .reportWrite(value, super.currentTransactionOffset, () {
      super.currentTransactionOffset = value;
    });
  }

  late final _$selectedTransactionTypeAtom =
      Atom(name: '_WalletStore.selectedTransactionType', context: context);

  @override
  String? get selectedTransactionType {
    _$selectedTransactionTypeAtom.reportRead();
    return super.selectedTransactionType;
  }

  @override
  set selectedTransactionType(String? value) {
    _$selectedTransactionTypeAtom
        .reportWrite(value, super.selectedTransactionType, () {
      super.selectedTransactionType = value;
    });
  }

  late final _$selectedTransactionCategoryAtom =
      Atom(name: '_WalletStore.selectedTransactionCategory', context: context);

  @override
  String? get selectedTransactionCategory {
    _$selectedTransactionCategoryAtom.reportRead();
    return super.selectedTransactionCategory;
  }

  @override
  set selectedTransactionCategory(String? value) {
    _$selectedTransactionCategoryAtom
        .reportWrite(value, super.selectedTransactionCategory, () {
      super.selectedTransactionCategory = value;
    });
  }

  late final _$selectedBankAccountAtom =
      Atom(name: '_WalletStore.selectedBankAccount', context: context);

  @override
  BankAccount? get selectedBankAccount {
    _$selectedBankAccountAtom.reportRead();
    return super.selectedBankAccount;
  }

  @override
  set selectedBankAccount(BankAccount? value) {
    _$selectedBankAccountAtom.reportWrite(value, super.selectedBankAccount, () {
      super.selectedBankAccount = value;
    });
  }

  late final _$pendingWithdrawalIdAtom =
      Atom(name: '_WalletStore.pendingWithdrawalId', context: context);

  @override
  String? get pendingWithdrawalId {
    _$pendingWithdrawalIdAtom.reportRead();
    return super.pendingWithdrawalId;
  }

  @override
  set pendingWithdrawalId(String? value) {
    _$pendingWithdrawalIdAtom.reportWrite(value, super.pendingWithdrawalId, () {
      super.pendingWithdrawalId = value;
    });
  }

  late final _$loadEarningsAsyncAction =
      AsyncAction('_WalletStore.loadEarnings', context: context);

  @override
  Future<void> loadEarnings() {
    return _$loadEarningsAsyncAction.run(() => super.loadEarnings());
  }

  late final _$loadTransactionsAsyncAction =
      AsyncAction('_WalletStore.loadTransactions', context: context);

  @override
  Future<void> loadTransactions({bool refresh = false}) {
    return _$loadTransactionsAsyncAction
        .run(() => super.loadTransactions(refresh: refresh));
  }

  late final _$loadBankAccountsAsyncAction =
      AsyncAction('_WalletStore.loadBankAccounts', context: context);

  @override
  Future<void> loadBankAccounts() {
    return _$loadBankAccountsAsyncAction.run(() => super.loadBankAccounts());
  }

  late final _$loadRewardsAsyncAction =
      AsyncAction('_WalletStore.loadRewards', context: context);

  @override
  Future<void> loadRewards() {
    return _$loadRewardsAsyncAction.run(() => super.loadRewards());
  }

  late final _$linkBankAccountAsyncAction =
      AsyncAction('_WalletStore.linkBankAccount', context: context);

  @override
  Future<void> linkBankAccount(
      {required String bankName,
      required String accountNumber,
      required String accountName,
      required String bankCode,
      required String type}) {
    return _$linkBankAccountAsyncAction.run(() => super.linkBankAccount(
        bankName: bankName,
        accountNumber: accountNumber,
        accountName: accountName,
        bankCode: bankCode,
        type: type));
  }

  late final _$unlinkBankAccountAsyncAction =
      AsyncAction('_WalletStore.unlinkBankAccount', context: context);

  @override
  Future<void> unlinkBankAccount(String accountId) {
    return _$unlinkBankAccountAsyncAction
        .run(() => super.unlinkBankAccount(accountId));
  }

  late final _$setDefaultBankAccountAsyncAction =
      AsyncAction('_WalletStore.setDefaultBankAccount', context: context);

  @override
  Future<void> setDefaultBankAccount(String accountId) {
    return _$setDefaultBankAccountAsyncAction
        .run(() => super.setDefaultBankAccount(accountId));
  }

  late final _$initiateWithdrawalAsyncAction =
      AsyncAction('_WalletStore.initiateWithdrawal', context: context);

  @override
  Future<String?> initiateWithdrawal(
      {required double amount, required String bankAccountId, String? note}) {
    return _$initiateWithdrawalAsyncAction.run(() => super.initiateWithdrawal(
        amount: amount, bankAccountId: bankAccountId, note: note));
  }

  late final _$confirmWithdrawalAsyncAction =
      AsyncAction('_WalletStore.confirmWithdrawal', context: context);

  @override
  Future<void> confirmWithdrawal(String withdrawalId, String otp) {
    return _$confirmWithdrawalAsyncAction
        .run(() => super.confirmWithdrawal(withdrawalId, otp));
  }

  late final _$purchaseAirtimeAsyncAction =
      AsyncAction('_WalletStore.purchaseAirtime', context: context);

  @override
  Future<void> purchaseAirtime(
      {required String phoneNumber,
      required double amount,
      required String network}) {
    return _$purchaseAirtimeAsyncAction.run(() => super.purchaseAirtime(
        phoneNumber: phoneNumber, amount: amount, network: network));
  }

  late final _$purchaseDataAsyncAction =
      AsyncAction('_WalletStore.purchaseData', context: context);

  @override
  Future<void> purchaseData(
      {required String phoneNumber,
      required double amount,
      required String network,
      required String dataPlan}) {
    return _$purchaseDataAsyncAction.run(() => super.purchaseData(
        phoneNumber: phoneNumber,
        amount: amount,
        network: network,
        dataPlan: dataPlan));
  }

  late final _$refreshAllAsyncAction =
      AsyncAction('_WalletStore.refreshAll', context: context);

  @override
  Future<void> refreshAll() {
    return _$refreshAllAsyncAction.run(() => super.refreshAll());
  }

  late final _$_WalletStoreActionController =
      ActionController(name: '_WalletStore', context: context);

  @override
  void setTransactionFilter(String? type, String? category) {
    final _$actionInfo = _$_WalletStoreActionController.startAction(
        name: '_WalletStore.setTransactionFilter');
    try {
      return super.setTransactionFilter(type, category);
    } finally {
      _$_WalletStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTransactionFilter() {
    final _$actionInfo = _$_WalletStoreActionController.startAction(
        name: '_WalletStore.clearTransactionFilter');
    try {
      return super.clearTransactionFilter();
    } finally {
      _$_WalletStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_WalletStoreActionController.startAction(
        name: '_WalletStore.clearError');
    try {
      return super.clearError();
    } finally {
      _$_WalletStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
earnings: ${earnings},
transactions: ${transactions},
bankAccounts: ${bankAccounts},
rewards: ${rewards},
accountNumber: ${accountNumber},
accountName: ${accountName},
isLoading: ${isLoading},
error: ${error},
hasMoreTransactions: ${hasMoreTransactions},
currentTransactionOffset: ${currentTransactionOffset},
selectedTransactionType: ${selectedTransactionType},
selectedTransactionCategory: ${selectedTransactionCategory},
selectedBankAccount: ${selectedBankAccount},
pendingWithdrawalId: ${pendingWithdrawalId},
availableBalance: ${availableBalance},
totalEarnings: ${totalEarnings},
todayEarnings: ${todayEarnings},
lastTransaction: ${lastTransaction},
recentTransactions: ${recentTransactions},
monthlyTransactions: ${monthlyTransactions},
defaultBankAccount: ${defaultBankAccount},
rewardPoints: ${rewardPoints},
badges: ${badges},
recyclingStreak: ${recyclingStreak},
bonusCredits: ${bonusCredits}
    ''';
  }
}
