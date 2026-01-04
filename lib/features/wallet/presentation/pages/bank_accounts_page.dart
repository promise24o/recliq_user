import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../../shared/widgets/app_header.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_searchable_dropdown.dart';
import '../../../../shared/widgets/app_bottom_sheet.dart';
import '../../../../core/di/service_locator.dart';
import '../../../profile/presentation/mobx/profile_store.dart';
import '../mobx/bank_accounts_store.dart';
import '../../domain/entities/bank.dart';
import '../../domain/entities/bank_account.dart';
import '../widgets/bank_account_list_widget.dart';
import '../../../../shared/services/toast_service.dart';

class BankAccountsPage extends StatefulWidget {
  const BankAccountsPage({super.key});

  @override
  State<BankAccountsPage> createState() => _BankAccountsPageState();
}

class _BankAccountsPageState extends State<BankAccountsPage> {
  late final ProfileStore _profileStore;
  late final BankAccountsStore _bankAccountsStore;

  @override
  void initState() {
    super.initState();
    _profileStore = getIt<ProfileStore>();
    _bankAccountsStore = getIt<BankAccountsStore>();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.wait([
      _bankAccountsStore.loadBankAccounts(),
      _bankAccountsStore.loadBanks(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => LoadingOverlay(
        isVisible:
            _bankAccountsStore.isLoading || _bankAccountsStore.isAddingAccount,
        message: 'Loading bank accounts...',
        child: Scaffold(
          backgroundColor: AppTheme.darkBackground,
          body: SafeArea(
            child: Column(
              children: [
                AppHeader(
                  title: 'Manage Your Funds',
                  subtitle: 'Bank Accounts',
                  showBackButton: true,
                  onLeadingTap: () => Navigator.pop(context),
                  profileStore: _profileStore,
                ),
                Expanded(
                  child: _buildBody(),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _bankAccountsStore.isLoading
                ? null
                : _showAddAccountBottomSheet,
            backgroundColor: AppTheme.primaryGreen,
            elevation: 8,
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BankAccountListWidget(
      bankAccountsStore: _bankAccountsStore,
      onAddAccount: _showAddAccountBottomSheet,
      onSetDefault: _setDefaultAccount,
      onRemove: _removeAccount,
    );
  }

  void _showAddAccountBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddBankBottomSheet(
        banks: _bankAccountsStore.banks,
        onAddAccount: _addBankAccount,
      ),
    );
  }

  Future<void> _addBankAccount(
    Bank bank,
    String accountNumber,
    String type,
  ) async {
    Navigator.pop(context);

    final accountName = await _bankAccountsStore.verifyBankAccount(
      bank: bank,
      accountNumber: accountNumber,
    );

    if (!mounted) return;

    if (accountName == null) {
      ToastService.showError(
          _bankAccountsStore.verificationError ?? 'Failed to verify account');
      return;
    }

    await _bankAccountsStore.addBankAccount(
      bank: bank,
      accountNumber: accountNumber,
      accountName: accountName,
      type: type,
    );
  }

  Future<void> _setDefaultAccount(BankAccount account) async {
    if (account.id == null) {
      ToastService.showError('Cannot set default account: missing account ID');
      return;
    }

    final success = await _bankAccountsStore.setDefaultAccount(account.id!);

    if (!mounted) return;

    if (success) {
      ToastService.showSuccess('Default account updated');
    } else {
      ToastService.showError(_bankAccountsStore.verificationError ??
          'Failed to update default account');
    }
  }

  Future<void> _removeAccount(BankAccount account) async {
    if (account.id == null) {
      ToastService.showError('Cannot remove account: missing account ID');
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppTheme.surfaceDark,
        title: const Text(
          'Remove Account',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to remove this bank account?\n\n${account.bankName} - ${account.maskedAccountNumber}',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppTheme.danger),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await _bankAccountsStore.removeAccount(account.id!);
  }
}

class AddBankBottomSheet extends StatefulWidget {
  final List<Bank> banks;
  final Function(Bank, String, String) onAddAccount;

  const AddBankBottomSheet({
    super.key,
    required this.banks,
    required this.onAddAccount,
  });

  @override
  State<AddBankBottomSheet> createState() => _AddBankBottomSheetState();
}

class _AddBankBottomSheetState extends State<AddBankBottomSheet> {
  late final BankAccountsStore _store;
  Bank? _selectedBank;
  final _accountNumberController = TextEditingController();
  String _accountName = '';
  bool _isAccountVerified = false;
  Timer? _verificationTimer;

  @override
  void initState() {
    super.initState();
    _store = getIt<BankAccountsStore>();
    if (_store.banks.isEmpty) {
      _store.loadBanks();
    }
  }

  @override
  void dispose() {
    _accountNumberController.dispose();
    _verificationTimer?.cancel();
    super.dispose();
  }

  void _verifyAccount() {
    if (_selectedBank == null || _accountNumberController.text.length != 10) {
      return;
    }

    _verificationTimer?.cancel();
    _verificationTimer = Timer(const Duration(milliseconds: 800), () async {
      final accountName = await _store.verifyBankAccount(
        bank: _selectedBank!,
        accountNumber: _accountNumberController.text,
      );

      if (!mounted) return;

      setState(() {
        _accountName = accountName ?? '';
        _isAccountVerified = accountName != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => AppBottomSheet(
        title: 'Add Bank Account',
        child: Column(
          children: [
            CustomSearchableDropdown<Bank>(
              items: _store.banks,
              selectedItem: _selectedBank,
              hint: 'Select bank',
              label: 'Bank',
              icon: Icons.account_balance_outlined,
              displayText: (b) => b.name,
              searchFilter: (b) => b.name.toLowerCase(),
              onChanged: (bank) {
                setState(() {
                  _selectedBank = bank;
                  _accountName = '';
                  _isAccountVerified = false;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Account Number',
              hint: '10-digit number',
              icon: Icons.numbers,
              controller: _accountNumberController,
              enabled: !_store.isVerifyingAccount,
              onChanged: (_) {
                _accountName = '';
                _isAccountVerified = false;
                _verifyAccount();
              },
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _store.isVerifyingAccount
                  ? _LoadingCard()
                  : _accountName.isNotEmpty
                      ? _VerifiedCard(name: _accountName)
                      : const SizedBox.shrink(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlineButtonX(
                    label: 'Cancel',
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: PrimaryButton(
                    label: 'Add Account',
                    loading: _store.isAddingAccount,
                    disabled: !_isAccountVerified || _selectedBank == null,
                    onPressed: _isAccountVerified && _selectedBank != null
                        ? () {
                            widget.onAddAccount(
                              _selectedBank!,
                              _accountNumberController.text,
                              'SAVINGS',
                            );
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("_LoadingCard: build called");
    return Container(
      key: const ValueKey('loading'),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppTheme.primaryGreen,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Verifying...',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _VerifiedCard extends StatelessWidget {
  final String name;

  const _VerifiedCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('verified'),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.primaryGreen),
      ),
      child: Row(
        children: [
          Icon(Icons.verified, color: AppTheme.primaryGreen),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
