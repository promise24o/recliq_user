import 'package:dartz/dartz.dart';
import '../entities/challenges_response.dart';
import '../repositories/rewards_repository.dart';

class GetChallenges {
  final RewardsRepository repository;

  GetChallenges(this.repository);

  Future<Either<String, ChallengesResponse>> call() async {
    return await repository.getChallenges();
  }
}
