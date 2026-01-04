import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../../shared/widgets/custom_button.dart';
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
                      '${referralResponse.pointsRedeemed}',
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
        // Redeem Points button - only show if there are points to redeem
        if (referralResponse.pointsEarned > referralResponse.pointsRedeemed)
          AppButton(
            label: 'Redeem All Completed Referrals',
            onPressed: () {
              _showRedeemAllDialog(context, referralResponse!);
            },
            backgroundColor: AppTheme.primaryGreen,
            color: Colors.white,
            width: double.infinity,
          ),
      ],
    );
  }

  Widget _buildReferralItem(BuildContext context, ReferralItem referral) {
    final status = referral.status.toLowerCase();
    final isCompleted = status == 'completed';
    final isRedeemed = status == 'redeemed';
    final isCancelled = status == 'cancelled';
    final isPending = status == 'pending';

    Color backgroundColor;
    Color accentColor;
    IconData statusIcon;

    switch (status) {
      case 'completed':
        backgroundColor = Colors.green.withOpacity(0.1);
        accentColor = Colors.green;
        statusIcon = FontAwesomeIcons.checkCircle;
        break;
      case 'redeemed':
        backgroundColor = AppTheme.primaryGreen.withOpacity(0.15);
        accentColor = AppTheme.primaryGreen;
        statusIcon = FontAwesomeIcons.coins;
        break;
      case 'cancelled':
        backgroundColor = Colors.red.withOpacity(0.1);
        accentColor = Colors.red;
        statusIcon = FontAwesomeIcons.ban;
        break;
      case 'pending':
      default:
        backgroundColor = Colors.orange.withOpacity(0.1);
        accentColor = Colors.orange;
        statusIcon = FontAwesomeIcons.clock;
        break;
    }

    final bool showRedeemButton = isCompleted || isRedeemed;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.borderSoft),
        boxShadow: isRedeemed
            ? [
                BoxShadow(
                  color: AppTheme.primaryGreen.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      child: Row(
        children: [
          // Status Icon
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              statusIcon,
              color: accentColor,
              size: 28.sp,
            ),
          ),
          SizedBox(width: 16.w),

          // Details - Now wrapped in Expanded to prevent overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Status Badge Row
                Row(
                  children: [
                    // Referral name - takes available space
                    Expanded(
                      child: Text(
                        referral.name,
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    // Status badge (only one shown at a time)
                    if (isCompleted || isRedeemed || isCancelled)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: switch (status) {
                            'completed' => Colors.green.withOpacity(0.15),
                            'redeemed' =>
                              AppTheme.primaryGreen.withOpacity(0.2),
                            'cancelled' => Colors.red.withOpacity(0.15),
                            _ => Colors.transparent,
                          },
                          borderRadius: BorderRadius.circular(12.r),
                          border: status == 'completed'
                              ? Border.all(color: Colors.green.withOpacity(0.4))
                              : null,
                        ),
                        child: Text(
                          switch (status) {
                            'completed' => 'Redeemable',
                            'redeemed' => 'Redeemed',
                            'cancelled' => 'Cancelled',
                            _ => '',
                          },
                          style: TextStyle(
                            color: switch (status) {
                              'completed' => Colors.green,
                              'redeemed' => AppTheme.primaryGreen,
                              'cancelled' => Colors.red,
                              _ => Colors.transparent,
                            },
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8.h),

                // Points & Status Text Row - no wrapper needed
                Row(
                  children: [
                    if (referral.points != null &&
                        (isCompleted || isRedeemed)) ...[
                      Flexible(
                        child: Text(
                          '+${referral.points} points',
                          style: TextStyle(
                            color: isRedeemed
                                ? AppTheme.primaryGreen
                                : Colors.green,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '•',
                        style: TextStyle(
                            color: AppTheme.textMuted, fontSize: 14.sp),
                      ),
                      SizedBox(width: 8.w),
                    ],
                    Flexible(
                      child: Text(
                        switch (status) {
                          'completed' => 'Completed',
                          'redeemed' => 'Points Redeemed',
                          'cancelled' => 'Cancelled',
                          'pending' => 'Pending',
                          _ => 'Unknown',
                        },
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),

                // Date
                Text(
                  _formatDate(referral.createdAt),
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 11.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),

          // Redeem Button (only for completed/redeemed)
          if (showRedeemButton)
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: IconButton(
                onPressed: isRedeemed
                    ? null
                    : () => _showRedeemDialog(context, referral),
                icon: Icon(
                  FontAwesomeIcons.gift,
                  color:
                      isRedeemed ? AppTheme.textMuted : AppTheme.primaryGreen,
                  size: 22.sp,
                ),
                tooltip: isRedeemed ? 'Already Redeemed' : 'Redeem Points',
              ),
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
                        child: SecondaryButton(
                          label: 'Cancel',
                          onPressed: _isRedeeming
                              ? null
                              : () => Navigator.of(context).pop(),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: AppButton(
                          label: 'Redeem',
                          loading: _isRedeeming,
                          onPressed: _isRedeeming
                              ? null
                              : () async {
                                  setState(() => _isRedeeming = true);
                                  Navigator.of(context).pop();
                                  _redeemReferral(context, [referral.id]);
                                  setState(() => _isRedeeming = false);
                                },
                          backgroundColor: AppTheme.primaryGreen,
                          color: Colors.white,
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
                        child: SecondaryButton(
                          label: 'Cancel',
                          onPressed: _isRedeeming
                              ? null
                              : () => Navigator.of(context).pop(),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: AppButton(
                          label: 'Redeem All',
                          loading: _isRedeeming,
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
                          backgroundColor: AppTheme.primaryGreen,
                          color: Colors.white,
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

  void _redeemReferral(BuildContext context, List<String> referralIds) async {
    final result = await widget.rewardsStore.redeemReferral(referralIds);

    if (result != null) {
      // Successfully redeemed, the store already shows success toast
      // and refreshes the referral list
    }
  }
}
