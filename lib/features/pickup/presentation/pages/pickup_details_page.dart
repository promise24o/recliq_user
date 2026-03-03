import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/app_header.dart';
import '../../../profile/presentation/mobx/profile_store.dart';
import '../../domain/entities/pickup_request.dart';
import '../mobx/pickup_store.dart';

class PickupDetailsPage extends StatefulWidget {
  final PickupRequest pickup;

  const PickupDetailsPage({
    super.key,
    required this.pickup,
  });

  @override
  State<PickupDetailsPage> createState() => _PickupDetailsPageState();
}

class _PickupDetailsPageState extends State<PickupDetailsPage>
    with TickerProviderStateMixin {
  final _profileStore = GetIt.instance<ProfileStore>();
  final _pickupStore = GetIt.instance<PickupStore>();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
    
    // Load tracking data if pickup is active
    if (_shouldShowTracking()) {
      _loadTrackingData();
    }
  }

  bool _shouldShowTracking() {
    return widget.pickup.status == 'assigned' ||
           widget.pickup.status == 'agent_en_route' ||
           widget.pickup.status == 'arrived';
  }

  Future<void> _loadTrackingData() async {
    if (!_shouldShowTracking()) return;
    await _pickupStore.loadTrackingLocation(widget.pickup.id);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'completed':
        return AppTheme.success;
      case 'cancelled':
      case 'failed':
        return AppTheme.danger;
      case 'pending_acceptance':
      case 'assigned':
      case 'agent_en_route':
        return AppTheme.info;
      case 'arrived':
        return AppTheme.warning;
      default:
        return AppTheme.textMuted;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'completed':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      case 'failed':
        return Icons.error;
      case 'pending_acceptance':
        return Icons.pending;
      case 'assigned':
        return Icons.person_pin;
      case 'agent_en_route':
        return Icons.directions_car;
      case 'arrived':
        return Icons.location_on;
      default:
        return Icons.hourglass_empty;
    }
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'new':
        return 'New';
      case 'matching':
        return 'Finding Agent';
      case 'pending_acceptance':
        return 'Pending Acceptance';
      case 'assigned':
        return 'Agent Assigned';
      case 'agent_en_route':
        return 'Agent En Route';
      case 'arrived':
        return 'Agent Arrived';
      case 'completed':
        return 'Completed';
      case 'cancelled':
        return 'Cancelled';
      case 'failed':
        return 'Failed';
      default:
        return status;
    }
  }

  String _wasteLabel(String type) {
    switch (type) {
      case 'plastic':
        return 'Plastic';
      case 'paper':
        return 'Paper';
      case 'metal':
        return 'Metal';
      case 'glass':
        return 'Glass';
      case 'organic':
        return 'Organic';
      case 'e_waste':
        return 'E-Waste';
      case 'mixed':
        return 'Mixed';
      default:
        return type;
    }
  }

  IconData _wasteIcon(String type) {
    switch (type) {
      case 'plastic':
        return Icons.local_drink;
      case 'paper':
        return Icons.description;
      case 'metal':
        return Icons.hardware;
      case 'glass':
        return Icons.wine_bar;
      case 'organic':
        return Icons.eco;
      case 'e_waste':
        return Icons.devices;
      case 'mixed':
        return Icons.recycling;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              // Header
              _buildHeader(),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status Card
                      _buildStatusCard(),
                      SizedBox(height: 24.h),

                      // Pickup Details
                      _buildSectionTitle('Pickup Details'),
                      SizedBox(height: 16.h),
                      _buildPickupDetails(),
                      SizedBox(height: 24.h),

                      // Map Tracking (if active)
                      if (_shouldShowTracking()) ...[
                        _buildSectionTitle('Live Tracking'),
                        SizedBox(height: 16.h),
                        _buildTrackingMap(),
                        SizedBox(height: 24.h),
                      ],

                      // Agent Details (if assigned)
                      if (widget.pickup.assignedAgentId != null) ...[
                        _buildSectionTitle('Agent Details'),
                        SizedBox(height: 16.h),
                        _buildAgentDetails(),
                        SizedBox(height: 24.h),
                      ],

                      // Pricing Details
                      _buildSectionTitle('Pricing'),
                      SizedBox(height: 16.h),
                      _buildPricingDetails(),
                      SizedBox(height: 24.h),

                      // Timeline
                      _buildSectionTitle('Timeline'),
                      SizedBox(height: 16.h),
                      _buildTimeline(),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return AppHeader(
      title: 'Pickup Details',
      subtitle: 'Request #${widget.pickup.id.substring(0, 8).toUpperCase()}',
      showBackButton: true,
      showNotificationBell: false,
      onLeadingTap: () => Navigator.pop(context),
      profileStore: _profileStore,
    );
  }

  Widget _buildStatusCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _statusColor(widget.pickup.status).withOpacity(0.1),
            _statusColor(widget.pickup.status).withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: _statusColor(widget.pickup.status).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: _statusColor(widget.pickup.status).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _statusIcon(widget.pickup.status),
              color: _statusColor(widget.pickup.status),
              size: 28.w,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            _statusLabel(widget.pickup.status),
            style: TextStyle(
              color: _statusColor(widget.pickup.status),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Request ID: ${widget.pickup.id.substring(0, 8).toUpperCase()}',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppTheme.textSecondary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildPickupDetails() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Column(
        children: [
          _buildDetailRow(
            icon: Icons.category,
            label: 'Waste Type',
            value: _wasteLabel(widget.pickup.wasteType),
            valueIcon: _wasteIcon(widget.pickup.wasteType),
          ),
          SizedBox(height: 16.h),
          _buildDetailRow(
            icon: Icons.scale,
            label: 'Estimated Weight',
            value: '${widget.pickup.estimatedWeight} kg',
          ),
          SizedBox(height: 16.h),
          _buildDetailRow(
            icon: Icons.location_on,
            label: 'Address',
            value: widget.pickup.address,
          ),
          SizedBox(height: 16.h),
          _buildDetailRow(
            icon: Icons.schedule,
            label: 'Pickup Mode',
            value: widget.pickup.pickupMode == 'pickup' ? 'Pickup' : 'Drop-off',
          ),
          SizedBox(height: 16.h),
          _buildDetailRow(
            icon: Icons.access_time,
            label: 'SLA Deadline',
            value: _formatDate(widget.pickup.slaDeadline),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingMap() {
    return Observer(
      builder: (_) => Container(
        height: 300.h,
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppTheme.borderSoft),
        ),
        child: Stack(
          children: [
            // Map placeholder
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_pickupStore.isLoadingTracking)
                    CircularProgressIndicator(color: AppTheme.primaryGreen)
                  else
                    Icon(
                      Icons.map_outlined,
                      size: 48.w,
                      color: AppTheme.textSecondary.withOpacity(0.5),
                    ),
                  SizedBox(height: 8.h),
                  if (_pickupStore.error != null)
                    Text(
                      _pickupStore.error!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.danger,
                      ),
                      textAlign: TextAlign.center,
                    )
                  else if (_pickupStore.trackingLocation?.location != null)
                    Text(
                      'Agent Location: ${_pickupStore.trackingLocation!.location!.lat.toStringAsFixed(4)}, ${_pickupStore.trackingLocation!.location!.lng.toStringAsFixed(4)}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.textSecondary,
                      ),
                    )
                  else if (_pickupStore.trackingLocation?.message != null)
                    Text(
                      _pickupStore.trackingLocation!.message!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    )
                  else
                    Text(
                      'Loading location...',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
            // Pickup location indicator
            Positioned(
              bottom: 8.h,
              left: 8.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppTheme.darkBackground,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14.w,
                      color: AppTheme.primaryGreen,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Pickup: ${widget.pickup.coordinates.lat.toStringAsFixed(4)}, ${widget.pickup.coordinates.lng.toStringAsFixed(4)}',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Live indicator
            if (_pickupStore.trackingLocation?.isLive == true)
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppTheme.darkBackground,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Live',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppTheme.primaryGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgentDetails() {
    final agentPhone = _extractAgentPhone(widget.pickup.assignedAgentId);
    final agentPhoto = _extractAgentPhoto(widget.pickup.assignedAgentId);
    final agentEmail = _extractAgentEmail(widget.pickup.assignedAgentId);
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Column(
        children: [
          // Agent Header with Photo
          Row(
            children: [
              // Agent Photo
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.primaryGreen.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: agentPhoto != null
                      ? Image.network(
                          agentPhoto,
                          width: 60.w,
                          height: 60.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 60.w,
                              height: 60.w,
                              color: AppTheme.primaryGreen.withOpacity(0.1),
                              child: Icon(
                                Icons.person,
                                color: AppTheme.primaryGreen,
                                size: 30.w,
                              ),
                            );
                          },
                        )
                      : Container(
                          width: 60.w,
                          height: 60.w,
                          color: AppTheme.primaryGreen.withOpacity(0.1),
                          child: Icon(
                            Icons.person,
                            color: AppTheme.primaryGreen,
                            size: 30.w,
                          ),
                        ),
                ),
              ),
              SizedBox(width: 16.w),
              
              // Agent Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pickup.assignedAgentName ?? 'Unknown Agent',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        agentEmail ?? 'No email',
                        style: TextStyle(
                          color: AppTheme.primaryGreen,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          // Contact Section
          if (agentPhone != null) ...[
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppTheme.darkBackground,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppTheme.borderSoft),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: AppTheme.primaryGreen,
                    size: 20.w,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      agentPhone,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _copyToClipboard(agentPhone),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppTheme.primaryGreen.withOpacity(0.3),
                        ),
                      ),
                      child: Icon(
                        Icons.copy,
                        color: AppTheme.primaryGreen,
                        size: 18.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPricingDetails() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Column(
        children: [
          _buildPricingRow(
            label: 'Base Amount',
            value: '₦${widget.pickup.pricing?.baseAmount.toStringAsFixed(2) ?? '0.00'}',
          ),
          SizedBox(height: 12.h),
          if ((widget.pickup.pricing?.bonusAmount ?? 0) > 0) ...[
            _buildPricingRow(
              label: 'Bonus Amount',
              value: '₦${widget.pickup.pricing?.bonusAmount.toStringAsFixed(2) ?? '0.00'}',
              valueColor: AppTheme.success,
            ),
            SizedBox(height: 12.h),
          ],
          Container(
            height: 1,
            color: AppTheme.borderSoft,
            margin: EdgeInsets.symmetric(vertical: 8.h),
          ),
          _buildPricingRow(
            label: 'Total Amount',
            value: '₦${widget.pickup.pricing?.totalAmount.toStringAsFixed(2) ?? '0.00'}',
            valueColor: AppTheme.primaryGreen,
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    final timeline = widget.pickup.matchingTimeline;
    
    if (timeline.isEmpty) {
      return Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppTheme.borderSoft),
        ),
        child: Center(
          child: Text(
            'No timeline events available',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 14.sp,
            ),
          ),
        ),
      );
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
          Text(
            'Timeline',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          ...timeline.asMap().entries.map((entry) {
            final index = entry.key;
            final event = entry.value;
            final isLast = index == timeline.length - 1;
            
            return _buildTimelineItem(
              event: event,
              isLast: isLast,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required MatchingEvent event,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: _getEventColor(event.type),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: AppTheme.borderSoft,
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatEventType(event.type),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      Text(
                        _formatTimestamp(event.timestamp),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  if (event.details != null && event.details!.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    Text(
                      event.details!,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    IconData? valueIcon,
  }) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryGreen,
            size: 20.w,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  if (valueIcon != null) ...[
                    Icon(
                      valueIcon,
                      color: AppTheme.textSecondary,
                      size: 16.w,
                    ),
                    SizedBox(width: 6.w),
                  ],
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPricingRow({
    required String label,
    required String value,
    Color? valueColor,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? AppTheme.textPrimary,
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ],
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return 'N/A';
    
    try {
      final date = DateTime.parse(dateString);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} at ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }

  Color _getEventColor(String type) {
    switch (type) {
      case 'matching_started':
        return Colors.blue;
      case 'agent_notified':
        return AppTheme.warning;
      case 'agent_accepted':
        return AppTheme.primaryGreen;
      case 'agent_declined':
        return AppTheme.danger;
      case 'agent_en_route':
        return Colors.blue;
      case 'agent_arrived':
        return Colors.purple;
      case 'completed':
        return AppTheme.success;
      case 'cancelled':
        return AppTheme.danger;
      default:
        return AppTheme.textMuted;
    }
  }

  String _formatEventType(String type) {
    switch (type) {
      case 'matching_started':
        return 'Matching Started';
      case 'agent_notified':
        return 'Agent Notified';
      case 'agent_accepted':
        return 'Agent Accepted';
      case 'agent_declined':
        return 'Agent Declined';
      case 'agent_en_route':
        return 'Agent En Route';
      case 'agent_arrived':
        return 'Agent Arrived';
      case 'completed':
        return 'Completed';
      case 'cancelled':
        return 'Cancelled';
      default:
        return type.replaceAll('_', ' ').split(' ').map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1);
        }).join(' ');
    }
  }

  String _formatTimestamp(String timestamp) {
    try {
      final dateTime = DateTime.parse(timestamp);
      return DateFormat('MMM d, h:mm a').format(dateTime);
    } catch (e) {
      return timestamp;
    }
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Phone number copied!'),
          backgroundColor: AppTheme.primaryGreen,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  String? _extractAgentPhone(String? assignedAgentId) {
    if (assignedAgentId == null) return null;
    
    // Extract phone number from the agent object string
    // The API returns a string representation of the agent object
    try {
      final phoneRegex = RegExp(r"phone: '([^']*)'");
      final match = phoneRegex.firstMatch(assignedAgentId);
      return match?.group(1);
    } catch (e) {
      return null;
    }
  }

  String? _extractAgentPhoto(String? assignedAgentId) {
    if (assignedAgentId == null) return null;
    
    // Extract photo URL from the agent object string
    try {
      final photoRegex = RegExp(r"profilePhoto: '([^']*)'");
      final match = photoRegex.firstMatch(assignedAgentId);
      return match?.group(1);
    } catch (e) {
      return null;
    }
  }

  String? _extractAgentEmail(String? assignedAgentId) {
    if (assignedAgentId == null) return null;
    
    // Extract email from the agent object string
    try {
      final emailRegex = RegExp(r"email: '([^']*)'");
      final match = emailRegex.firstMatch(assignedAgentId);
      return match?.group(1);
    } catch (e) {
      return null;
    }
  }
}
