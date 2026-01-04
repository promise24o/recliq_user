import 'rewards_datasource.dart';
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
import 'rewards_remote_data_source.dart';

class RewardsDataSourceImpl implements RewardsDataSource {
  final RewardsRemoteDataSource _remoteDataSource;

  RewardsDataSourceImpl({required RewardsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<RewardsOverview> getRewardsOverview() async {
    return await _remoteDataSource.getRewardsOverview();
  }

  @override
  Future<ActivityFeedResponse> getActivityFeed({
    int limit = 20,
    int offset = 0,
  }) async {
    return await _remoteDataSource.getActivityFeed(
        limit: limit, offset: offset);
  }

  @override
  Future<RewardPoints> getRewardPoints() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const RewardPoints(
      totalPoints: 850,
      currentLevel: 3,
      levelName: 'Eco Hero',
      pointsToNextLevel: 150,
      levelProgress: 85,
    );
  }

  @override
  Future<ChallengesResponse> getChallenges() async {
    return await _remoteDataSource.getChallenges();
  }

  @override
  Future<RecyclingStreak> getRecyclingStreak() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return RecyclingStreak(
      currentStreak: 5,
      bestStreak: 8,
      weeklyActivity: [true, true, false, true, false, true, false],
      lastActivityDate: DateTime.now().subtract(const Duration(days: 1)),
      streakDescription:
          'Keep up the great work! You\'re on a 5-week recycling streak.',
    );
  }

  @override
  Future<StreakResponse> getStreak() async {
    return await _remoteDataSource.getStreak();
  }

  @override
  Future<EnvironmentalImpactResponse> getEnvironmentalImpact() async {
    return await _remoteDataSource.getEnvironmentalImpact();
  }

  @override
  Future<BadgesResponse> getBadges() async {
    return await _remoteDataSource.getBadges();
  }

  @override
  Future<ReferralResponse> getReferral() async {
    return await _remoteDataSource.getReferral();
  }

  @override
  Future<List<RewardBenefit>> getRewardBenefits() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      RewardBenefit(
        id: '1',
        title: 'Wallet Credits',
        description: 'Get ₦500 bonus in your wallet',
        icon: '💰',
        pointsRequired: 1000,
        isAvailable: true,
        type: const BenefitType.walletCredits(),
      ),
      RewardBenefit(
        id: '2',
        title: 'Airtime Discount',
        description: 'Get 20% off your next airtime purchase',
        icon: '📱',
        pointsRequired: 500,
        isAvailable: true,
        type: const BenefitType.airtimeDiscount(),
      ),
      RewardBenefit(
        id: '3',
        title: 'Priority Pickup',
        description: 'Skip the queue with priority pickup service',
        icon: '🚚',
        pointsRequired: 750,
        isAvailable: false,
        type: const BenefitType.priorityPickup(),
      ),
      RewardBenefit(
        id: '4',
        title: 'Exclusive Badge',
        description: 'Unlock the "Super Recycler" exclusive badge',
        icon: '🏆',
        pointsRequired: 2000,
        isAvailable: true,
        type: const BenefitType.exclusiveBadge(),
      ),
    ];
  }

  @override
  Future<ReferralReward> getReferralReward() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return ReferralReward(
      totalReferrals: 3,
      pointsEarned: 150,
      referrals: [
        ReferralInfo(
          id: '1',
          name: 'John Doe',
          referralDate: DateTime.now().subtract(const Duration(days: 10)),
          hasRecycled: true,
          pointsEarned: 50,
        ),
        ReferralInfo(
          id: '2',
          name: 'Jane Smith',
          referralDate: DateTime.now().subtract(const Duration(days: 5)),
          hasRecycled: false,
          pointsEarned: 0,
        ),
        ReferralInfo(
          id: '3',
          name: 'Mike Johnson',
          referralDate: DateTime.now().subtract(const Duration(days: 2)),
          hasRecycled: true,
          pointsEarned: 50,
        ),
      ],
    );
  }

  @override
  Future<List<RewardActivity>> getRewardActivity() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      RewardActivity(
        id: '1',
        points: 50,
        description: 'Weekly streak maintained',
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: const ActivityType.streak(),
      ),
      RewardActivity(
        id: '2',
        points: 20,
        description: 'PET recycling completed',
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: const ActivityType.recyle(),
      ),
      RewardActivity(
        id: '3',
        points: 50,
        description: 'Friend joined and recycled',
        date: DateTime.now().subtract(const Duration(days: 3)),
        type: const ActivityType.referral(),
      ),
      RewardActivity(
        id: '4',
        points: 30,
        description: 'Challenge completed: Weekly recycling',
        date: DateTime.now().subtract(const Duration(days: 5)),
        type: const ActivityType.challenge(),
      ),
      RewardActivity(
        id: '5',
        points: 25,
        description: 'Badge earned: Consistency Champion',
        date: DateTime.now().subtract(const Duration(days: 7)),
        type: const ActivityType.badge(),
      ),
    ];
  }

  @override
  Future<void> updateChallengeProgress(String challengeId, int progress) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Mock implementation - would normally update local storage or API
  }

  @override
  Future<void> redeemBenefit(String benefitId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Mock implementation - would normally call API to redeem benefit
  }

  @override
  Future<String> generateReferralCode() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 'RECLIQ${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
  }

  @override
  Future<RedeemReferralResponse> redeemReferral(
      List<String>? referralIds) async {
    return await _remoteDataSource.redeemReferral(referralIds);
  }
}
