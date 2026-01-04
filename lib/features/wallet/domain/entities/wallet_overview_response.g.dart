// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletOverviewResponseImpl _$$WalletOverviewResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletOverviewResponseImpl(
      availableBalance: (json['availableBalance'] as num).toDouble(),
      todayEarnings: (json['todayEarnings'] as num).toDouble(),
      lastWithdrawnAmount: (json['lastWithdrawnAmount'] as num?)?.toDouble(),
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      totalEarnings: (json['totalEarnings'] as num).toDouble(),
      lastTransactionDate: json['lastTransactionDate'] == null
          ? null
          : DateTime.parse(json['lastTransactionDate'] as String),
    );

Map<String, dynamic> _$$WalletOverviewResponseImplToJson(
        _$WalletOverviewResponseImpl instance) =>
    <String, dynamic>{
      'availableBalance': instance.availableBalance,
      'todayEarnings': instance.todayEarnings,
      'lastWithdrawnAmount': instance.lastWithdrawnAmount,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'totalEarnings': instance.totalEarnings,
      'lastTransactionDate': instance.lastTransactionDate?.toIso8601String(),
    };
