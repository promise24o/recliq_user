import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/pin_auth_repository.dart';

class VerifyPin {
  final PinAuthRepository repository;

  VerifyPin(this.repository);

  Future<Either<Failure, bool>> call(String pin) async {
    return await repository.verifyPin(pin);
  }
}
