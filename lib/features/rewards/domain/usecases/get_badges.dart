import 'package:dartz/dartz.dart';
import '../entities/badges_response.dart';
import '../repositories/rewards_repository.dart';

class GetBadges {
  final RewardsRepository repository;

  GetBadges(this.repository);

  Future<Either<String, BadgesResponse>> call() async {
    return await repository.getBadges();
  }
}
