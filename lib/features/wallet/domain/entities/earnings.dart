import 'package:freezed_annotation/freezed_annotation.dart';

part 'earnings.freezed.dart';

@freezed
class Earnings with _$Earnings {
  const factory Earnings({
    required double availableBalance,
    required double totalEarnings,
    required double todayEarnings,
    required double weeklyEarnings,
    required double monthlyEarnings,
    required List<DailyEarning> dailyBreakdown,
    required List<MaterialEarning> materialBreakdown,
    DateTime? lastUpdated,
  }) = _Earnings;
}

@freezed
class DailyEarning with _$DailyEarning {
  const factory DailyEarning({
    required DateTime date,
    required double amount,
    required int transactionsCount,
    Map<String, double>? materialBreakdown,
  }) = _DailyEarning;
}

@freezed
class MaterialEarning with _$MaterialEarning {
  const factory MaterialEarning({
    required String material, // 'PET', 'Glass', 'Paper', etc.
    required double totalAmount,
    required double weight,
    required int transactionsCount,
  }) = _MaterialEarning;
}

@freezed
class EarningsSummary with _$EarningsSummary {
  const factory EarningsSummary({
    required double totalEarnings,
    required double averageDailyEarnings,
    required double bestDayEarnings,
    required DateTime bestDayDate,
    required String mostRecycledMaterial,
    required double mostRecycledMaterialAmount,
    required int totalTransactions,
    required double averageTransactionAmount,
    required List<MonthlyEarning> monthlyBreakdown,
  }) = _EarningsSummary;
}

@freezed
class MonthlyEarning with _$MonthlyEarning {
  const factory MonthlyEarning({
    required DateTime month,
    required double amount,
    required int transactionsCount,
  }) = _MonthlyEarning;
}

extension EarningsExtension on Earnings {
  String get formattedAvailableBalance =>
      '₦${availableBalance.toStringAsFixed(2)}';
  String get formattedTotalEarnings => '₦${totalEarnings.toStringAsFixed(2)}';
  String get formattedTodayEarnings => '₦${todayEarnings.toStringAsFixed(2)}';
  String get formattedWeeklyEarnings => '₦${weeklyEarnings.toStringAsFixed(2)}';
  String get formattedMonthlyEarnings =>
      '₦${monthlyEarnings.toStringAsFixed(2)}';

  DailyEarning? getBestDay() {
    if (dailyBreakdown.isEmpty) return null;
    return dailyBreakdown.reduce((a, b) => a.amount > b.amount ? a : b);
  }

  MaterialEarning? getTopMaterial() {
    if (materialBreakdown.isEmpty) return null;
    return materialBreakdown
        .reduce((a, b) => a.totalAmount > b.totalAmount ? a : b);
  }
}

extension DailyEarningExtension on DailyEarning {
  String get formattedAmount => '₦${amount.toStringAsFixed(2)}';
  String get formattedDate => '${date.day}/${date.month}';
}

extension MaterialEarningExtension on MaterialEarning {
  String get formattedAmount => '₦${totalAmount.toStringAsFixed(2)}';
  String get formattedWeight => '${weight.toStringAsFixed(1)}kg';
}

extension EarningsSummaryExtension on EarningsSummary {
  String get formattedTotalEarnings => '₦${totalEarnings.toStringAsFixed(2)}';
  String get formattedAverageDailyEarnings =>
      '₦${averageDailyEarnings.toStringAsFixed(2)}';
  String get formattedBestDayEarnings =>
      '₦${bestDayEarnings.toStringAsFixed(2)}';
  String get formattedMostRecycledMaterialAmount =>
      '₦${mostRecycledMaterialAmount.toStringAsFixed(2)}';
  String get formattedAverageTransactionAmount =>
      '₦${averageTransactionAmount.toStringAsFixed(2)}';
}
