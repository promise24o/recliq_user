import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/pin_auth_state.dart';
import '../repositories/pin_auth_repository.dart';

class GetPinAuthState {
  final PinAuthRepository repository;

  GetPinAuthState(this.repository);

  Future<Either<Failure, PinAuthState>> call() async {
    return await repository.getPinAuthState();
  }
}
