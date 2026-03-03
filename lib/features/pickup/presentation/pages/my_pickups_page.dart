import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/app_header.dart';
import '../mobx/pickup_store.dart';
import '../../../profile/presentation/mobx/profile_store.dart';
import 'request_pickup_page.dart';
import 'pickup_details_page.dart';

class MyPickupsPage extends StatefulWidget {
  const MyPickupsPage({super.key});

  @override
  State<MyPickupsPage> createState() => _MyPickupsPageState();
}

class _MyPickupsPageState extends State<MyPickupsPage>
    with SingleTickerProviderStateMixin {
  final PickupStore _pickupStore = getIt<PickupStore>();
  final _profileStore = getIt<ProfileStore>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pickupStore.loadMyRequests();
  }

  @override
  void dispose() {
    _tabController.dispose();
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

  void _showCancelBottomSheet(String id) {
    final reasonController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppTheme.surfaceDark,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.danger.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: AppTheme.danger,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Cancel Pickup Request',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppTheme.darkBackground,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.borderSoft),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: AppTheme.textPrimary,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Please provide a reason for cancellation',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: reasonController,
                      maxLines: 3,
                      autofocus: true,
                      style: const TextStyle(color: AppTheme.textPrimary),
                      decoration: InputDecoration(
                        hintText: 'e.g., Changed my mind, Found another option...',
                        hintStyle: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 13,
                        ),
                        filled: true,
                        fillColor: AppTheme.darkBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppTheme.borderSoft),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppTheme.borderSoft),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppTheme.primaryGreen,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppTheme.borderSoft),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Go Back',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final reason = reasonController.text.trim();
                          if (reason.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please provide a reason'),
                                backgroundColor: AppTheme.danger,
                              ),
                            );
                            return;
                          }
                          Navigator.pop(context);
                          await _pickupStore.cancelRequest(id: id, reason: reason);
                          if (mounted && _pickupStore.error == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Pickup cancelled successfully'),
                                backgroundColor: AppTheme.primaryGreen,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.danger,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Cancel Pickup',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SafeArea(
        child: Observer(
          builder: (_) => Column(
            children: [
              // Header
              _buildHeader(),

              // Tab Bar
              Container(
                color: AppTheme.surfaceDark,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: AppTheme.primaryGreen,
                  labelColor: AppTheme.primaryGreen,
                  unselectedLabelColor: AppTheme.textMuted,
                  labelStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600),
                  tabs: const [
                    Tab(text: 'Active'),
                    Tab(text: 'History'),
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: _pickupStore.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(color: AppTheme.primaryGreen),
                      )
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          _buildRequestList(_pickupStore.activeRequests, isActive: true),
                          _buildRequestList(_pickupStore.completedRequests,
                              isActive: false),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RequestPickupPage()),
        ),
        backgroundColor: AppTheme.primaryGreen,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'New Pickup',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return AppHeader(
      title: 'Your Pickup History',
      subtitle: 'My Pickups',
      showBackButton: true,
      showNotificationBell: false,
      onLeadingTap: () => Navigator.pop(context),
      profileStore: _profileStore,
     actions: [
  GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: _pickupStore.loadMyRequests,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.refresh_rounded,
        color: AppTheme.primaryGreen,
        size: 22,
      ),
    ),
  ),
],
    );
  }

  Widget _buildRequestList(List requests, {required bool isActive}) {
    if (requests.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? Icons.inbox : Icons.history,
              color: AppTheme.textMuted,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              isActive
                  ? 'No active pickups'
                  : 'No completed pickups yet',
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 16,
              ),
            ),
            if (isActive) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const RequestPickupPage()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.add, color: Colors.white, size: 18),
                label: const Text(
                  'Request a Pickup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => _buildRequestCard(requests[i], isActive: isActive),
    );
  }

  Widget _buildRequestCard(dynamic request, {required bool isActive}) {
    final statusColor = _statusColor(request.status);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PickupDetailsPage(pickup: request),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderSoft),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    _statusIcon(request.status),
                    color: statusColor,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _wasteLabel(request.wasteType),
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${request.estimatedWeight} kg',
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor.withOpacity(0.4)),
                  ),
                  child: Text(
                    _statusLabel(request.status),
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(color: AppTheme.borderSoft, height: 1),
            const SizedBox(height: 12),

            // Address
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    color: AppTheme.primaryGreen, size: 14),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    request.address,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            // Agent info
            if (request.assignedAgentName != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.person_outline,
                      color: AppTheme.info, size: 14),
                  const SizedBox(width: 6),
                  Text(
                    request.assignedAgentName!,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],

            // Pricing
            if (request.pricing != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.payments_outlined,
                      color: AppTheme.warning, size: 14),
                  const SizedBox(width: 6),
                  Text(
                    '₦${request.pricing!.totalAmount.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: AppTheme.warning,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '(Base: ₦${request.pricing!.baseAmount.toStringAsFixed(0)} + Bonus: ₦${request.pricing!.bonusAmount.toStringAsFixed(0)})',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],

            // Cancel button for active requests
            if (isActive &&
                (request.status == 'new' ||
                    request.status == 'matching' ||
                    request.status == 'assigned')) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => _showCancelBottomSheet(request.id),
                  style: OutlinedButton.styleFrom(
                    side:
                        BorderSide(color: AppTheme.danger.withOpacity(0.6)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'Cancel Request',
                    style: TextStyle(
                      color: AppTheme.danger,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
