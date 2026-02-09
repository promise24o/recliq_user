import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/pin_auth_repository.dart';

class AuthenticateWithBiometric {
  final PinAuthRepository repository;

  AuthenticateWithBiometric(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.authenticateWithBiometric();
  }
}
