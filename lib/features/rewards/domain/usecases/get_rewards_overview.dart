import 'package:dartz/dartz.dart';
import '../entities/rewards_overview.dart';
import '../repositories/rewards_repository.dart';

class GetRewardsOverview {
  final RewardsRepository repository;

  GetRewardsOverview(this.repository);

  Future<Either<String, RewardsOverview>> call() async {
    return await repository.getRewardsOverview();
  }
}
