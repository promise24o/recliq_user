import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class OnboardingSecureStorage {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
}

@Injectable(as: OnboardingSecureStorage)
class OnboardingSecureStorageImpl implements OnboardingSecureStorage {
  final FlutterSecureStorage _storage;

  OnboardingSecureStorageImpl(@Named('secure_storage') this._storage);

  @override
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}
