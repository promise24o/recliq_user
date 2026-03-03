import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/pickup_request.dart';
import '../entities/available_agent.dart';
import '../entities/tracking_location.dart';

abstract class PickupRepository {
  Future<Either<Failure, PickupRequest>> createPickupRequest({
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
  });

  Future<Either<Failure, AvailableAgentsResponse>> getAvailableAgents({
    required double lat,
    required double lng,
  });

  Future<Either<Failure, List<PickupRequest>>> getMyRequests();

  Future<Either<Failure, PickupRequest>> getPickupById(String id);

  Future<Either<Failure, PickupRequest>> cancelPickupRequest({
    required String id,
    required String reason,
  });

  Future<Either<Failure, TrackingLocation>> getTrackingLocation(String pickupId);
}
