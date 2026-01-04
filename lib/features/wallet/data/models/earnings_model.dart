import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/earnings.dart';

part 'earnings_model.g.dart';

@JsonSerializable()
class EarningsModel {
  @JsonKey(name: 'available_balance')
  final double availableBalance;
  @JsonKey(name: 'total_earnings')
  final double totalEarnings;
  @JsonKey(name: 'today_earnings')
  final double todayEarnings;
  @JsonKey(name: 'weekly_earnings')
  final double weeklyEarnings;
  @JsonKey(name: 'monthly_earnings')
  final double monthlyEarnings;
  @JsonKey(name: 'daily_breakdown')
  final List<DailyEarningModel> dailyBreakdown;
  @JsonKey(name: 'material_breakdown')
  final List<MaterialEarningModel> materialBreakdown;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;

  const EarningsModel({
    required this.availableBalance,
    required this.totalEarnings,
    required this.todayEarnings,
    required this.weeklyEarnings,
    required this.monthlyEarnings,
    required this.dailyBreakdown,
    required this.materialBreakdown,
    this.lastUpdated,
  });

  factory EarningsModel.fromJson(Map<String, dynamic> json) =>
      _$EarningsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EarningsModelToJson(this);

  Earnings toDomain() {
    return Earnings(
      availableBalance: availableBalance,
      totalEarnings: totalEarnings,
      todayEarnings: todayEarnings,
      weeklyEarnings: weeklyEarnings,
      monthlyEarnings: monthlyEarnings,
      dailyBreakdown: dailyBreakdown.map((e) => e.toDomain()).toList(),
      materialBreakdown: materialBreakdown.map((e) => e.toDomain()).toList(),
      lastUpdated: lastUpdated,
    );
  }
}

@JsonSerializable()
class DailyEarningModel {
  final DateTime date;
  final double amount;
  @JsonKey(name: 'transactions_count')
  final int transactionsCount;
  @JsonKey(name: 'material_breakdown')
  final Map<String, double>? materialBreakdown;

  const DailyEarningModel({
    required this.date,
    required this.amount,
    required this.transactionsCount,
    this.materialBreakdown,
  });

  factory DailyEarningModel.fromJson(Map<String, dynamic> json) =>
      _$DailyEarningModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyEarningModelToJson(this);

  DailyEarning toDomain() {
    return DailyEarning(
      date: date,
      amount: amount,
      transactionsCount: transactionsCount,
      materialBreakdown: materialBreakdown,
    );
  }
}

@JsonSerializable()
class MaterialEarningModel {
  final String material;
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  final double weight;
  @JsonKey(name: 'transactions_count')
  final int transactionsCount;

  const MaterialEarningModel({
    required this.material,
    required this.totalAmount,
    required this.weight,
    required this.transactionsCount,
  });

  factory MaterialEarningModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialEarningModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialEarningModelToJson(this);

  MaterialEarning toDomain() {
    return MaterialEarning(
      material: material,
      totalAmount: totalAmount,
      weight: weight,
      transactionsCount: transactionsCount,
    );
  }
}

@JsonSerializable()
class EarningsSummaryModel {
  @JsonKey(name: 'total_earnings')
  final double totalEarnings;
  @JsonKey(name: 'average_daily_earnings')
  final double averageDailyEarnings;
  @JsonKey(name: 'best_day_earnings')
  final double bestDayEarnings;
  @JsonKey(name: 'best_day_date')
  final DateTime bestDayDate;
  @JsonKey(name: 'most_recycled_material')
  final String mostRecycledMaterial;
  @JsonKey(name: 'most_recycled_material_amount')
  final double mostRecycledMaterialAmount;
  @JsonKey(name: 'total_transactions')
  final int totalTransactions;
  @JsonKey(name: 'average_transaction_amount')
  final double averageTransactionAmount;
  @JsonKey(name: 'monthly_breakdown')
  final List<MonthlyEarningModel> monthlyBreakdown;

  const EarningsSummaryModel({
    required this.totalEarnings,
    required this.averageDailyEarnings,
    required this.bestDayEarnings,
    required this.bestDayDate,
    required this.mostRecycledMaterial,
    required this.mostRecycledMaterialAmount,
    required this.totalTransactions,
    required this.averageTransactionAmount,
    required this.monthlyBreakdown,
  });

  factory EarningsSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$EarningsSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$EarningsSummaryModelToJson(this);

  EarningsSummary toDomain() {
    return EarningsSummary(
      totalEarnings: totalEarnings,
      averageDailyEarnings: averageDailyEarnings,
      bestDayEarnings: bestDayEarnings,
      bestDayDate: bestDayDate,
      mostRecycledMaterial: mostRecycledMaterial,
      mostRecycledMaterialAmount: mostRecycledMaterialAmount,
      totalTransactions: totalTransactions,
      averageTransactionAmount: averageTransactionAmount,
      monthlyBreakdown: monthlyBreakdown.map((e) => e.toDomain()).toList(),
    );
  }
}

@JsonSerializable()
class MonthlyEarningModel {
  final DateTime month;
  final double amount;
  @JsonKey(name: 'transactions_count')
  final int transactionsCount;

  const MonthlyEarningModel({
    required this.month,
    required this.amount,
    required this.transactionsCount,
  });

  factory MonthlyEarningModel.fromJson(Map<String, dynamic> json) =>
      _$MonthlyEarningModelFromJson(json);

  Map<String, dynamic> toJson() => _$MonthlyEarningModelToJson(this);

  MonthlyEarning toDomain() {
    return MonthlyEarning(
      month: month,
      amount: amount,
      transactionsCount: transactionsCount,
    );
  }
}
