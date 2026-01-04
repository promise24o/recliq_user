import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../mobx/rewards_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RecyclingStreakSection extends StatelessWidget {
  final RewardsStore rewardsStore;

  const RecyclingStreakSection({
    super.key,
    required this.rewardsStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final streakResponse = rewardsStore.streakResponse;
        final isLoading = rewardsStore.isLoading;

        if (isLoading || streakResponse == null) {
          return _buildLoadingState();
        }

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
              // Header with current streak
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      FontAwesomeIcons.fire,
                      color: Colors.orange,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${streakResponse.currentStreakWeeks} Week Streak',
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Best: ${streakResponse.bestStreakWeeks} weeks',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (streakResponse.isActive)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Active',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 16.h),

              // Weekly activity
              Text(
                'Weekly Activity',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12.h),

              // Days of week
              Row(
                children: [
                  _buildDayOfWeek('S', streakResponse.weeklyActivity.sun),
                  SizedBox(width: 8.w),
                  _buildDayOfWeek('M', streakResponse.weeklyActivity.mon),
                  SizedBox(width: 8.w),
                  _buildDayOfWeek('T', streakResponse.weeklyActivity.tue),
                  SizedBox(width: 8.w),
                  _buildDayOfWeek('W', streakResponse.weeklyActivity.wed),
                  SizedBox(width: 8.w),
                  _buildDayOfWeek('T', streakResponse.weeklyActivity.thu),
                  SizedBox(width: 8.w),
                  _buildDayOfWeek('F', streakResponse.weeklyActivity.fri),
                  SizedBox(width: 8.w),
                  _buildDayOfWeek('S', streakResponse.weeklyActivity.sat),
                ],
              ),

              SizedBox(height: 16.h),

              // Streak countdown
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: streakResponse.daysUntilBreak <= 1
                      ? Colors.red.withOpacity(0.1)
                      : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      color: streakResponse.daysUntilBreak <= 1
                          ? Colors.red
                          : Colors.orange,
                      size: 16.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      streakResponse.daysUntilBreak == 1
                          ? '1 day until streak breaks!'
                          : '${streakResponse.daysUntilBreak} days until streak breaks',
                      style: TextStyle(
                        color: streakResponse.daysUntilBreak <= 1
                            ? Colors.red
                            : Colors.orange,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDayOfWeek(String day, bool isActive) {
    return Expanded(
      child: Container(
        height: 32.h,
        decoration: BoxDecoration(
          color: isActive
              ? Colors.orange.withOpacity(0.2)
              : AppTheme.borderSoft.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isActive ? Colors.orange : AppTheme.borderSoft,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: isActive ? Colors.orange : AppTheme.textMuted,
              fontSize: 12.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
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
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  FontAwesomeIcons.fire,
                  color: Colors.orange,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 18.h,
                      width: 120.w,
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
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            height: 14.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppTheme.borderSoft,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: List.generate(
                7,
                (index) => Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppTheme.borderSoft,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
