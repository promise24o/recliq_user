import 'package:flutter/material.dart';
import '../mobx/notification_store.dart';
import '../../../../shared/themes/app_theme.dart';

class NotificationFilterSheet extends StatefulWidget {
  final NotificationStore notificationStore;

  const NotificationFilterSheet({
    super.key,
    required this.notificationStore,
  });

  @override
  State<NotificationFilterSheet> createState() =>
      _NotificationFilterSheetState();
}

class _NotificationFilterSheetState extends State<NotificationFilterSheet> {
  String? _selectedCategory;
  String? _selectedType;
  bool _showUnreadOnly = false;

  final List<String> _categories = [
    'finance',
    'operations',
    'trust_safety',
    'security',
    'rewards',
    'impact',
    'system',
    'marketing',
  ];

  final List<String> _types = [
    'wallet_credit',
    'wallet_debit',
    'withdrawal_success',
    'withdrawal_pending',
    'withdrawal_failed',
    'pickup_requested',
    'agent_assigned',
    'agent_arriving',
    'material_weighed',
    'payment_confirmed',
    'pickup_cancelled',
    'pickup_rescheduled',
    'agent_verified',
    'rate_agent',
    'report_resolved',
    'pickup_issue',
    'login_detected',
    'new_device_login',
    'password_changed',
    'suspicious_activity',
    'kyc_approved',
    'kyc_rejected',
    'milestone_reached',
    'recycling_streak',
    'bonus_earned',
    'leaderboard_update',
    'co2_saved',
    'monthly_recycling',
    'community_impact',
    'maintenance_notice',
    'new_feature',
    'policy_update',
    'limited_time_bonus',
    'partner_offer',
    'referral_rewards',
  ];

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.notificationStore.selectedCategory;
    _selectedType = widget.notificationStore.selectedType;
    _showUnreadOnly = widget.notificationStore.showUnreadOnly;
  }

  void _applyFilters() {
    widget.notificationStore.setCategoryFilter(_selectedCategory);
    widget.notificationStore.setTypeFilter(_selectedType);
    widget.notificationStore.setUnreadOnlyFilter(_showUnreadOnly);
    Navigator.pop(context);
  }

  void _clearFilters() {
    setState(() {
      _selectedCategory = null;
      _selectedType = null;
      _showUnreadOnly = false;
    });
    widget.notificationStore.clearFilters();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Text(
              'Filter Notifications',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildUnreadOnlyToggle(),
            const SizedBox(height: 24),
            _buildCategoryFilter(),
            const SizedBox(height: 24),
            _buildTypeFilter(),
            const SizedBox(height: 32),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildUnreadOnlyToggle() {
    return Row(
      children: [
        const Text(
          'Show unread only',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Switch(
          value: _showUnreadOnly,
          onChanged: (value) {
            setState(() {
              _showUnreadOnly = value;
            });
          },
          activeTrackColor: AppTheme.primaryGreen.withOpacity(0.3),
          activeThumbColor: AppTheme.primaryGreen,
          inactiveThumbColor: const Color(0xFF4A5568),
          inactiveTrackColor: const Color(0xFF2D3748),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _categories.map((category) {
            final isSelected = _selectedCategory == category;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = isSelected ? null : category;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.primaryGreen
                      : const Color(0xFF2D3748),
                  borderRadius: BorderRadius.circular(16),
                  border: isSelected
                      ? null
                      : Border.all(color: const Color(0xFF4A5568)),
                ),
                child: Text(
                  category.toUpperCase(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFFA0AEC0),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTypeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Type',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xFF1A202C),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF4A5568)),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _types.length,
            itemBuilder: (context, index) {
              final type = _types[index];
              final isSelected = _selectedType == type;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedType = isSelected ? null : type;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.primaryGreen.withOpacity(0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: isSelected
                        ? Border.all(color: AppTheme.primaryGreen)
                        : null,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isSelected
                            ? AppTheme.primaryGreen
                            : const Color(0xFF718096),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          type.replaceAll('_', ' ').toUpperCase(),
                          style: TextStyle(
                            color: isSelected
                                ? AppTheme.primaryGreen
                                : const Color(0xFFA0AEC0),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: _clearFilters,
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF2D3748),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Clear',
              style: TextStyle(
                color: Color(0xFFA0AEC0),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: _applyFilters,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryGreen,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Apply',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
