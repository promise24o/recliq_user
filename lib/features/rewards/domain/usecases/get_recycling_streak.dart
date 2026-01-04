import 'package:dartz/dartz.dart';
import '../entities/recycling_streak.dart';
import '../repositories/rewards_repository.dart';

class GetRecyclingStreak {
  final RewardsRepository repository;

  GetRecyclingStreak(this.repository);

  Future<Either<String, RecyclingStreak>> call() async {
    return await repository.getRecyclingStreak();
  }
}
