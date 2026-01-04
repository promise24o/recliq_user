import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/transaction.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  final String id;
  final String type;
  final String category;
  final double amount;
  final String currency;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String? description;
  final String? location;
  final String? status;
  final String? reference;
  final Map<String, dynamic>? metadata;

  const TransactionModel({
    required this.id,
    required this.type,
    required this.category,
    required this.amount,
    required this.currency,
    required this.createdAt,
    this.description,
    this.location,
    this.status,
    this.reference,
    this.metadata,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  Transaction toDomain() {
    TransactionStatus? transactionStatus;
    if (status != null) {
      transactionStatus = _parseTransactionStatus(status!);
    }

    return Transaction(
      id: id,
      type: type,
      category: category,
      amount: amount,
      currency: currency,
      createdAt: createdAt,
      description: description,
      location: location,
      status: transactionStatus,
      reference: reference,
      metadata: metadata,
    );
  }

  factory TransactionModel.fromDomain(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      type: transaction.type,
      category: transaction.category,
      amount: transaction.amount,
      currency: transaction.currency,
      createdAt: transaction.createdAt,
      description: transaction.description,
      location: transaction.location,
      status: transaction.status?.name,
      reference: transaction.reference,
      metadata: transaction.metadata,
    );
  }

  TransactionStatus _parseTransactionStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return TransactionStatus.pending;
      case 'processing':
        return TransactionStatus.processing;
      case 'completed':
        return TransactionStatus.completed;
      case 'failed':
        return TransactionStatus.failed;
      case 'cancelled':
        return TransactionStatus.cancelled;
      default:
        return TransactionStatus.pending;
    }
  }
}

@JsonSerializable()
class TransactionListResponse {
  final List<TransactionModel> transactions;
  final bool hasMore;
  final int total;

  const TransactionListResponse({
    required this.transactions,
    required this.hasMore,
    required this.total,
  });

  factory TransactionListResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionListResponseToJson(this);
}
