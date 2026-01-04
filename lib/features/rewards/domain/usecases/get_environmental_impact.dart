import 'package:dartz/dartz.dart';
import '../entities/environmental_impact_response.dart';
import '../repositories/rewards_repository.dart';

class GetEnvironmentalImpact {
  final RewardsRepository repository;

  GetEnvironmentalImpact(this.repository);

  Future<Either<String, EnvironmentalImpactResponse>> call() async {
    return await repository.getEnvironmentalImpact();
  }
}
