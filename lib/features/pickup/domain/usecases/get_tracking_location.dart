import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/tracking_location.dart';
import '../repositories/pickup_repository.dart';

class GetTrackingLocation {
  final PickupRepository repository;

  GetTrackingLocation(this.repository);

  Future<Either<Failure, TrackingLocation>> call(String pickupId) {
    return repository.getTrackingLocation(pickupId);
  }
}
