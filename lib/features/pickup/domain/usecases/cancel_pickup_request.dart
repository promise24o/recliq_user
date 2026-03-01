import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/pickup_request.dart';
import '../repositories/pickup_repository.dart';

class CancelPickupRequest {
  final PickupRepository repository;

  CancelPickupRequest(this.repository);

  Future<Either<Failure, PickupRequest>> call({
    required String id,
    required String reason,
  }) {
    return repository.cancelPickupRequest(id: id, reason: reason);
  }
}
