import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../domain/entities/reward_benefit.dart';
import '../../domain/entities/reward_points.dart';

class RewardsBenefitsSection extends StatelessWidget {
  final List<RewardBenefit> benefits;
  final RewardPoints? rewardPoints;
  final bool isLoading;
  final Function(String benefitId) onBenefitRedeemed;

  const RewardsBenefitsSection({
    super.key,
    required this.benefits,
    required this.rewardPoints,
    required this.isLoading,
    required this.onBenefitRedeemed,
  });

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  FontAwesomeIcons.gift,
                  color: Colors.amber,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  'Rewards & Benefits',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (rewardPoints != null)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${rewardPoints!.totalPoints} pts',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 16.h),

          // Benefits List
          if (!isLoading)
            _buildLoadingBenefits()
          else if (benefits.isEmpty)
            _buildEmptyState()
          else
            ...benefits.map((benefit) => _buildBenefitCard(benefit)),
        ],
      ),
    );
  }

  Widget _buildBenefitCard(RewardBenefit benefit) {
    final canAfford = rewardPoints != null &&
        rewardPoints!.totalPoints >= benefit.pointsRequired;
    final isAvailable = benefit.isAvailable && canAfford;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color:
              isAvailable ? Colors.amber.withOpacity(0.3) : AppTheme.borderSoft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: isAvailable
                      ? Colors.amber.withOpacity(0.1)
                      : AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  benefit.icon,
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: isAvailable ? Colors.amber : AppTheme.textMuted,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      benefit.title,
                      style: TextStyle(
                        color: isAvailable
                            ? AppTheme.textPrimary
                            : AppTheme.textMuted,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      benefit.description,
                      style: TextStyle(
                        color: isAvailable
                            ? AppTheme.textSecondary
                            : AppTheme.textMuted,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Footer with points and action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.coins,
                    color: isAvailable ? Colors.amber : AppTheme.textMuted,
                    size: 12.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${benefit.pointsRequired} points',
                    style: TextStyle(
                      color: isAvailable ? Colors.amber : AppTheme.textMuted,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              if (!benefit.isAvailable)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    'Unavailable',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              else if (!canAfford)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    'Insufficient Points',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              else
                GestureDetector(
                  onTap: () => onBenefitRedeemed(benefit.id),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.amber.withOpacity(0.3)),
                    ),
                    child: Text(
                      'Redeem',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingBenefits() {
    return Column(
      children: List.generate(
          3,
          (index) => Container(
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
                    Row(
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.w,
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
                                height: 16.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  color: AppTheme.borderSoft,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Container(
                                height: 12.h,
                                width: 180.w,
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
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 12.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: AppTheme.borderSoft,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        Container(
                          height: 20.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: AppTheme.borderSoft,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        children: [
          Icon(
            FontAwesomeIcons.gift,
            color: AppTheme.textMuted,
            size: 48.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            'No rewards available',
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Check back soon for new rewards!',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
