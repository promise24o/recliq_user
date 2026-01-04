import 'package:dartz/dartz.dart';
import '../entities/streak_response.dart';
import '../repositories/rewards_repository.dart';

class GetStreak {
  final RewardsRepository repository;

  GetStreak(this.repository);

  Future<Either<String, StreakResponse>> call() async {
    return await repository.getStreak();
  }
}
