import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../domain/entities/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onTap;

  const TransactionItem({
    super.key,
    required this.transaction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icon = _getTransactionIcon();
    final iconColor = _getTransactionIconColor();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.description ?? transaction.typeDisplayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        transaction.formattedDate,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13,
                        ),
                      ),
                      if (transaction.location != null) ...[
                        const SizedBox(width: 8),
                        Icon(
                          Icons.location_on_outlined,
                          size: 12,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 2),
                        Text(
                          transaction.location!,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  transaction.formattedAmount,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                if (transaction.status != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      transaction.status?.displayName ?? '',
                      style: TextStyle(
                        color: _getStatusColor(),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTransactionIcon() {
    switch (transaction.type) {
      case 'earning':
        return FontAwesomeIcons.arrowDown;
      case 'withdrawal':
        return FontAwesomeIcons.arrowUp;
      case 'purchase':
        if (transaction.category == 'airtime') {
          return FontAwesomeIcons.phone;
        } else if (transaction.category == 'data') {
          return FontAwesomeIcons.wifi;
        }
        return FontAwesomeIcons.shoppingCart;
      default:
        return FontAwesomeIcons.receipt;
    }
  }

  Color _getTransactionIconColor() {
    switch (transaction.type) {
      case 'earning':
        return const Color(0xFF1F6B43);
      case 'withdrawal':
        return const Color(0xFFE74C3C);
      case 'purchase':
        return const Color(0xFF2196F3);
      default:
        return Colors.grey;
    }
  }

  Color _getStatusColor() {
    switch (transaction.status) {
      case TransactionStatus.completed:
        return const Color(0xFF1F6B43);
      case TransactionStatus.pending:
        return const Color(0xFFFF9800);
      case TransactionStatus.processing:
        return const Color(0xFF2196F3);
      case TransactionStatus.failed:
        return const Color(0xFFE74C3C);
      case TransactionStatus.cancelled:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
