import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/pin_auth_state.dart';

abstract class PinAuthRepository {
  Future<Either<Failure, bool>> verifyPin(String pin);
  Future<Either<Failure, bool>> authenticateWithBiometric();
  Future<Either<Failure, PinAuthState>> getPinAuthState();
  Future<Either<Failure, void>> incrementFailedAttempts();
  Future<Either<Failure, void>> resetFailedAttempts();
  Future<Either<Failure, void>> clearPinInput();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, bool>> hasPin();
}
