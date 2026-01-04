import 'package:dartz/dartz.dart';
import '../entities/reward_points.dart';
import '../repositories/rewards_repository.dart';

class GetRewardPoints {
  final RewardsRepository repository;

  GetRewardPoints(this.repository);

  Future<Either<String, RewardPoints>> call() async {
    return await repository.getRewardPoints();
  }
}
