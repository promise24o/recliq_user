import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/bank.dart';
import '../../domain/entities/bank_account.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../../../../shared/services/toast_service.dart';

part 'bank_accounts_store.g.dart';

@injectable
class BankAccountsStore = _BankAccountsStore with _$BankAccountsStore;

abstract class _BankAccountsStore with Store {
  final WalletRepository _walletRepository;

  _BankAccountsStore(this._walletRepository);

  // Observable state
  @observable
  ObservableList<BankAccount> bankAccounts = ObservableList<BankAccount>();

  @observable
  ObservableList<Bank> banks = ObservableList<Bank>();

  @observable
  bool isLoading = false;

  @observable
  bool isBanksLoading = false;

  @observable
  bool isAddingAccount = false;

  @observable
  bool isVerifyingAccount = false;

  @observable
  String? verificationError;

  @observable
  String? addAccountError;

  @computed
  bool get hasBankAccounts => bankAccounts.isNotEmpty;

  @computed
  BankAccount? get defaultAccount =>
      bankAccounts.where((account) => account.isDefault ?? false).firstOrNull;

  // Actions
  @action
  Future<void> loadBankAccounts() async {
    isLoading = true;
    verificationError = null;
    addAccountError = null;
    final result = await _walletRepository.getBankAccounts();
    result.fold(
      (failure) {
        verificationError = 'Failed to load bank accounts';
      },
      (accounts) {
        bankAccounts.clear();
        bankAccounts.addAll(accounts);
      },
    );

    isLoading = false;
  }

  @action
  Future<void> loadBanks() async {
    isBanksLoading = true;
    verificationError = null;

    try {
      final result = await _walletRepository.getBanks();

      result.fold(
        (failure) {
          verificationError = 'Failed to load banks';
        },
        (bankList) {
          banks.clear();
          banks.addAll(bankList);
        },
      );
    } catch (e) {
      verificationError = 'Failed to load banks';
    }

    isBanksLoading = false;
  }

  @action
  Future<String?> verifyBankAccount({
    required Bank bank,
    required String accountNumber,
  }) async {
    if (accountNumber.length != 10) {
      verificationError = 'Account number must be 10 digits';
      return null;
    }

    isVerifyingAccount = true;
    verificationError = null;

    final result = await _walletRepository.verifyBankAccount(
      bankCode: bank.code,
      accountNumber: accountNumber,
    );

    String? accountName;
    result.fold(
      (failure) => verificationError = 'Failed to verify account',
      (name) => accountName = name,
    );

    isVerifyingAccount = false;
    return accountName;
  }

  @action
  Future<bool> addBankAccount({
    required Bank bank,
    required String accountNumber,
    required String accountName,
    required String type,
  }) async {
    isAddingAccount = true;
    addAccountError = null;

    final result = await _walletRepository.linkBankAccount(
      bankName: bank.name,
      accountNumber: accountNumber,
      accountName: accountName,
      bankCode: bank.code,
      type: type,
    );

    bool success = false;
    result.fold(
      (failure) {
        addAccountError = 'Failed to add bank account';
        ToastService.showError('Failed to add bank account');
      },
      (account) {
        bankAccounts.add(account);
        success = true;
        ToastService.showSuccess('Bank account added successfully');
      },
    );

    isAddingAccount = false;
    return success;
  }

  @action
  Future<bool> setDefaultAccount(String accountId) async {
    final result = await _walletRepository.setDefaultBankAccount(accountId);

    bool success = false;
    result.fold(
      (failure) => verificationError = 'Failed to set default account',
      (account) {
        // Update the accounts list
        final index = bankAccounts.indexWhere((a) => a.id == accountId);
        if (index != -1) {
          // Remove default flag from all accounts
          for (int i = 0; i < bankAccounts.length; i++) {
            bankAccounts[i] = bankAccounts[i].copyWith(isDefault: false);
          }
          // Set new default
          bankAccounts[index] = account.copyWith(isDefault: true);
        }
        success = true;
        // Reload the accounts list to get the updated state from backend
        loadBankAccounts();
      },
    );

    return success;
  }

  @action
  Future<bool> removeAccount(String accountId) async {
    // Cannot remove if it's the only account
    if (bankAccounts.length == 1) {
      verificationError = 'Cannot remove the only bank account';
      ToastService.showError('Cannot remove the only bank account');
      return false;
    }

    final result = await _walletRepository.unlinkBankAccount(accountId);

    bool success = false;
    result.fold(
      (failure) {
        // For ServerFailure, use specific error message for bank account removal
        if (failure.toString().contains('ServerFailure')) {
          verificationError =
              'Cannot remove default bank account. Please set another account as default first.';
          ToastService.showError(
              'Cannot remove default bank account. Please set another account as default first.');
        } else {
          // For other failure types, use a generic error message
          verificationError = 'Failed to remove account. Please try again.';
          ToastService.showError('Failed to remove account. Please try again.');
        }
      },
      (_) {
        bankAccounts.removeWhere((account) => account.id == accountId);
        success = true;
        ToastService.showSuccess('Bank account removed successfully');

        // Reload the accounts list to get the updated state from backend
        loadBankAccounts();
      },
    );

    return success;
  }

  @action
  void clearErrors() {
    verificationError = null;
    addAccountError = null;
  }
}
