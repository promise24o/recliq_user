import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../mobx/rewards_store.dart';

class EnvironmentalImpactSection extends StatelessWidget {
  final RewardsStore rewardsStore;

  const EnvironmentalImpactSection({
    super.key,
    required this.rewardsStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final environmentalImpactResponse =
            rewardsStore.environmentalImpactResponse;
        final isLoading = rewardsStore.isLoading;

        if (isLoading || environmentalImpactResponse == null) {
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
              // Header
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      FontAwesomeIcons.leaf,
                      color: Colors.green,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      'Environmental Impact',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      environmentalImpactResponse.carbonScore,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // Impact Metrics
              Row(
                children: [
                  Expanded(
                    child: _buildImpactCard(
                      icon: FontAwesomeIcons.recycle,
                      title: 'Waste Recycled',
                      value:
                          '${environmentalImpactResponse.wasteRecycledKg.toStringAsFixed(1)} kg',
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildImpactCard(
                      icon: FontAwesomeIcons.cloud,
                      title: 'CO₂ Saved',
                      value:
                          '${environmentalImpactResponse.co2SavedKg.toStringAsFixed(1)} kg',
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              Row(
                children: [
                  Expanded(
                    child: _buildImpactCard(
                      icon: FontAwesomeIcons.tree,
                      title: 'Trees Equivalent',
                      value: '${environmentalImpactResponse.treesEquivalent}',
                      color: Colors.green.shade700,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildImpactCard(
                      icon: FontAwesomeIcons.tint,
                      title: 'Water Saved',
                      value: '${environmentalImpactResponse.waterSaved}L',
                      color: Colors.blue.shade400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              Row(
                children: [
                  Expanded(
                    child: _buildImpactCard(
                      icon: FontAwesomeIcons.bolt,
                      title: 'Energy Saved',
                      value: '${environmentalImpactResponse.energySaved} kWh',
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildImpactCard(
                      icon: FontAwesomeIcons.landmark,
                      title: 'Landfill Saved',
                      value:
                          '${environmentalImpactResponse.landfillSpaceSaved} m³',
                      color: Colors.brown.shade400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Impact Message
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.green.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.green,
                      size: 16.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'Your recycling efforts are making a real difference for the environment!',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
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

  Widget _buildImpactCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24.sp,
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
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
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  FontAwesomeIcons.leaf,
                  color: Colors.green,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Container(
                  height: 18.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: AppTheme.borderSoft,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _buildLoadingCard(),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildLoadingCard(),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _buildLoadingCard(),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildLoadingCard(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Column(
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: AppTheme.borderSoft,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 16.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: AppTheme.borderSoft,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 4.h),
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
  }
}
