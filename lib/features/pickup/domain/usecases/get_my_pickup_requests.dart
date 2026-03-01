import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/pickup_request.dart';
import '../repositories/pickup_repository.dart';

class GetMyPickupRequests {
  final PickupRepository repository;

  GetMyPickupRequests(this.repository);

  Future<Either<Failure, List<PickupRequest>>> call() {
    return repository.getMyRequests();
  }
}
