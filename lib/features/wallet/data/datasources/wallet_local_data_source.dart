import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bank_model.dart';
import '../../domain/entities/wallet_overview_response.dart';

abstract class WalletLocalDataSource {
  Future<WalletOverviewResponse?> getCachedWalletOverview();
  Future<void> cacheWalletOverview(WalletOverviewResponse overview);
  Future<List<BankModel>?> getCachedBanks();
  Future<void> cacheBanks(List<BankModel> banks);
  Future<void> clearCache();
}

class WalletLocalDataSourceImpl implements WalletLocalDataSource {
  final SharedPreferences _prefs;
  static const String _banksKey = 'cached_banks';
  static const String _walletOverviewKey = 'cached_wallet_overview';

  WalletLocalDataSourceImpl({required SharedPreferences prefs})
      : _prefs = prefs;

  @override
  Future<WalletOverviewResponse?> getCachedWalletOverview() async {
    final overviewJson = _prefs.getString(_walletOverviewKey);
    if (overviewJson == null) return null;

    try {
      return WalletOverviewResponse.fromJson(json.decode(overviewJson));
    } catch (e) {
      // If there's an error parsing, remove the cached data
      await _prefs.remove(_walletOverviewKey);
      return null;
    }
  }

  @override
  Future<void> cacheWalletOverview(WalletOverviewResponse overview) async {
    final overviewJson = json.encode(overview.toJson());
    await _prefs.setString(_walletOverviewKey, overviewJson);
  }

  @override
  Future<List<BankModel>?> getCachedBanks() async {
    final banksJson = _prefs.getString(_banksKey);
    if (banksJson == null) return null;

    try {
      final List<dynamic> decoded = json.decode(banksJson);
      return decoded.map((json) => BankModel.fromJson(json)).toList();
    } catch (e) {
      // If there's an error parsing, clear the cache
      await clearCache();
      return null;
    }
  }

  @override
  Future<void> cacheBanks(List<BankModel> banks) async {
    final banksJson = json.encode(
      banks.map((bank) => bank.toJson()).toList(),
    );
    await _prefs.setString(_banksKey, banksJson);
  }

  @override
  Future<void> clearCache() async {
    await _prefs.remove(_banksKey);
  }
}
