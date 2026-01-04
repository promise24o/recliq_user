import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../domain/entities/reward_activity.dart';
import '../mobx/rewards_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActivitySection extends StatelessWidget {
  final RewardsStore rewardsStore;

  const ActivitySection({
    super.key,
    required this.rewardsStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final activities = rewardsStore.activityFeed?.activity ?? [];
        final isLoading = rewardsStore.isLoading;
        final hasMore = rewardsStore.activityFeed?.hasMore ?? false;

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
                      color: Colors.indigo.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      FontAwesomeIcons.history,
                      color: Colors.indigo,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      'Rewards Activity',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (activities.isNotEmpty)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        '${activities.length} Recent',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 16.h),

              // Activity List
              if (isLoading && activities.isEmpty)
                _buildLoadingActivities()
              else if (activities.isEmpty)
                _buildEmptyState()
              else
                Column(
                  children: [
                    ...activities
                        .map((activity) => _buildActivityItem(activity)),
                    if (hasMore) _buildLoadMoreButton(),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActivityItem(RewardActivity activity) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: _getActivityColor(activity.type).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              _getActivityIcon(activity.type),
              color: _getActivityColor(activity.type),
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.description,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      '+${activity.points} points',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '•',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      _formatDate(activity.date),
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingActivities() {
    return Column(
      children: List.generate(
          5,
          (index) => Container(
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceDark,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppTheme.borderSoft),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                        color: AppTheme.borderSoft,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 14.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: AppTheme.borderSoft,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            height: 12.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: AppTheme.borderSoft,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 20.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: AppTheme.borderSoft,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }

  Widget _buildEmptyState() {
    return const EmptyStateWidget(
      imagePath: ImagePaths.noResult,
      title: 'No recent activity',
      description:
          'Start recycling to earn points and build your rewards history!',
    );
  }

  Widget _buildLoadMoreButton() {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      child: ElevatedButton(
        onPressed: rewardsStore.isLoading
            ? null
            : () {
                final currentLength =
                    rewardsStore.activityFeed?.activity.length ?? 0;
                rewardsStore.loadActivityFeed(
                  limit: 20,
                  offset: currentLength,
                  append: true,
                );
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryGreen,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: rewardsStore.isLoading
            ? SizedBox(
                width: 16.w,
                height: 16.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text('Load More'),
      ),
    );
  }

  IconData _getActivityIcon(ActivityType type) {
    switch (type) {
      case ActivityType.recyle:
        return FontAwesomeIcons.recycle;
      case ActivityType.streak:
        return FontAwesomeIcons.fire;
      case ActivityType.badge:
        return FontAwesomeIcons.medal;
      case ActivityType.challenge:
        return FontAwesomeIcons.trophy;
      case ActivityType.referral:
        return FontAwesomeIcons.userFriends;
      default:
        return FontAwesomeIcons.gift;
    }
  }

  Color _getActivityColor(ActivityType type) {
    switch (type) {
      case ActivityType.recyle:
        return Colors.blue;
      case ActivityType.streak:
        return Colors.orange;
      case ActivityType.badge:
        return Colors.amber;
      case ActivityType.challenge:
        return Colors.purple;
      case ActivityType.referral:
        return Colors.green;
      default:
        return Colors.green;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Just now';
        }
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
