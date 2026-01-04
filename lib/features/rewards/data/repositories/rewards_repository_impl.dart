import 'package:dartz/dartz.dart';
import '../../domain/entities/reward_points.dart';
import '../../domain/entities/recycling_streak.dart';
import '../../domain/entities/reward_benefit.dart';
import '../../domain/entities/referral_reward.dart';
import '../../domain/entities/reward_activity.dart';
import '../../domain/entities/rewards_overview.dart';
import '../../domain/entities/activity_feed_response.dart';
import '../../domain/entities/streak_response.dart';
import '../../domain/entities/badges_response.dart';
import '../../domain/entities/environmental_impact_response.dart';
import '../../domain/entities/challenges_response.dart';
import '../../domain/entities/referral_response.dart';
import '../../domain/repositories/rewards_repository.dart';
import '../datasources/rewards_datasource.dart';

class RewardsRepositoryImpl implements RewardsRepository {
  final RewardsDataSource dataSource;

  RewardsRepositoryImpl(this.dataSource);

  @override
  Future<Either<String, RewardsOverview>> getRewardsOverview() async {
    try {
      final result = await dataSource.getRewardsOverview();
      return Right(result);
    } catch (e) {
      return Left('Failed to load rewards overview: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, ActivityFeedResponse>> getActivityFeed({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final result =
          await dataSource.getActivityFeed(limit: limit, offset: offset);
      return Right(result);
    } catch (e) {
      return Left('Failed to load activity feed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, RewardPoints>> getRewardPoints() async {
    try {
      final result = await dataSource.getRewardPoints();
      return Right(result);
    } catch (e) {
      return Left('Failed to load reward points: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, BadgesResponse>> getBadges() async {
    try {
      final result = await dataSource.getBadges();
      return Right(result);
    } catch (e) {
      return Left('Failed to load badges: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, RecyclingStreak>> getRecyclingStreak() async {
    try {
      final result = await dataSource.getRecyclingStreak();
      return Right(result);
    } catch (e) {
      return Left('Failed to load recycling streak: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, StreakResponse>> getStreak() async {
    try {
      final result = await dataSource.getStreak();
      return Right(result);
    } catch (e) {
      return Left('Failed to load streak information: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, EnvironmentalImpactResponse>>
      getEnvironmentalImpact() async {
    try {
      final result = await dataSource.getEnvironmentalImpact();
      return Right(result);
    } catch (e) {
      return Left('Failed to load environmental impact: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, ChallengesResponse>> getChallenges() async {
    try {
      final result = await dataSource.getChallenges();
      return Right(result);
    } catch (e) {
      return Left('Failed to load challenges: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, ReferralResponse>> getReferral() async {
    try {
      final result = await dataSource.getReferral();
      return Right(result);
    } catch (e) {
      return Left('Failed to load referral information: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<RewardBenefit>>> getRewardBenefits() async {
    try {
      final result = await dataSource.getRewardBenefits();
      return Right(result);
    } catch (e) {
      return Left('Failed to load reward benefits: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, ReferralReward>> getReferralReward() async {
    try {
      final result = await dataSource.getReferralReward();
      return Right(result);
    } catch (e) {
      return Left('Failed to load referral reward: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<RewardActivity>>> getRewardActivity() async {
    try {
      final result = await dataSource.getRewardActivity();
      return Right(result);
    } catch (e) {
      return Left('Failed to load reward activity: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> updateChallengeProgress(
      String challengeId, int progress) async {
    try {
      await dataSource.updateChallengeProgress(challengeId, progress);
      return const Right(null);
    } catch (e) {
      return Left('Failed to update challenge progress: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> redeemBenefit(String benefitId) async {
    try {
      await dataSource.redeemBenefit(benefitId);
      return const Right(null);
    } catch (e) {
      return Left('Failed to redeem benefit: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> generateReferralCode() async {
    try {
      final result = await dataSource.generateReferralCode();
      return Right(result);
    } catch (e) {
      return Left('Failed to generate referral code: ${e.toString()}');
    }
  }
}
