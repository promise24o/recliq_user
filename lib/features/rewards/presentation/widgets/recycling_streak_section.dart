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
    return Observer(builder: (_) {
      final data = rewardsStore.streakResponse;
      if (rewardsStore.isLoading || data == null) {
        return const SizedBox.shrink();
      }

      return Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppTheme.borderSoft),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFA726).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Icon(
                    FontAwesomeIcons.fire,
                    color: const Color(0xFFFFA726),
                    size: 22.sp,
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recycling Streak',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${data.currentStreakWeeks}-week streak',
                        style: TextStyle(
                          color: const Color(0xFFFFA726),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2F3F),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Best: ${data.bestStreakWeeks}',
                    style: TextStyle(
                      color: const Color(0xFFFFA726),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 22.h),

            /// WEEKLY ACTIVITY
            Text(
              'Weekly Activity',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _day('Mon', data.weeklyActivity.mon)),
                Expanded(child: _day('Tue', data.weeklyActivity.tue)),
                Expanded(child: _day('Wed', data.weeklyActivity.wed)),
                Expanded(child: _day('Thu', data.weeklyActivity.thu)),
                Expanded(child: _day('Fri', data.weeklyActivity.fri)),
                Expanded(child: _day('Sat', data.weeklyActivity.sat)),
                Expanded(child: _day('Sun', data.weeklyActivity.sun)),
              ],
            ),

            SizedBox(height: 20.h),

            /// INFO BOX
            Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2333),
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(
                  color: const Color(0xFF2E3448),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 26.w,
                    height: 26.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A7C6F),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.info,
                      size: 16.sp,
                      color: const Color(0xFF7DE3C2),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      'Recycle at least once a week to keep your streak alive',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12.sp,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _day(String label, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: active ? const Color(0xFFFFA726) : const Color(0xFF2C2F3F),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: active
              ? Icon(
                  FontAwesomeIcons.fire,
                  color: Colors.white,
                  size: 18.sp,
                )
              : null,
        ),
      ],
    );
  }
}
