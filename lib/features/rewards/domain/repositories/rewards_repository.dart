import 'package:dartz/dartz.dart';
import '../entities/reward_points.dart';
import '../entities/recycling_streak.dart';
import '../entities/reward_benefit.dart';
import '../entities/referral_reward.dart';
import '../entities/reward_activity.dart';
import '../entities/rewards_overview.dart';
import '../entities/activity_feed_response.dart';
import '../entities/streak_response.dart';
import '../entities/badges_response.dart';
import '../entities/environmental_impact_response.dart';
import '../entities/challenges_response.dart';
import '../entities/referral_response.dart';
import '../entities/redeem_referral_response.dart';

abstract class RewardsRepository {
  Future<Either<String, RewardsOverview>> getRewardsOverview();
  Future<Either<String, RewardPoints>> getRewardPoints();
  Future<Either<String, BadgesResponse>> getBadges();
  Future<Either<String, RecyclingStreak>> getRecyclingStreak();
  Future<Either<String, StreakResponse>> getStreak();
  Future<Either<String, EnvironmentalImpactResponse>> getEnvironmentalImpact();
  Future<Either<String, ChallengesResponse>> getChallenges();
  Future<Either<String, ReferralResponse>> getReferral();
  Future<Either<String, List<RewardBenefit>>> getRewardBenefits();
  Future<Either<String, ReferralReward>> getReferralReward();
  Future<Either<String, List<RewardActivity>>> getRewardActivity();
  Future<Either<String, ActivityFeedResponse>> getActivityFeed({
    int limit = 20,
    int offset = 0,
  });

  Future<Either<String, void>> updateChallengeProgress(
      String challengeId, int progress);
  Future<Either<String, void>> redeemBenefit(String benefitId);
  Future<Either<String, String>> generateReferralCode();
  Future<Either<String, RedeemReferralResponse>> redeemReferral(
      List<String>? referralIds);
}
