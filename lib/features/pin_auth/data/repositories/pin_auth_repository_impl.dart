import 'package:dartz/dartz.dart';
import 'package:bcrypt/bcrypt.dart';
import '../../domain/entities/pin_auth_state.dart';
import '../../domain/repositories/pin_auth_repository.dart';
import '../datasources/pin_auth_local_datasource.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user.dart';

class PinAuthRepositoryImpl implements PinAuthRepository {
  final PinAuthLocalDataSource localDataSource;
  final User? currentUser;

  PinAuthRepositoryImpl({
    required this.localDataSource,
    this.currentUser,
  });

  @override
  Future<Either<Failure, bool>> verifyPin(String pin) async {
    try {
      final storedPin = await localDataSource.getStoredPin();
      print('DEBUG: Verifying PIN - entered: $pin, stored: $storedPin');

      if (storedPin == null || storedPin.isEmpty) {
        print('DEBUG: No PIN stored');
        return Left(ServerFailure('No PIN set. Please set up a PIN first.'));
      }

      if (pin.length != 4) {
        print('DEBUG: PIN length is not 4');
        return Left(InvalidInputFailure('PIN must be 4 digits'));
      }

      // Check if stored PIN is a bcrypt hash (starts with $2b$, $2a$, etc.)
      if (storedPin.startsWith(r'$2')) {
        // Use bcrypt to verify the PIN
        final isValid = BCrypt.checkpw(pin, storedPin);
        print('DEBUG: bcrypt verification result: $isValid');

        if (isValid) {
          print('DEBUG: PIN matches!');
          await localDataSource.resetFailedAttempts();
          return const Right(true);
        } else {
          print('DEBUG: PIN does not match');
          await localDataSource.incrementFailedAttempts();
          final failedAttempts = await localDataSource.getFailedAttempts();

          if (failedAttempts >= 3) {
            return Left(ServerFailure(
                'Too many failed attempts. Please try again later.'));
          }

          return Left(ServerFailure(
              'Incorrect PIN. ${3 - failedAttempts} attempts remaining.'));
        }
      } else {
        // Fallback to plain text comparison (for testing)
        print('DEBUG: Using plain text comparison');
        if (pin == storedPin) {
          print('DEBUG: PIN matches!');
          await localDataSource.resetFailedAttempts();
          return const Right(true);
        } else {
          print('DEBUG: PIN does not match');
          await localDataSource.incrementFailedAttempts();
          final failedAttempts = await localDataSource.getFailedAttempts();

          if (failedAttempts >= 3) {
            return Left(ServerFailure(
                'Too many failed attempts. Please try again later.'));
          }

          return Left(ServerFailure(
              'Incorrect PIN. ${3 - failedAttempts} attempts remaining.'));
        }
      }
    } catch (e) {
      print('DEBUG: Error verifying PIN: $e');
      return Left(CacheFailure('Failed to verify PIN: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> authenticateWithBiometric() async {
    try {
      print('DEBUG: Checking if PIN exists...');
      final hasPin = await localDataSource.hasPin();
      print('DEBUG: Has PIN: $hasPin');

      if (!hasPin) {
        print('DEBUG: No PIN found, returning error');
        return Left(ServerFailure(
            'You need to create a PIN before using biometric authentication.'));
      }

      print('DEBUG: Checking if biometric is enabled...');
      final isBiometricEnabled = await localDataSource.isBiometricEnabled();
      print('DEBUG: Biometric enabled: $isBiometricEnabled');

      if (!isBiometricEnabled) {
        print('DEBUG: Biometric not enabled, returning error');
        return Left(ServerFailure('Biometric authentication is not enabled.'));
      }

      print('DEBUG: Starting biometric authentication...');
      final isAuthenticated = await localDataSource.authenticateWithBiometric();
      print('DEBUG: Biometric authentication result: $isAuthenticated');

      if (isAuthenticated) {
        await localDataSource.resetFailedAttempts();
        return const Right(true);
      } else {
        // Return false without an error message (user likely cancelled)
        return const Right(false);
      }
    } catch (e) {
      print('DEBUG: Biometric authentication error: $e');
      return Left(
          Failure.biometricError('Biometric authentication failed: $e'));
    }
  }

  @override
  Future<Either<Failure, PinAuthState>> getPinAuthState() async {
    try {
      final hasPin = await localDataSource.hasPin();
      final isBiometricEnabled = await localDataSource.isBiometricEnabled();
      final failedAttempts = await localDataSource.getFailedAttempts();

      final isBlocked = failedAttempts >= 3;

      return Right(PinAuthState(
        isAuthenticated: false,
        isBiometricEnabled: isBiometricEnabled,
        isPinSet: hasPin,
        failedAttempts: failedAttempts,
        maxAttempts: 3,
        userFullName: currentUser?.name ?? '',
        userPhoto: currentUser?.profilePhoto ?? '',
        isBlocked: isBlocked,
        isLoading: false,
      ));
    } catch (e) {
      return Left(CacheFailure('Failed to get PIN auth state: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> incrementFailedAttempts() async {
    try {
      await localDataSource.incrementFailedAttempts();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to increment failed attempts: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> resetFailedAttempts() async {
    try {
      await localDataSource.resetFailedAttempts();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to reset failed attempts: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> clearPinInput() async {
    // This is handled in the store, but we keep it for consistency
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await localDataSource.resetFailedAttempts();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to sign out: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> hasPin() async {
    try {
      final hasPin = await localDataSource.hasPin();
      return Right(hasPin);
    } catch (e) {
      return Left(CacheFailure('Failed to check PIN status: $e'));
    }
  }
}
