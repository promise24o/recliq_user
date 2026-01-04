import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/app_header.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../mobx/rewards_store.dart';
import '../widgets/rewards_overview_section.dart';
import '../widgets/recycling_streak_section.dart';
import '../widgets/badges_section.dart';
import '../widgets/environmental_impact_section.dart';
import '../widgets/challenges_section.dart';
import '../widgets/rewards_benefits_section.dart';
import '../widgets/referral_section.dart';
import '../widgets/activity_section.dart';
import '../../../../core/di/service_locator.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  late RewardsStore _rewardsStore;
  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _rewardsStore = getIt<RewardsStore>();
    _loadData();

    _disposer = reaction(
      (_) => _rewardsStore.error,
      (String? error) {
        if (error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: AppTheme.danger,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  Future<void> _loadData() async {
    await Future.wait([
      _rewardsStore.loadRewardsOverview(),
      _rewardsStore.loadActivityFeed(),
      _rewardsStore.loadStreak(),
      _rewardsStore.loadBadges(),
      _rewardsStore.loadEnvironmentalImpact(),
      _rewardsStore.loadChallenges(),
      _rewardsStore.loadReferral(),
    ]);
  }

  Future<void> _refreshData() async {
    await _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          color: AppTheme.primaryGreen,
          child: Observer(
            builder: (context) {
              return LoadingOverlay(
                isVisible: _rewardsStore.isLoading,
                child: Column(
                  children: [
                    AppHeader(
                      title: 'Rewards',
                      subtitle: 'Earn points & make an impact',
                      showBackButton: true,
                      onLeadingTap: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Rewards Overview Section
                            RewardsOverviewSection(
                              rewardsOverview: _rewardsStore.rewardsOverview,
                              isLoading: _rewardsStore.isLoading,
                            ),

                            SizedBox(height: 24.h),

                            // Recycling Streaks Section
                            RecyclingStreakSection(
                              rewardsStore: _rewardsStore,
                            ),

                            SizedBox(height: 24.h),

                            // Badges & Achievements Section
                            BadgesSection(
                              rewardsStore: _rewardsStore,
                            ),

                            SizedBox(height: 24.h),

                            // Environmental Impact Section
                            EnvironmentalImpactSection(
                              rewardsStore: _rewardsStore,
                            ),

                            SizedBox(height: 24.h),

                            // Challenges & Milestones Section
                            ChallengesSection(
                              rewardsStore: _rewardsStore,
                            ),

                            SizedBox(height: 24.h),

                            // Rewards & Benefits Section
                            // RewardsBenefitsSection(
                            //   benefits: _rewardsStore.availableBenefits,
                            //   rewardPoints: _rewardsStore.rewardPoints,
                            //   isLoading: _rewardsStore.isLoading,
                            //   onBenefitRedeemed: (benefitId) {
                            //     _rewardsStore.redeemBenefit(benefitId);
                            //   },
                            // ),

                            SizedBox(height: 24.h),

                            // Referral Rewards Section
                            ReferralSection(
                              rewardsStore: _rewardsStore,
                              onGenerateReferralCode: () async {
                                final code =
                                    await _rewardsStore.generateReferralCode();
                                if (code.isNotEmpty) {
                                  // Show referral code dialog or copy to clipboard
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Referral code: $code'),
                                      backgroundColor: AppTheme.primaryGreen,
                                    ),
                                  );
                                }
                              },
                            ),

                            SizedBox(height: 24.h),

                            // Rewards Activity Section
                            ActivitySection(
                              rewardsStore: _rewardsStore,
                            ),

                            SizedBox(height: 40.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
