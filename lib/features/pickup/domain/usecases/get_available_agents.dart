import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/available_agent.dart';
import '../repositories/pickup_repository.dart';

class GetAvailableAgents {
  final PickupRepository repository;

  GetAvailableAgents(this.repository);

  Future<Either<Failure, AvailableAgentsResponse>> call({
    required double lat,
    required double lng,
  }) {
    return repository.getAvailableAgents(lat: lat, lng: lng);
  }
}
