import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/pickup_request.dart';
import '../repositories/pickup_repository.dart';

class GetPickupById {
  final PickupRepository repository;

  GetPickupById(this.repository);

  Future<Either<Failure, PickupRequest>> call(String id) {
    return repository.getPickupById(id);
  }
}
