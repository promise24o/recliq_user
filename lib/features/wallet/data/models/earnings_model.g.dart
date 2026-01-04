// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earnings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EarningsModel _$EarningsModelFromJson(Map<String, dynamic> json) =>
    EarningsModel(
      availableBalance: (json['available_balance'] as num).toDouble(),
      totalEarnings: (json['total_earnings'] as num).toDouble(),
      todayEarnings: (json['today_earnings'] as num).toDouble(),
      weeklyEarnings: (json['weekly_earnings'] as num).toDouble(),
      monthlyEarnings: (json['monthly_earnings'] as num).toDouble(),
      dailyBreakdown: (json['daily_breakdown'] as List<dynamic>)
          .map((e) => DailyEarningModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      materialBreakdown: (json['material_breakdown'] as List<dynamic>)
          .map((e) => MaterialEarningModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$EarningsModelToJson(EarningsModel instance) =>
    <String, dynamic>{
      'available_balance': instance.availableBalance,
      'total_earnings': instance.totalEarnings,
      'today_earnings': instance.todayEarnings,
      'weekly_earnings': instance.weeklyEarnings,
      'monthly_earnings': instance.monthlyEarnings,
      'daily_breakdown': instance.dailyBreakdown,
      'material_breakdown': instance.materialBreakdown,
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };

DailyEarningModel _$DailyEarningModelFromJson(Map<String, dynamic> json) =>
    DailyEarningModel(
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      transactionsCount: (json['transactions_count'] as num).toInt(),
      materialBreakdown:
          (json['material_breakdown'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$DailyEarningModelToJson(DailyEarningModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'transactions_count': instance.transactionsCount,
      'material_breakdown': instance.materialBreakdown,
    };

MaterialEarningModel _$MaterialEarningModelFromJson(
        Map<String, dynamic> json) =>
    MaterialEarningModel(
      material: json['material'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      transactionsCount: (json['transactions_count'] as num).toInt(),
    );

Map<String, dynamic> _$MaterialEarningModelToJson(
        MaterialEarningModel instance) =>
    <String, dynamic>{
      'material': instance.material,
      'total_amount': instance.totalAmount,
      'weight': instance.weight,
      'transactions_count': instance.transactionsCount,
    };

EarningsSummaryModel _$EarningsSummaryModelFromJson(
        Map<String, dynamic> json) =>
    EarningsSummaryModel(
      totalEarnings: (json['total_earnings'] as num).toDouble(),
      averageDailyEarnings: (json['average_daily_earnings'] as num).toDouble(),
      bestDayEarnings: (json['best_day_earnings'] as num).toDouble(),
      bestDayDate: DateTime.parse(json['best_day_date'] as String),
      mostRecycledMaterial: json['most_recycled_material'] as String,
      mostRecycledMaterialAmount:
          (json['most_recycled_material_amount'] as num).toDouble(),
      totalTransactions: (json['total_transactions'] as num).toInt(),
      averageTransactionAmount:
          (json['average_transaction_amount'] as num).toDouble(),
      monthlyBreakdown: (json['monthly_breakdown'] as List<dynamic>)
          .map((e) => MonthlyEarningModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EarningsSummaryModelToJson(
        EarningsSummaryModel instance) =>
    <String, dynamic>{
      'total_earnings': instance.totalEarnings,
      'average_daily_earnings': instance.averageDailyEarnings,
      'best_day_earnings': instance.bestDayEarnings,
      'best_day_date': instance.bestDayDate.toIso8601String(),
      'most_recycled_material': instance.mostRecycledMaterial,
      'most_recycled_material_amount': instance.mostRecycledMaterialAmount,
      'total_transactions': instance.totalTransactions,
      'average_transaction_amount': instance.averageTransactionAmount,
      'monthly_breakdown': instance.monthlyBreakdown,
    };

MonthlyEarningModel _$MonthlyEarningModelFromJson(Map<String, dynamic> json) =>
    MonthlyEarningModel(
      month: DateTime.parse(json['month'] as String),
      amount: (json['amount'] as num).toDouble(),
      transactionsCount: (json['transactions_count'] as num).toInt(),
    );

Map<String, dynamic> _$MonthlyEarningModelToJson(
        MonthlyEarningModel instance) =>
    <String, dynamic>{
      'month': instance.month.toIso8601String(),
      'amount': instance.amount,
      'transactions_count': instance.transactionsCount,
    };
