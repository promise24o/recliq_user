import 'package:flutter/material.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../domain/entities/available_agent.dart';

class PickupConfirmationBottomSheet extends StatelessWidget {
  final AvailableAgent selectedAgent;
  final String wasteType;
  final double estimatedWeight;
  final String address;
  final String pickupMode;
  final String? notes;
  final String? city;
  final String? zone;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final bool isLoading;

  const PickupConfirmationBottomSheet({
    super.key,
    required this.selectedAgent,
    required this.wasteType,
    required this.estimatedWeight,
    required this.address,
    required this.pickupMode,
    this.notes,
    this.city,
    this.zone,
    required this.onConfirm,
    required this.onCancel,
    this.isLoading = false,
  });

  String _formatWasteType(String type) {
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

  IconData _getWasteIcon(String type) {
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
        return Icons.recycling;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Header
            Row(
              children: [
                GestureDetector(
                  onTap: onCancel,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppTheme.darkBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.borderSoft),
                    ),
                    child: const Icon(Icons.arrow_back,
                        color: AppTheme.textPrimary, size: 18),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Confirm Pickup Request',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Selected Agent Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.08),
                borderRadius: BorderRadius.circular(14),
                border:
                    Border.all(color: AppTheme.primaryGreen.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppTheme.primaryGreen,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Selected Agent',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          selectedAgent.agentName,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                color: AppTheme.primaryGreen, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              '~${selectedAgent.estimatedArrivalTime} min arrival',
                              style: const TextStyle(
                                color: AppTheme.primaryGreen,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(Icons.location_on,
                                color: AppTheme.textMuted, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              '${selectedAgent.distance.toStringAsFixed(2)} km',
                              style: const TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle,
                      color: AppTheme.primaryGreen, size: 24),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Pickup Details Section
            const Text(
              'Pickup Details',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // Details Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.darkBackground,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.borderSoft),
              ),
              child: Column(
                children: [
                  // Location
                  _buildDetailRow(
                    icon: Icons.location_on,
                    label: 'Pickup Location',
                    value: address,
                    iconColor: AppTheme.primaryGreen,
                  ),
                  if (city != null || zone != null) ...[
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      icon: Icons.map,
                      label: 'Service Area',
                      value: [city, zone].where((e) => e != null).join(' • '),
                      iconColor: AppTheme.textMuted,
                    ),
                  ],
                  const SizedBox(height: 12),
                  const Divider(color: AppTheme.borderSoft, height: 1),
                  const SizedBox(height: 12),

                  // Waste Type
                  _buildDetailRow(
                    icon: _getWasteIcon(wasteType),
                    label: 'Waste Type',
                    value: _formatWasteType(wasteType),
                    iconColor: AppTheme.primaryGreen,
                  ),
                  const SizedBox(height: 12),

                  // Weight
                  _buildDetailRow(
                    icon: Icons.scale,
                    label: 'Estimated Weight',
                    value: '${estimatedWeight.toStringAsFixed(1)} kg',
                    iconColor: AppTheme.textMuted,
                  ),
                  const SizedBox(height: 12),

                  // Pickup Mode
                  _buildDetailRow(
                    icon: pickupMode == 'pickup'
                        ? Icons.directions_car
                        : Icons.store,
                    label: 'Pickup Mode',
                    value: pickupMode == 'pickup' ? 'Pickup' : 'Drop-off',
                    iconColor: AppTheme.textMuted,
                  ),

                  // Notes
                  if (notes != null && notes!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    const Divider(color: AppTheme.borderSoft, height: 1),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      icon: Icons.notes,
                      label: 'Notes',
                      value: notes!,
                      iconColor: AppTheme.textMuted,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Info Banner
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.withOpacity(0.3)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue, size: 18),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'The agent will be notified and will arrive at your location within the estimated time.',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: isLoading ? null : onCancel,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: AppTheme.borderSoft),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
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
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Confirm Pickup',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
