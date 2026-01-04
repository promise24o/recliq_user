import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../domain/entities/badge.dart' as rewards;
import '../mobx/rewards_store.dart';

class BadgesSection extends StatelessWidget {
  final RewardsStore rewardsStore;

  const BadgesSection({
    super.key,
    required this.rewardsStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final badgesResponse = rewardsStore.badgesResponse;
        final isLoading = rewardsStore.isLoading;

        if (isLoading || badgesResponse == null) {
          return _buildLoadingState();
        }

        final earnedBadges = badgesResponse.earnedBadges;
        final lockedBadges = badgesResponse.lockedBadges;
        final totalBadges = badgesResponse.totalBadges;

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
                  Text(
                    'Badges & Achievements',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '${earnedBadges.length}/$totalBadges',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Badges Grid - Show earned badges first, then locked badges
              _buildBadgesGrid(earnedBadges, lockedBadges),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBadgesGrid(
      List<rewards.Badge> earnedBadges, List<rewards.Badge> lockedBadges) {
    final allBadges = [...earnedBadges, ...lockedBadges];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1,
      ),
      itemCount: allBadges.length,
      itemBuilder: (context, index) {
        final badge = allBadges[index];
        return _buildBadgeCard(context, badge);
      },
    );
  }

  Widget _buildBadgeCard(BuildContext context, rewards.Badge badge) {
    return GestureDetector(
      onTap: () {
        if (badge.isEarned) {
          _showBadgeDetails(context, badge);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: badge.isEarned
              ? AppTheme.primaryGreen.withOpacity(0.1)
              : AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: badge.isEarned
                ? AppTheme.primaryGreen.withOpacity(0.3)
                : AppTheme.borderSoft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              badge.icon,
              style: TextStyle(
                fontSize: 28.sp,
                color:
                    badge.isEarned ? AppTheme.primaryGreen : AppTheme.textMuted,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              badge.name,
              style: TextStyle(
                color:
                    badge.isEarned ? AppTheme.textPrimary : AppTheme.textMuted,
                fontSize: 9.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (!badge.isEarned) ...[
              SizedBox(height: 2.h),
              Icon(
                Icons.lock,
                size: 10.sp,
                color: AppTheme.textMuted,
              ),
            ],
          ],
        ),
      ),
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
                height: 18.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              Spacer(),
              Container(
                height: 12.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildLoadingGrid(),
        ],
      ),
    );
  }

  Widget _buildLoadingGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceDark,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppTheme.borderSoft),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 10.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBadgeDetails(BuildContext context, rewards.Badge badge) {
    final isEarned = badge.isEarned;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 0.85,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: AppTheme.darkBackground,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
          ),
          child: ListView(
            controller: controller,
            padding: EdgeInsets.all(24.w),
            children: [
              Center(
                child: Container(
                    width: 48.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(8.r))),
              ),
              SizedBox(height: 24.h),
              Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isEarned
                        ? AppTheme.primaryGreen.withOpacity(0.2)
                        : AppTheme.surfaceDark,
                    border: Border.all(
                      color: isEarned
                          ? AppTheme.primaryGreen
                          : AppTheme.borderSoft,
                      width: 3,
                    ),
                    boxShadow: isEarned
                        ? [
                            BoxShadow(
                              color: AppTheme.primaryGreen.withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    badge.icon,
                    style: TextStyle(fontSize: 64.sp),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                badge.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12.h),
              if (isEarned)
                Text(
                  'Achievement Unlocked! 🎉',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.primaryGreen,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceDark,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      badge.description,
                      style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 15.sp,
                          height: 1.5),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'How to Earn',
                      style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      badge.criteria,
                      style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 14.sp,
                          height: 1.4),
                    ),
                  ],
                ),
              ),
              if (isEarned && badge.earnedAt != null) ...[
                SizedBox(height: 20.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                        color: AppTheme.primaryGreen.withOpacity(0.4)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today,
                          color: AppTheme.primaryGreen, size: 18.sp),
                      SizedBox(width: 8.w),
                      Text(
                        'Earned on ${_formatDate(badge.earnedAt!)}',
                        style: TextStyle(
                          color: AppTheme.primaryGreen,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
