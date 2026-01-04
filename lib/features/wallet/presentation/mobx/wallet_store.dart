import 'package:mobx/mobx.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/bank_account.dart';
import '../../domain/entities/earnings.dart';
import '../../domain/repositories/wallet_repository.dart';
import 'mock_wallet_repository.dart';

part 'wallet_store.g.dart';

class WalletStore = _WalletStore with _$WalletStore;

abstract class _WalletStore with Store {
  final WalletRepository _repository;

  _WalletStore({required WalletRepository repository})
      : _repository = repository;

  // Observable state
  @observable
  Earnings? earnings;

  @observable
  ObservableList<Transaction> transactions = ObservableList<Transaction>();

  @observable
  ObservableList<BankAccount> bankAccounts = ObservableList<BankAccount>();

  @observable
  Map<String, dynamic>? rewards;

  @observable
  String accountNumber = '**** **** **** 1234';

  @observable
  String accountName = 'John Doe';

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  bool hasMoreTransactions = true;

  @observable
  int currentTransactionOffset = 0;

  @observable
  String? selectedTransactionType;

  @observable
  String? selectedTransactionCategory;

  @observable
  BankAccount? selectedBankAccount;

  @observable
  String? pendingWithdrawalId;

  // Computed properties
  @computed
  double get availableBalance => earnings?.availableBalance ?? 0.0;

  @computed
  double get totalEarnings => earnings?.totalEarnings ?? 0.0;

  @computed
  double get todayEarnings => earnings?.todayEarnings ?? 0.0;

  @computed
  Transaction? get lastTransaction =>
      transactions.isNotEmpty ? transactions.first : null;

  @computed
  List<Transaction> get recentTransactions => transactions.take(5).toList();

  @computed
  List<Transaction> get monthlyTransactions => transactions.where((t) {
        final now = DateTime.now();
        final transactionDate = t.createdAt;
        return transactionDate.year == now.year &&
            transactionDate.month == now.month;
      }).toList();

  @computed
  BankAccount? get defaultBankAccount =>
      bankAccounts.firstWhere((account) => account.isDefault == true,
          orElse: () => bankAccounts.first);

  @computed
  int get rewardPoints => rewards?['points'] ?? 0;

  @computed
  List<String> get badges => List<String>.from(rewards?['badges'] ?? []);

  @computed
  int get recyclingStreak => rewards?['streak'] ?? 0;

  @computed
  double get bonusCredits => rewards?['bonusCredits'] ?? 0.0;

  // Actions
  @action
  Future<void> loadEarnings() async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.getEarnings();
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (earningsData) => earnings = earningsData,
      );
    } catch (e) {
      error = 'Failed to load earnings';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadTransactions({bool refresh = false}) async {
    try {
      if (refresh) {
        transactions.clear();
        currentTransactionOffset = 0;
        hasMoreTransactions = true;
      }

      if (isLoading || !hasMoreTransactions) return;

      isLoading = true;
      error = null;

      final result = await _repository.getTransactions(
        limit: 20,
        offset: currentTransactionOffset,
        type: selectedTransactionType,
        category: selectedTransactionCategory,
      );

      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (transactionList) {
          if (refresh) {
            transactions.clear();
          }
          transactions.addAll(transactionList);
          currentTransactionOffset += transactionList.length;
          hasMoreTransactions = transactionList.length == 20;
        },
      );
    } catch (e) {
      error = 'Failed to load transactions';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadBankAccounts() async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.getBankAccounts();
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (accounts) {
          bankAccounts.clear();
          bankAccounts.addAll(accounts);
          selectedBankAccount = defaultBankAccount;
        },
      );
    } catch (e) {
      error = 'Failed to load bank accounts';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadRewards() async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.getRewards();
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (rewardsData) => rewards = rewardsData,
      );
    } catch (e) {
      error = 'Failed to load rewards';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> linkBankAccount({
    required String bankName,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String type,
  }) async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.linkBankAccount(
        bankName: bankName,
        accountNumber: accountNumber,
        accountName: accountName,
        bankCode: bankCode,
        type: type,
      );
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (newAccount) {
          bankAccounts.add(newAccount);
          if (bankAccounts.length == 1) {
            selectedBankAccount = newAccount;
          }
        },
      );
    } catch (e) {
      error = 'Failed to link bank account';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> unlinkBankAccount(String accountId) async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.unlinkBankAccount(accountId);
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (_) {
          bankAccounts.removeWhere((account) => account.id == accountId);
          if (selectedBankAccount?.id == accountId) {
            selectedBankAccount = defaultBankAccount;
          }
        },
      );
    } catch (e) {
      error = 'Failed to unlink bank account';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> setDefaultBankAccount(String accountId) async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.setDefaultBankAccount(accountId);
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (_) {
          selectedBankAccount =
              bankAccounts.firstWhere((account) => account.id == accountId);
        },
      );
    } catch (e) {
      error = 'Failed to set default bank account';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<String?> initiateWithdrawal({
    required double amount,
    required String bankAccountId,
    String? note,
  }) async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.initiateWithdrawal(
        amount: amount,
        bankAccountId: bankAccountId,
        note: note,
      );
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (withdrawalId) {
          pendingWithdrawalId = withdrawalId;
          return withdrawalId;
        },
      );
    } catch (e) {
      error = 'Failed to initiate withdrawal';
    } finally {
      isLoading = false;
    }
    return null;
  }

  @action
  Future<void> confirmWithdrawal(String withdrawalId, String otp) async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.confirmWithdrawal(withdrawalId, otp);
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (_) {
          pendingWithdrawalId = null;
          loadTransactions(refresh: true);
          loadEarnings();
        },
      );
    } catch (e) {
      error = 'Failed to confirm withdrawal';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> purchaseAirtime({
    required String phoneNumber,
    required double amount,
    required String network,
  }) async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.purchaseAirtime(
        phoneNumber: phoneNumber,
        amount: amount,
        network: network,
      );
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (transaction) {
          transactions.insert(0, transaction);
          loadEarnings();
        },
      );
    } catch (e) {
      error = 'Failed to purchase airtime';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> purchaseData({
    required String phoneNumber,
    required double amount,
    required String network,
    required String dataPlan,
  }) async {
    try {
      isLoading = true;
      error = null;
      final result = await _repository.purchaseData(
        phoneNumber: phoneNumber,
        amount: amount,
        network: network,
        dataPlan: dataPlan,
      );
      result.fold(
        (failure) => error = _getErrorMessage(failure),
        (transaction) {
          transactions.insert(0, transaction);
          loadEarnings();
        },
      );
    } catch (e) {
      error = 'Failed to purchase data';
    } finally {
      isLoading = false;
    }
  }

  @action
  void setTransactionFilter(String? type, String? category) {
    selectedTransactionType = type;
    selectedTransactionCategory = category;
    loadTransactions(refresh: true);
  }

  @action
  void clearTransactionFilter() {
    selectedTransactionType = null;
    selectedTransactionCategory = null;
    loadTransactions(refresh: true);
  }

  @action
  void clearError() {
    error = null;
  }

  @action
  Future<void> refreshAll() async {
    await Future.wait([
      loadEarnings(),
      loadTransactions(refresh: true),
      loadBankAccounts(),
      loadRewards(),
    ]);
  }

  String _getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server error. Please try again.';
      case NetworkFailure:
        return 'Network error. Please check your connection.';
      case InsufficientFundsFailure:
        return 'Insufficient funds in your wallet.';
      case InvalidBankAccountFailure:
        return 'Invalid bank account details.';
      case OTPVerificationFailure:
        return 'Invalid OTP. Please try again.';
      case WithdrawalLimitFailure:
        return 'Withdrawal amount is below minimum limit.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}

// Extension for creating fake wallet store
extension WalletStoreFactory on WalletStore {
  static WalletStore createFake() {
    final store = WalletStore(repository: MockWalletRepository());
    // Initialize with mock data
    store.transactions.addAll(MockWalletRepository.getMockTransactions());
    store.earnings = MockWalletRepository.getMockEarnings();
    store.rewards = MockWalletRepository.getMockRewards();
    return store;
  }
}
