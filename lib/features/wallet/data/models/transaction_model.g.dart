// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as String,
      type: json['type'] as String,
      category: json['category'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      description: json['description'] as String?,
      location: json['location'] as String?,
      status: json['status'] as String?,
      reference: json['reference'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'category': instance.category,
      'amount': instance.amount,
      'currency': instance.currency,
      'created_at': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'location': instance.location,
      'status': instance.status,
      'reference': instance.reference,
      'metadata': instance.metadata,
    };

TransactionListResponse _$TransactionListResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionListResponse(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionListResponseToJson(
        TransactionListResponse instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'hasMore': instance.hasMore,
      'total': instance.total,
    };
