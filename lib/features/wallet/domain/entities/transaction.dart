import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String type, // 'earning', 'withdrawal', 'purchase'
    required String category, // 'recycling', 'withdrawal', 'airtime', 'data'
    required double amount,
    required String currency,
    required DateTime createdAt,
    String? description,
    String? location, // For recycling earnings
    TransactionStatus? status,
    String? reference,
    Map<String, dynamic>? metadata,
  }) = _Transaction;

  factory Transaction.earning({
    required String id,
    required double amount,
    required DateTime createdAt,
    String? location,
    String? description,
    Map<String, dynamic>? metadata,
  }) {
    return Transaction(
      id: id,
      type: 'earning',
      category: 'recycling',
      amount: amount,
      currency: 'NGN',
      createdAt: createdAt,
      location: location,
      description: description,
      status: TransactionStatus.completed,
      metadata: metadata,
    );
  }

  factory Transaction.withdrawal({
    required String id,
    required double amount,
    required DateTime createdAt,
    required TransactionStatus status,
    String? description,
    String? reference,
    Map<String, dynamic>? metadata,
  }) {
    return Transaction(
      id: id,
      type: 'withdrawal',
      category: 'withdrawal',
      amount: amount,
      currency: 'NGN',
      createdAt: createdAt,
      status: status,
      description: description,
      reference: reference,
      metadata: metadata,
    );
  }

  factory Transaction.purchase({
    required String id,
    required String category, // 'airtime', 'data'
    required double amount,
    required DateTime createdAt,
    required TransactionStatus status,
    String? description,
    String? reference,
    Map<String, dynamic>? metadata,
  }) {
    return Transaction(
      id: id,
      type: 'purchase',
      category: category,
      amount: amount,
      currency: 'NGN',
      createdAt: createdAt,
      status: status,
      description: description,
      reference: reference,
      metadata: metadata,
    );
  }
}

enum TransactionStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled,
}

extension TransactionStatusExtension on TransactionStatus {
  String get displayName {
    switch (this) {
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.processing:
        return 'Processing';
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.failed:
        return 'Failed';
      case TransactionStatus.cancelled:
        return 'Cancelled';
    }
  }

  bool get isCompleted => this == TransactionStatus.completed;
  bool get isPending => this == TransactionStatus.pending;
  bool get isProcessing => this == TransactionStatus.processing;
  bool get isFailed => this == TransactionStatus.failed;
  bool get isActive => isPending || isProcessing;
}

extension TransactionExtension on Transaction {
  bool get isEarning => type == 'earning';
  bool get isWithdrawal => type == 'withdrawal';
  bool get isPurchase => type == 'purchase';
  bool get isCompleted => status?.isCompleted ?? false;
  bool get isPending => status?.isPending ?? false;
  bool get isFailed => status?.isFailed ?? false;
  bool get isActive => status?.isActive ?? false;

  String get formattedAmount {
    final sign = isEarning ? '+' : '-';
    return '$sign₦${amount.toStringAsFixed(2)}';
  }

  String get typeDisplayName {
    switch (type) {
      case 'earning':
        return 'Earning';
      case 'withdrawal':
        return 'Withdrawal';
      case 'purchase':
        return category == 'airtime' ? 'Airtime' : 'Data';
      default:
        return type;
    }
  }

  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Just now';
        }
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
    }
  }
}
