import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

abstract class PinAuthLocalDataSource {
  Future<String?> getStoredPin();
  Future<void> storePin(String pin);
  Future<void> clearPin();
  Future<bool> hasPin();
  Future<int> getFailedAttempts();
  Future<void> incrementFailedAttempts();
  Future<void> resetFailedAttempts();
  Future<bool> isBiometricEnabled();
  Future<void> setBiometricEnabled(bool enabled);
  Future<bool> authenticateWithBiometric();
}

class PinAuthLocalDataSourceImpl implements PinAuthLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final LocalAuthentication localAuth;

  static const String _pinKey = 'user_pin';
  static const String _failedAttemptsKey = 'pin_failed_attempts';
  static const String _biometricEnabledKey = 'biometric_enabled';
  static const String _lastFailedAttemptKey = 'last_failed_attempt';

  PinAuthLocalDataSourceImpl({
    required this.secureStorage,
    required this.localAuth,
  });

  @override
  Future<String?> getStoredPin() async {
    try {
      final pin = await secureStorage.read(key: _pinKey);
      print('DEBUG: Retrieved PIN from storage: $pin');
      return pin;
    } catch (e) {
      print('DEBUG: Failed to get stored PIN: $e');
      throw Exception('Failed to get stored PIN');
    }
  }

  @override
  Future<void> storePin(String pin) async {
    try {
      print('DEBUG: Storing PIN: $pin');
      await secureStorage.write(key: _pinKey, value: pin);
      print('DEBUG: PIN stored successfully');
    } catch (e) {
      print('DEBUG: Failed to store PIN: $e');
      throw Exception('Failed to store PIN');
    }
  }

  @override
  Future<void> clearPin() async {
    try {
      await secureStorage.delete(key: _pinKey);
    } catch (e) {
      throw Exception('Failed to clear PIN');
    }
  }

  @override
  Future<bool> hasPin() async {
    try {
      final pin = await getStoredPin();
      return pin != null && pin.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<int> getFailedAttempts() async {
    try {
      final attempts = await secureStorage.read(key: _failedAttemptsKey);
      return attempts != null ? int.tryParse(attempts) ?? 0 : 0;
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<void> incrementFailedAttempts() async {
    try {
      final currentAttempts = await getFailedAttempts();
      await secureStorage.write(
        key: _failedAttemptsKey,
        value: (currentAttempts + 1).toString(),
      );
      await secureStorage.write(
        key: _lastFailedAttemptKey,
        value: DateTime.now().toIso8601String(),
      );
    } catch (e) {
      throw Exception('Failed to increment failed attempts');
    }
  }

  @override
  Future<void> resetFailedAttempts() async {
    try {
      await secureStorage.delete(key: _failedAttemptsKey);
      await secureStorage.delete(key: _lastFailedAttemptKey);
    } catch (e) {
      throw Exception('Failed to reset failed attempts');
    }
  }

  @override
  Future<bool> isBiometricEnabled() async {
    try {
      final enabled = await secureStorage.read(key: _biometricEnabledKey);
      return enabled == 'true';
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> setBiometricEnabled(bool enabled) async {
    try {
      await secureStorage.write(
        key: _biometricEnabledKey,
        value: enabled.toString(),
      );
    } catch (e) {
      throw Exception('Failed to set biometric enabled');
    }
  }

  @override
  Future<bool> authenticateWithBiometric() async {
    try {
      final isAvailable = await localAuth.canCheckBiometrics;
      if (!isAvailable) {
        throw Exception('Biometric authentication not available');
      }

      final isAuthenticated = await localAuth.authenticate(
        localizedReason: 'Authenticate to access your account',
        biometricOnly: true,
      );

      return isAuthenticated;
    } catch (e) {
      // Don't throw an exception for user cancellation
      if (e.toString().contains('userCanceled') ||
          e.toString().contains('noCredentialsSet')) {
        return false;
      }
      throw Exception('Biometric authentication failed: $e');
    }
  }
}
