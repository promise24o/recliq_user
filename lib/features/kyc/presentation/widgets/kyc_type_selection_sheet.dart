import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' hide State;
import '../../../../shared/themes/app_theme.dart';
import '../../../../core/di/service_locator.dart';
import '../../../profile/presentation/mobx/profile_store.dart';
import '../../domain/repositories/kyc_repository.dart';

class KycTypeSelectionSheet extends StatefulWidget {
  final Function(String userType) onTypeSelected;

  const KycTypeSelectionSheet({
    super.key,
    required this.onTypeSelected,
  });

  @override
  State<KycTypeSelectionSheet> createState() => _KycTypeSelectionSheetState();
}

class _KycTypeSelectionSheetState extends State<KycTypeSelectionSheet> {
  bool _isInitializing = false;
  late final ProfileStore _profileStore;
  late final KycRepository _kycRepository;

  @override
  void initState() {
    super.initState();
    _profileStore = getIt<ProfileStore>();
    _kycRepository = getIt<KycRepository>();
    _profileStore.loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Select KYC Type',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose your account type to continue with verification',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            if (_isInitializing) ...[
              Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryGreen),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Initializing KYC...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              _buildTypeOption(
                context,
                icon: Icons.person,
                title: 'Individual',
                description: 'For personal accounts - Verify with BVN',
                userType: 'individual',
              ),
              const SizedBox(height: 16),
              _buildTypeOption(
                context,
                icon: Icons.business,
                title: 'Enterprise',
                description: 'For business accounts - Provide business details',
                userType: 'enterprise',
              ),
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _handleTypeSelection(BuildContext context, String userType) async {
    final user = _profileStore.user;
    if (user == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not found. Please login again.'),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.pop(context);
      }
      return;
    }

    setState(() {
      _isInitializing = true;
    });

    try {
      final result = await _kycRepository.initializeKyc(
        userId: user.id,
        userType: userType,
      );

      if (mounted) {
        result.fold(
          (failure) {
            String message = failure.message ?? 'KYC initialization failed';
            if (failure.message?.contains('already initialized') == true) {
              message = 'KYC already initialized. Continuing...';
            }
            
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: failure.message?.contains('already initialized') == true 
                    ? AppTheme.primaryGreen 
                    : Colors.orange,
              ),
            );
            
            // Continue even if already initialized
            Navigator.pop(context);
            widget.onTypeSelected(userType.toLowerCase());
          },
          (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response.message),
                backgroundColor: AppTheme.primaryGreen,
              ),
            );
            
            Navigator.pop(context);
            widget.onTypeSelected(userType.toLowerCase());
          },
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('KYC initialization failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.pop(context);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isInitializing = false;
        });
      }
    }
  }

  Widget _buildTypeOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required String userType,
  }) {
    return InkWell(
      onTap: _isInitializing ? null : () => _handleTypeSelection(context, userType),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900]?.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[800]!,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: AppTheme.primaryGreen,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[600],
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
