import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_overview_response.freezed.dart';
part 'wallet_overview_response.g.dart';

@freezed
class WalletOverviewResponse with _$WalletOverviewResponse {
  const factory WalletOverviewResponse({
    required double availableBalance,
    required double todayEarnings,
    required double? lastWithdrawnAmount,
    required String accountNumber,
    required String accountName,
    required double totalEarnings,
    required DateTime? lastTransactionDate,
  }) = _WalletOverviewResponse;

  factory WalletOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletOverviewResponseFromJson(json);
}
