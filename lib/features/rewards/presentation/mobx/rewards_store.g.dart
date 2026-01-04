// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RewardsStore on _RewardsStore, Store {
  Computed<int>? _$unlockedBadgesCountComputed;

  @override
  int get unlockedBadgesCount => (_$unlockedBadgesCountComputed ??=
          Computed<int>(() => super.unlockedBadgesCount,
              name: '_RewardsStore.unlockedBadgesCount'))
      .value;
  Computed<int>? _$totalBadgesCountComputed;

  @override
  int get totalBadgesCount => (_$totalBadgesCountComputed ??= Computed<int>(
          () => super.totalBadgesCount,
          name: '_RewardsStore.totalBadgesCount'))
      .value;
  Computed<List<Badge>>? _$earnedBadgesComputed;

  @override
  List<Badge> get earnedBadges => (_$earnedBadgesComputed ??=
          Computed<List<Badge>>(() => super.earnedBadges,
              name: '_RewardsStore.earnedBadges'))
      .value;
  Computed<List<Badge>>? _$lockedBadgesComputed;

  @override
  List<Badge> get lockedBadges => (_$lockedBadgesComputed ??=
          Computed<List<Badge>>(() => super.lockedBadges,
              name: '_RewardsStore.lockedBadges'))
      .value;
  Computed<List<Challenge>>? _$activeChallengesComputed;

  @override
  List<Challenge> get activeChallenges => (_$activeChallengesComputed ??=
          Computed<List<Challenge>>(() => super.activeChallenges,
              name: '_RewardsStore.activeChallenges'))
      .value;
  Computed<List<Challenge>>? _$completedChallengesComputed;

  @override
  List<Challenge> get completedChallenges => (_$completedChallengesComputed ??=
          Computed<List<Challenge>>(() => super.completedChallenges,
              name: '_RewardsStore.completedChallenges'))
      .value;
  Computed<List<RewardBenefit>>? _$availableBenefitsComputed;

  @override
  List<RewardBenefit> get availableBenefits => (_$availableBenefitsComputed ??=
          Computed<List<RewardBenefit>>(() => super.availableBenefits,
              name: '_RewardsStore.availableBenefits'))
      .value;

  late final _$rewardsOverviewAtom =
      Atom(name: '_RewardsStore.rewardsOverview', context: context);

  @override
  RewardsOverview? get rewardsOverview {
    _$rewardsOverviewAtom.reportRead();
    return super.rewardsOverview;
  }

  @override
  set rewardsOverview(RewardsOverview? value) {
    _$rewardsOverviewAtom.reportWrite(value, super.rewardsOverview, () {
      super.rewardsOverview = value;
    });
  }

  late final _$activityFeedAtom =
      Atom(name: '_RewardsStore.activityFeed', context: context);

  @override
  ActivityFeedResponse? get activityFeed {
    _$activityFeedAtom.reportRead();
    return super.activityFeed;
  }

  @override
  set activityFeed(ActivityFeedResponse? value) {
    _$activityFeedAtom.reportWrite(value, super.activityFeed, () {
      super.activityFeed = value;
    });
  }

  late final _$streakResponseAtom =
      Atom(name: '_RewardsStore.streakResponse', context: context);

  @override
  StreakResponse? get streakResponse {
    _$streakResponseAtom.reportRead();
    return super.streakResponse;
  }

  @override
  set streakResponse(StreakResponse? value) {
    _$streakResponseAtom.reportWrite(value, super.streakResponse, () {
      super.streakResponse = value;
    });
  }

  late final _$badgesResponseAtom =
      Atom(name: '_RewardsStore.badgesResponse', context: context);

  @override
  BadgesResponse? get badgesResponse {
    _$badgesResponseAtom.reportRead();
    return super.badgesResponse;
  }

  @override
  set badgesResponse(BadgesResponse? value) {
    _$badgesResponseAtom.reportWrite(value, super.badgesResponse, () {
      super.badgesResponse = value;
    });
  }

  late final _$environmentalImpactResponseAtom =
      Atom(name: '_RewardsStore.environmentalImpactResponse', context: context);

  @override
  EnvironmentalImpactResponse? get environmentalImpactResponse {
    _$environmentalImpactResponseAtom.reportRead();
    return super.environmentalImpactResponse;
  }

  @override
  set environmentalImpactResponse(EnvironmentalImpactResponse? value) {
    _$environmentalImpactResponseAtom
        .reportWrite(value, super.environmentalImpactResponse, () {
      super.environmentalImpactResponse = value;
    });
  }

  late final _$challengesResponseAtom =
      Atom(name: '_RewardsStore.challengesResponse', context: context);

  @override
  ChallengesResponse? get challengesResponse {
    _$challengesResponseAtom.reportRead();
    return super.challengesResponse;
  }

  @override
  set challengesResponse(ChallengesResponse? value) {
    _$challengesResponseAtom.reportWrite(value, super.challengesResponse, () {
      super.challengesResponse = value;
    });
  }

  late final _$referralResponseAtom =
      Atom(name: '_RewardsStore.referralResponse', context: context);

  @override
  ReferralResponse? get referralResponse {
    _$referralResponseAtom.reportRead();
    return super.referralResponse;
  }

  @override
  set referralResponse(ReferralResponse? value) {
    _$referralResponseAtom.reportWrite(value, super.referralResponse, () {
      super.referralResponse = value;
    });
  }

  late final _$rewardPointsAtom =
      Atom(name: '_RewardsStore.rewardPoints', context: context);

  @override
  RewardPoints? get rewardPoints {
    _$rewardPointsAtom.reportRead();
    return super.rewardPoints;
  }

  @override
  set rewardPoints(RewardPoints? value) {
    _$rewardPointsAtom.reportWrite(value, super.rewardPoints, () {
      super.rewardPoints = value;
    });
  }

  late final _$recyclingStreakAtom =
      Atom(name: '_RewardsStore.recyclingStreak', context: context);

  @override
  RecyclingStreak? get recyclingStreak {
    _$recyclingStreakAtom.reportRead();
    return super.recyclingStreak;
  }

  @override
  set recyclingStreak(RecyclingStreak? value) {
    _$recyclingStreakAtom.reportWrite(value, super.recyclingStreak, () {
      super.recyclingStreak = value;
    });
  }

  late final _$badgesAtom =
      Atom(name: '_RewardsStore.badges', context: context);

  @override
  List<Badge> get badges {
    _$badgesAtom.reportRead();
    return super.badges;
  }

  @override
  set badges(List<Badge> value) {
    _$badgesAtom.reportWrite(value, super.badges, () {
      super.badges = value;
    });
  }

  late final _$environmentalImpactAtom =
      Atom(name: '_RewardsStore.environmentalImpact', context: context);

  @override
  EnvironmentalImpact? get environmentalImpact {
    _$environmentalImpactAtom.reportRead();
    return super.environmentalImpact;
  }

  @override
  set environmentalImpact(EnvironmentalImpact? value) {
    _$environmentalImpactAtom.reportWrite(value, super.environmentalImpact, () {
      super.environmentalImpact = value;
    });
  }

  late final _$challengesAtom =
      Atom(name: '_RewardsStore.challenges', context: context);

  @override
  List<Challenge> get challenges {
    _$challengesAtom.reportRead();
    return super.challenges;
  }

  @override
  set challenges(List<Challenge> value) {
    _$challengesAtom.reportWrite(value, super.challenges, () {
      super.challenges = value;
    });
  }

  late final _$rewardBenefitsAtom =
      Atom(name: '_RewardsStore.rewardBenefits', context: context);

  @override
  List<RewardBenefit> get rewardBenefits {
    _$rewardBenefitsAtom.reportRead();
    return super.rewardBenefits;
  }

  @override
  set rewardBenefits(List<RewardBenefit> value) {
    _$rewardBenefitsAtom.reportWrite(value, super.rewardBenefits, () {
      super.rewardBenefits = value;
    });
  }

  late final _$referralRewardAtom =
      Atom(name: '_RewardsStore.referralReward', context: context);

  @override
  ReferralReward? get referralReward {
    _$referralRewardAtom.reportRead();
    return super.referralReward;
  }

  @override
  set referralReward(ReferralReward? value) {
    _$referralRewardAtom.reportWrite(value, super.referralReward, () {
      super.referralReward = value;
    });
  }

  late final _$rewardActivityAtom =
      Atom(name: '_RewardsStore.rewardActivity', context: context);

  @override
  List<RewardActivity> get rewardActivity {
    _$rewardActivityAtom.reportRead();
    return super.rewardActivity;
  }

  @override
  set rewardActivity(List<RewardActivity> value) {
    _$rewardActivityAtom.reportWrite(value, super.rewardActivity, () {
      super.rewardActivity = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_RewardsStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_RewardsStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadRewardsOverviewAsyncAction =
      AsyncAction('_RewardsStore.loadRewardsOverview', context: context);

  @override
  Future<void> loadRewardsOverview() {
    return _$loadRewardsOverviewAsyncAction
        .run(() => super.loadRewardsOverview());
  }

  late final _$loadRewardPointsAsyncAction =
      AsyncAction('_RewardsStore.loadRewardPoints', context: context);

  @override
  Future<void> loadRewardPoints() {
    return _$loadRewardPointsAsyncAction.run(() => super.loadRewardPoints());
  }

  late final _$loadBadgesAsyncAction =
      AsyncAction('_RewardsStore.loadBadges', context: context);

  @override
  Future<void> loadBadges() {
    return _$loadBadgesAsyncAction.run(() => super.loadBadges());
  }

  late final _$loadEnvironmentalImpactAsyncAction =
      AsyncAction('_RewardsStore.loadEnvironmentalImpact', context: context);

  @override
  Future<void> loadEnvironmentalImpact() {
    return _$loadEnvironmentalImpactAsyncAction
        .run(() => super.loadEnvironmentalImpact());
  }

  late final _$loadRecyclingStreakAsyncAction =
      AsyncAction('_RewardsStore.loadRecyclingStreak', context: context);

  @override
  Future<void> loadRecyclingStreak() {
    return _$loadRecyclingStreakAsyncAction
        .run(() => super.loadRecyclingStreak());
  }

  late final _$loadStreakAsyncAction =
      AsyncAction('_RewardsStore.loadStreak', context: context);

  @override
  Future<void> loadStreak() {
    return _$loadStreakAsyncAction.run(() => super.loadStreak());
  }

  late final _$loadChallengesAsyncAction =
      AsyncAction('_RewardsStore.loadChallenges', context: context);

  @override
  Future<void> loadChallenges() {
    return _$loadChallengesAsyncAction.run(() => super.loadChallenges());
  }

  late final _$loadReferralAsyncAction =
      AsyncAction('_RewardsStore.loadReferral', context: context);

  @override
  Future<void> loadReferral() {
    return _$loadReferralAsyncAction.run(() => super.loadReferral());
  }

  late final _$loadRewardBenefitsAsyncAction =
      AsyncAction('_RewardsStore.loadRewardBenefits', context: context);

  @override
  Future<void> loadRewardBenefits() {
    return _$loadRewardBenefitsAsyncAction
        .run(() => super.loadRewardBenefits());
  }

  late final _$loadReferralRewardAsyncAction =
      AsyncAction('_RewardsStore.loadReferralReward', context: context);

  @override
  Future<void> loadReferralReward() {
    return _$loadReferralRewardAsyncAction
        .run(() => super.loadReferralReward());
  }

  late final _$loadRewardActivityAsyncAction =
      AsyncAction('_RewardsStore.loadRewardActivity', context: context);

  @override
  Future<void> loadRewardActivity() {
    return _$loadRewardActivityAsyncAction
        .run(() => super.loadRewardActivity());
  }

  late final _$loadActivityFeedAsyncAction =
      AsyncAction('_RewardsStore.loadActivityFeed', context: context);

  @override
  Future<void> loadActivityFeed(
      {int limit = 20, int offset = 0, bool append = false}) {
    return _$loadActivityFeedAsyncAction.run(() =>
        super.loadActivityFeed(limit: limit, offset: offset, append: append));
  }

  late final _$loadAllRewardsDataAsyncAction =
      AsyncAction('_RewardsStore.loadAllRewardsData', context: context);

  @override
  Future<void> loadAllRewardsData() {
    return _$loadAllRewardsDataAsyncAction
        .run(() => super.loadAllRewardsData());
  }

  late final _$updateChallengeProgressAsyncAction =
      AsyncAction('_RewardsStore.updateChallengeProgress', context: context);

  @override
  Future<void> updateChallengeProgress(String challengeId, int progress) {
    return _$updateChallengeProgressAsyncAction
        .run(() => super.updateChallengeProgress(challengeId, progress));
  }

  late final _$redeemBenefitAsyncAction =
      AsyncAction('_RewardsStore.redeemBenefit', context: context);

  @override
  Future<void> redeemBenefit(String benefitId) {
    return _$redeemBenefitAsyncAction.run(() => super.redeemBenefit(benefitId));
  }

  late final _$generateReferralCodeAsyncAction =
      AsyncAction('_RewardsStore.generateReferralCode', context: context);

  @override
  Future<String> generateReferralCode() {
    return _$generateReferralCodeAsyncAction
        .run(() => super.generateReferralCode());
  }

  late final _$_RewardsStoreActionController =
      ActionController(name: '_RewardsStore', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$_RewardsStoreActionController.startAction(
        name: '_RewardsStore.clearError');
    try {
      return super.clearError();
    } finally {
      _$_RewardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rewardsOverview: ${rewardsOverview},
activityFeed: ${activityFeed},
streakResponse: ${streakResponse},
badgesResponse: ${badgesResponse},
environmentalImpactResponse: ${environmentalImpactResponse},
challengesResponse: ${challengesResponse},
referralResponse: ${referralResponse},
rewardPoints: ${rewardPoints},
recyclingStreak: ${recyclingStreak},
badges: ${badges},
environmentalImpact: ${environmentalImpact},
challenges: ${challenges},
rewardBenefits: ${rewardBenefits},
referralReward: ${referralReward},
rewardActivity: ${rewardActivity},
isLoading: ${isLoading},
error: ${error},
unlockedBadgesCount: ${unlockedBadgesCount},
totalBadgesCount: ${totalBadgesCount},
earnedBadges: ${earnedBadges},
lockedBadges: ${lockedBadges},
activeChallenges: ${activeChallenges},
completedChallenges: ${completedChallenges},
availableBenefits: ${availableBenefits}
    ''';
  }
}
