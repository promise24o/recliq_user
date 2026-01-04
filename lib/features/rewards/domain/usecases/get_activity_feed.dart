import 'package:dartz/dartz.dart';
import '../entities/activity_feed_response.dart';
import '../repositories/rewards_repository.dart';

class GetActivityFeed {
  final RewardsRepository repository;

  GetActivityFeed(this.repository);

  Future<Either<String, ActivityFeedResponse>> call({
    int limit = 20,
    int offset = 0,
  }) async {
    return await repository.getActivityFeed(limit: limit, offset: offset);
  }
}
