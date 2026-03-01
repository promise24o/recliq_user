import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/pickup_request.dart';
import '../repositories/pickup_repository.dart';

class CreatePickupRequest {
  final PickupRepository repository;

  CreatePickupRequest(this.repository);

  Future<Either<Failure, PickupRequest>> call({
    required String pickupMode,
    required String matchType,
    required String wasteType,
    required double estimatedWeight,
    required double lat,
    required double lng,
    required String address,
    String? notes,
    String? assignedAgentId,
    String? assignedAgentName,
  }) {
    return repository.createPickupRequest(
      pickupMode: pickupMode,
      matchType: matchType,
      wasteType: wasteType,
      estimatedWeight: estimatedWeight,
      lat: lat,
      lng: lng,
      address: address,
      notes: notes,
      assignedAgentId: assignedAgentId,
      assignedAgentName: assignedAgentName,
    );
  }
}
