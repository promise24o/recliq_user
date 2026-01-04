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
import '../../domain/entities/redeem_referral_response.dart';

abstract class RewardsDataSource {
  Future<RewardsOverview> getRewardsOverview();
  Future<RewardPoints> getRewardPoints();
  Future<BadgesResponse> getBadges();
  Future<RecyclingStreak> getRecyclingStreak();
  Future<StreakResponse> getStreak();
  Future<EnvironmentalImpactResponse> getEnvironmentalImpact();
  Future<ChallengesResponse> getChallenges();
  Future<ReferralResponse> getReferral();
  Future<List<RewardBenefit>> getRewardBenefits();
  Future<ReferralReward> getReferralReward();
  Future<List<RewardActivity>> getRewardActivity();
  Future<ActivityFeedResponse> getActivityFeed({
    int limit = 20,
    int offset = 0,
  });

  Future<void> updateChallengeProgress(String challengeId, int progress);
  Future<void> redeemBenefit(String benefitId);
  Future<String> generateReferralCode();
  Future<RedeemReferralResponse> redeemReferral(List<String>? referralIds);
}
