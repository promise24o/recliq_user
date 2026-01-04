import 'package:mobx/mobx.dart';
import '../../domain/entities/reward_points.dart';
import '../../domain/entities/badge.dart';
import '../../domain/entities/recycling_streak.dart';
import '../../domain/entities/environmental_impact.dart';
import '../../domain/entities/challenge.dart';
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
import '../../domain/repositories/rewards_repository.dart';
import '../../domain/usecases/get_rewards_overview.dart';
import '../../domain/usecases/get_activity_feed.dart';
import '../../domain/usecases/get_streak.dart';
import '../../domain/usecases/get_badges.dart';
import '../../domain/usecases/get_environmental_impact.dart';
import '../../domain/usecases/get_challenges.dart';
import '../../domain/usecases/get_referral.dart';
import '../../domain/usecases/redeem_referral.dart';
import '../../../../shared/services/toast_service.dart';

part 'rewards_store.g.dart';

class RewardsStore = _RewardsStore with _$RewardsStore;

abstract class _RewardsStore with Store {
  final RewardsRepository _rewardsRepository;
  late final GetRewardsOverview _getRewardsOverview;
  late final GetActivityFeed _getActivityFeed;
  late final GetStreak _getStreak;
  late final GetBadges _getBadges;
  late final GetEnvironmentalImpact _getEnvironmentalImpact;
  late final GetChallenges _getChallenges;
  late final GetReferral _getReferral;
  late final RedeemReferral _redeemReferral;

  _RewardsStore(this._rewardsRepository) {
    _getRewardsOverview = GetRewardsOverview(_rewardsRepository);
    _getActivityFeed = GetActivityFeed(_rewardsRepository);
    _getStreak = GetStreak(_rewardsRepository);
    _getBadges = GetBadges(_rewardsRepository);
    _getEnvironmentalImpact = GetEnvironmentalImpact(_rewardsRepository);
    _getChallenges = GetChallenges(_rewardsRepository);
    _getReferral = GetReferral(_rewardsRepository);
    _redeemReferral = RedeemReferral(_rewardsRepository);
  }

  // Observable states
  @observable
  RewardsOverview? rewardsOverview;

  @observable
  ActivityFeedResponse? activityFeed;

  @observable
  StreakResponse? streakResponse;

  @observable
  BadgesResponse? badgesResponse;

  @observable
  EnvironmentalImpactResponse? environmentalImpactResponse;

  @observable
  ChallengesResponse? challengesResponse;

  @observable
  ReferralResponse? referralResponse;

  @observable
  RewardPoints? rewardPoints;

  @observable
  RecyclingStreak? recyclingStreak;

  @observable
  List<Badge> badges = [];

  @observable
  EnvironmentalImpact? environmentalImpact;

  @observable
  List<Challenge> challenges = [];

  @observable
  List<RewardBenefit> rewardBenefits = [];

  @observable
  ReferralReward? referralReward;

  @observable
  List<RewardActivity> rewardActivity = [];

  @observable
  bool isLoading = false;

  @observable
  String? error;

  // Computed properties
  @computed
  int get unlockedBadgesCount => badgesResponse?.earnedBadges.length ?? 0;

  @computed
  int get totalBadgesCount => badgesResponse?.totalBadges ?? 0;

  @computed
  List<Badge> get earnedBadges => badgesResponse?.earnedBadges ?? [];

  @computed
  List<Badge> get lockedBadges => badgesResponse?.lockedBadges ?? [];

  @computed
  List<Challenge> get activeChallenges =>
      challenges.where((challenge) => !challenge.isCompleted).toList();

  @computed
  List<Challenge> get completedChallenges =>
      challenges.where((challenge) => challenge.isCompleted).toList();

  @computed
  List<RewardBenefit> get availableBenefits =>
      rewardBenefits.where((benefit) => benefit.isAvailable).toList();

  // Actions
  @action
  Future<void> loadRewardsOverview() async {
    final result = await _getRewardsOverview();
    result.fold(
      (errorMessage) => error = errorMessage,
      (overview) => rewardsOverview = overview,
    );
  }

  @action
  Future<void> loadRewardPoints() async {
    final result = await _rewardsRepository.getRewardPoints();
    result.fold(
      (errorMessage) => error = errorMessage,
      (points) => rewardPoints = points,
    );
  }

  @action
  Future<void> loadBadges() async {
    try {
      isLoading = true;
      error = null;
      final result = await _getBadges();
      result.fold(
        (errorMessage) => error = errorMessage,
        (badges) => badgesResponse = badges,
      );
    } catch (e) {
      error = 'Failed to load badges: ${e.toString()}';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadEnvironmentalImpact() async {
    try {
      isLoading = true;
      error = null;
      final result = await _getEnvironmentalImpact();
      result.fold(
        (errorMessage) => error = errorMessage,
        (impact) => environmentalImpactResponse = impact,
      );
    } catch (e) {
      error = 'Failed to load environmental impact: ${e.toString()}';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadRecyclingStreak() async {
    final result = await _rewardsRepository.getRecyclingStreak();
    result.fold(
      (errorMessage) => error = errorMessage,
      (streak) => recyclingStreak = streak,
    );
  }

  @action
  Future<void> loadStreak() async {
    try {
      isLoading = true;
      error = null;
      final result = await _getStreak();
      result.fold(
        (errorMessage) => error = errorMessage,
        (streak) => streakResponse = streak,
      );
    } catch (e) {
      error = 'Failed to load streak information: ${e.toString()}';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadChallenges() async {
    try {
      isLoading = true;
      error = null;
      final result = await _getChallenges();
      result.fold(
        (errorMessage) => error = errorMessage,
        (challenges) => challengesResponse = challenges,
      );
    } catch (e) {
      error = 'Failed to load challenges: ${e.toString()}';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadReferral() async {
    try {
      isLoading = true;
      error = null;
      final result = await _getReferral();
      result.fold(
        (errorMessage) => error = errorMessage,
        (referral) => referralResponse = referral,
      );
    } catch (e) {
      error = 'Failed to load referral information: ${e.toString()}';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<RedeemReferralResponse?> redeemReferral(
      List<String>? referralIds) async {
    try {
      isLoading = true;
      error = null;
      final result = await _redeemReferral(referralIds);

      return result.fold(
        (errorMessage) {
          error = errorMessage;
          ToastService.showError(errorMessage);
          return null;
        },
        (redeemResponse) {
          // Refresh the referral list after successful redemption
          loadReferral();
          ToastService.showSuccess(
              'Successfully redeemed ${redeemResponse.redeemedCount} referral(s) for ${redeemResponse.totalPointsRedeemed} points!');
          return redeemResponse;
        },
      );
    } catch (e) {
      error = 'Failed to redeem referrals: ${e.toString()}';
      ToastService.showError(error!);
      return null;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadRewardBenefits() async {
    final result = await _rewardsRepository.getRewardBenefits();
    result.fold(
      (errorMessage) => error = errorMessage,
      (benefitsList) => rewardBenefits = benefitsList,
    );
  }

  @action
  Future<void> loadReferralReward() async {
    final result = await _rewardsRepository.getReferralReward();
    result.fold(
      (errorMessage) => error = errorMessage,
      (referral) => referralReward = referral,
    );
  }

  @action
  Future<void> loadRewardActivity() async {
    final result = await _rewardsRepository.getRewardActivity();
    result.fold(
      (errorMessage) => error = errorMessage,
      (activityList) => rewardActivity = activityList,
    );
  }

  @action
  Future<void> loadActivityFeed({
    int limit = 20,
    int offset = 0,
    bool append = false,
  }) async {
    try {
      if (!append) {
        isLoading = true;
        error = null;
      }
      final result = await _getActivityFeed(limit: limit, offset: offset);
      result.fold(
        (errorMessage) => error = errorMessage,
        (feed) {
          if (append && activityFeed != null) {
            activityFeed = activityFeed!.copyWith(
              activity: [...activityFeed!.activity, ...feed.activity],
              hasMore: feed.hasMore,
            );
          } else {
            activityFeed = feed;
          }
        },
      );
    } catch (e) {
      error = 'Failed to load activity feed: ${e.toString()}';
    } finally {
      if (!append) {
        isLoading = false;
      }
    }
  }

  @action
  Future<void> loadAllRewardsData() async {
    isLoading = true;
    error = null;

    try {
      await Future.wait([
        loadRewardsOverview(),
        loadRewardPoints(),
        loadBadges(),
        loadRecyclingStreak(),
        loadEnvironmentalImpact(),
        loadChallenges(),
        loadRewardBenefits(),
        loadReferralReward(),
        loadRewardActivity(),
      ]);
    } catch (e) {
      error = 'Failed to load rewards data';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> updateChallengeProgress(String challengeId, int progress) async {
    isLoading = true;
    error = null;

    final result =
        await _rewardsRepository.updateChallengeProgress(challengeId, progress);
    result.fold(
      (errorMessage) {
        error = errorMessage;
        ToastService.showError(errorMessage);
      },
      (_) {
        // Refresh challenges to get updated data
        loadChallenges();
        ToastService.showSuccess('Challenge progress updated!');
      },
    );

    isLoading = false;
  }

  @action
  Future<void> redeemBenefit(String benefitId) async {
    isLoading = true;
    error = null;

    final result = await _rewardsRepository.redeemBenefit(benefitId);
    result.fold(
      (errorMessage) {
        error = errorMessage;
        ToastService.showError(errorMessage);
      },
      (_) {
        // Refresh data to update points and benefits
        loadRewardPoints();
        loadRewardBenefits();
        loadRewardActivity();
        ToastService.showSuccess('Benefit redeemed successfully!');
      },
    );

    isLoading = false;
  }

  @action
  Future<String> generateReferralCode() async {
    final result = await _rewardsRepository.generateReferralCode();
    return result.fold(
      (errorMessage) {
        error = errorMessage;
        ToastService.showError(errorMessage);
        return '';
      },
      (referralCode) {
        ToastService.showSuccess('Referral code generated!');
        return referralCode;
      },
    );
  }

  @action
  void clearError() {
    error = null;
  }
}
