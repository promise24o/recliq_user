import 'package:flutter/material.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../mobx/bank_accounts_store.dart';
import '../../domain/entities/bank_account.dart';
import 'bank_account_tile.dart';

class BankAccountListWidget extends StatelessWidget {
  final BankAccountsStore bankAccountsStore;
  final VoidCallback onAddAccount;
  final Function(BankAccount) onSetDefault;
  final Function(BankAccount) onRemove;

  const BankAccountListWidget({
    super.key,
    required this.bankAccountsStore,
    required this.onAddAccount,
    required this.onSetDefault,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (!bankAccountsStore.hasBankAccounts) {
      return NoDataEmptyState(
        title: 'No Bank Accounts',
        description:
            'Add a bank account to start withdrawing your earnings. Note that only account bearing your name will be verified.',
        onAction: onAddAccount,
        actionText: 'Add Account',
      );
    }

    return RefreshIndicator(
      onRefresh: bankAccountsStore.loadBankAccounts,
      color: AppTheme.primaryGreen,
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: bankAccountsStore.bankAccounts.length,
        itemBuilder: (context, index) {
          final account = bankAccountsStore.bankAccounts[index];
          return BankAccountTile(
            account: account,
            onSetDefault: () => onSetDefault(account),
            onRemove: () => onRemove(account),
          );
        },
      ),
    );
  }
}
