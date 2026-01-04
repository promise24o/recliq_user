import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../domain/entities/referral_response.dart';
import '../mobx/rewards_store.dart';

class ReferralSection extends StatefulWidget {
  final RewardsStore rewardsStore;
  final VoidCallback onGenerateReferralCode;

  const ReferralSection({
    super.key,
    required this.rewardsStore,
    required this.onGenerateReferralCode,
  });

  @override
  State<ReferralSection> createState() => _ReferralSectionState();
}

class _ReferralSectionState extends State<ReferralSection> {
  bool _isRedeeming = false;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final referralResponse = widget.rewardsStore.referralResponse;
        final isLoading = widget.rewardsStore.isLoading;

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
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      FontAwesomeIcons.userFriends,
                      color: Colors.blue,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      'Referral Program',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (referralResponse?.totalReferrals != null)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        '${referralResponse!.totalReferrals} Referrals',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 16.h),

              // Content
              if (isLoading)
                _buildLoadingState()
              else if (referralResponse == null ||
                  referralResponse.recentReferrals.isEmpty)
                _buildEmptyState()
              else
                _buildReferralContent(context, referralResponse),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReferralContent(
      BuildContext context, ReferralResponse referralResponse) {
    return Column(
      children: [
        // Summary cards
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.blue.withOpacity(0.2)),
                ),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.users,
                      color: Colors.blue,
                      size: 20.sp,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '${referralResponse.totalReferrals}',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Total Referrals',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                  border:
                      Border.all(color: AppTheme.primaryGreen.withOpacity(0.2)),
                ),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.coins,
                      color: AppTheme.primaryGreen,
                      size: 20.sp,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '${referralResponse.pointsEarned}',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Points Earned',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.purple.withOpacity(0.2)),
                ),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.gift,
                      color: Colors.purple,
                      size: 20.sp,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '0',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Points Redeemed',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // Recent referrals list
        Text(
          'Recent Referrals',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        ...referralResponse.recentReferrals.map(
          (referral) => _buildReferralItem(context, referral),
        ),
        SizedBox(height: 16.h),
        // Redeem Points button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _showRedeemAllDialog(context, referralResponse!);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryGreen,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Redeem All Completed Referrals',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReferralItem(BuildContext context, ReferralItem referral) {
    final isRedeemable = referral.status == 'completed';

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
              color: referral.status == 'completed'
                  ? Colors.green.withOpacity(0.1)
                  : Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              referral.status == 'completed'
                  ? FontAwesomeIcons.checkCircle
                  : FontAwesomeIcons.clock,
              color:
                  referral.status == 'completed' ? Colors.green : Colors.orange,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        referral.name,
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    if (isRedeemable) ...[
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          'Redeemable',
                          style: TextStyle(
                            color: AppTheme.primaryGreen,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    if (referral.status == 'completed') ...[
                      Text(
                        '+${referral.points} points',
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
                        'Completed',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Pending',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  _formatDate(referral.createdAt),
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
          if (isRedeemable)
            IconButton(
              onPressed: () {
                _showRedeemDialog(context, referral);
              },
              icon: Icon(
                FontAwesomeIcons.coins,
                color: AppTheme.primaryGreen,
                size: 20.sp,
              ),
              tooltip: 'Redeem Points',
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const EmptyStateWidget(
      imagePath: ImagePaths.noResult,
      title: 'No Referrals Yet',
      description: 'Invite friends to join Recliq and earn bonus points!',
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: [
        // Loading header
        Row(
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
                    height: 18.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: AppTheme.borderSoft,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    height: 14.h,
                    width: 100.w,
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
        // Loading stats
        Row(
          children: [
            Expanded(
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ),
      ],
    );
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

  void _showRedeemDialog(BuildContext context, ReferralItem referral) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => LoadingOverlay(
          isVisible: _isRedeeming,
          message: 'Redeeming points...',
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppTheme.surfaceDark,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppTheme.borderSoft,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header with icon
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Icon(
                      FontAwesomeIcons.coins,
                      color: AppTheme.primaryGreen,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Title
                  Text(
                    'Redeem Referral Points',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // Content
                  Text(
                    'Are you sure you want to redeem ${referral.points} points from ${referral.name}\'s referral?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14.sp,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Points info
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppTheme.primaryGreen.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.gift,
                          color: AppTheme.primaryGreen,
                          size: 16.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'You will receive ${referral.points} Recliq Points',
                            style: TextStyle(
                              color: AppTheme.primaryGreen,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48.h,
                          child: TextButton(
                            onPressed: _isRedeeming
                                ? null
                                : () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: AppTheme.textSecondary,
                              side: BorderSide(
                                color: AppTheme.borderSoft,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: SizedBox(
                          height: 48.h,
                          child: ElevatedButton(
                            onPressed: _isRedeeming
                                ? null
                                : () async {
                                    setState(() => _isRedeeming = true);
                                    Navigator.of(context).pop();
                                    _redeemReferral(context, [referral.id]);
                                    setState(() => _isRedeeming = false);
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryGreen,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: _isRedeeming
                                ? SizedBox(
                                    width: 20.w,
                                    height: 20.w,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'Redeem',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showRedeemAllDialog(
      BuildContext context, ReferralResponse referralResponse) {
    final completedReferrals = referralResponse.recentReferrals
        .where((r) => r.status == 'completed')
        .toList();

    // if (completedReferrals.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('No completed referrals to redeem!'),
    //       backgroundColor: Colors.orange,
    //     ),
    //   );
    //   return;
    // }

    final totalPoints = completedReferrals.fold<int>(
        0, (sum, referral) => sum + referral.points);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => LoadingOverlay(
          isVisible: _isRedeeming,
          message: 'Redeeming points...',
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppTheme.surfaceDark,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppTheme.borderSoft,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header with icon
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Icon(
                      FontAwesomeIcons.coins,
                      color: AppTheme.primaryGreen,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Title
                  const Text(
                    'Redeem All Completed Referrals',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // Content
                  Text(
                    'You have ${completedReferrals.length} completed referrals worth $totalPoints points. Redeem all?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Points info
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppTheme.primaryGreen.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.gift,
                          color: AppTheme.primaryGreen,
                          size: 16.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'You will receive $totalPoints Recliq Points',
                            style: TextStyle(
                              color: AppTheme.primaryGreen,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48.h,
                          child: TextButton(
                            onPressed: _isRedeeming
                                ? null
                                : () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: AppTheme.textSecondary,
                              side: BorderSide(
                                color: AppTheme.borderSoft,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: SizedBox(
                          height: 48.h,
                          child: ElevatedButton(
                            onPressed: _isRedeeming
                                ? null
                                : () async {
                                    setState(() => _isRedeeming = true);
                                    Navigator.of(context).pop();
                                    final referralIds = completedReferrals
                                        .map((r) => r.id)
                                        .toList();
                                    _redeemReferral(context, referralIds);
                                    setState(() => _isRedeeming = false);
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryGreen,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: _isRedeeming
                                ? SizedBox(
                                    width: 20.w,
                                    height: 20.w,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'Redeem All',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _redeemReferral(BuildContext context, List<String> referralIds) {
    // TODO: Implement actual API call to redeem referrals
    // For now, show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Successfully redeemed ${referralIds.length} referral(s)!'),
        backgroundColor: AppTheme.primaryGreen,
      ),
    );
  }
}
