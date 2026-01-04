import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../mobx/rewards_store.dart';

class ChallengesSection extends StatelessWidget {
  final RewardsStore rewardsStore;

  const ChallengesSection({
    super.key,
    required this.rewardsStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final challengesResponse = rewardsStore.challengesResponse;
        final isLoading = rewardsStore.isLoading;

        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppTheme.surfaceDark,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppTheme.borderSoft),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      FontAwesomeIcons.bullseye,
                      color: Colors.purple,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      'Challenges & Milestones',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (challengesResponse?.activeChallenges.isNotEmpty ?? false)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        '${challengesResponse!.activeChallenges.length} Active',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 16.h),

              // Challenges List
              if (isLoading)
                _buildLoadingState()
              else if (challengesResponse == null ||
                  (challengesResponse.activeChallenges.isEmpty &&
                      challengesResponse.completedChallenges.isEmpty))
                _buildEmptyState()
              else
                Column(
                  children: [
                    // Active Challenges
                    if (challengesResponse.activeChallenges.isNotEmpty) ...[
                      Text(
                        'Active Challenges',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      ...challengesResponse.activeChallenges.map(
                        (challenge) =>
                            _buildChallengeCard(challenge, isCompleted: false),
                      ),
                      SizedBox(height: 16.h),
                    ],

                    // Completed Challenges
                    if (challengesResponse.completedChallenges.isNotEmpty) ...[
                      Text(
                        'Completed Challenges',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      ...challengesResponse.completedChallenges.map(
                        (challenge) =>
                            _buildChallengeCard(challenge, isCompleted: true),
                      ),
                    ],
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return const EmptyStateWidget(
      imagePath: ImagePaths.noResult,
      title: 'No Challenges Available',
      description: 'Check back later for new challenges to earn bonus points!',
    );
  }

  Widget _buildLoadingState() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  FontAwesomeIcons.bullseye,
                  color: Colors.purple,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  'Challenges & Milestones',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ...List.generate(3, (index) => _buildLoadingChallengeCard()),
        ],
      ),
    );
  }

  Widget _buildLoadingChallengeCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppTheme.borderSoft,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            height: 12.h,
            decoration: BoxDecoration(
              color: AppTheme.borderSoft,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            height: 8.h,
            decoration: BoxDecoration(
              color: AppTheme.borderSoft,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeCard(dynamic challenge, {required bool isCompleted}) {
    final challengeItem = challenge as dynamic;
    final progress = isCompleted ? 1.0 : (challengeItem.percent / 100.0);
    final daysLeft = isCompleted ? 0 : challengeItem.daysLeft;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color:
            isCompleted ? Colors.green.withOpacity(0.05) : AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color:
              isCompleted ? Colors.green.withOpacity(0.3) : AppTheme.borderSoft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      challengeItem.title,
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      challengeItem.description,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isCompleted && daysLeft > 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: daysLeft <= 3
                        ? Colors.red.withOpacity(0.1)
                        : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '$daysLeft days left',
                    style: TextStyle(
                      color: daysLeft <= 3 ? Colors.red : Colors.orange,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (isCompleted)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.check,
                        color: Colors.green,
                        size: 12.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Completed',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${challengeItem.progress.toStringAsFixed(1)} / ${challengeItem.target} kg',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '${challengeItem.percent}%',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: AppTheme.borderSoft,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        isCompleted ? Colors.green : AppTheme.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: (isCompleted ? Colors.green : AppTheme.primaryGreen)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.coins,
                      color: isCompleted ? Colors.green : AppTheme.primaryGreen,
                      size: 12.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '+${challengeItem.pointsReward}',
                      style: TextStyle(
                        color:
                            isCompleted ? Colors.green : AppTheme.primaryGreen,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
