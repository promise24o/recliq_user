import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bank_model.dart';

abstract class WalletLocalDataSource {
  Future<List<BankModel>?> getCachedBanks();
  Future<void> cacheBanks(List<BankModel> banks);
  Future<void> clearCache();
}

class WalletLocalDataSourceImpl implements WalletLocalDataSource {
  final SharedPreferences _prefs;
  static const String _banksKey = 'cached_banks';

  WalletLocalDataSourceImpl({required SharedPreferences prefs})
      : _prefs = prefs;

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
