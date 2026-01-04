import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../shared/themes/app_theme.dart';
import '../mobx/profile_store.dart';
import 'pin_setup_bottom_sheet.dart';
import 'pin_update_bottom_sheet.dart';
import 'forgot_pin_bottom_sheet.dart';

class SecuritySection extends StatelessWidget {
  final ProfileStore profileStore;

  const SecuritySection({
    super.key,
    required this.profileStore,
  });

  void _showPinSetup(BuildContext context) {
    final hasPin = profileStore.user?.hasPin ?? false;
    if (hasPin) {
      // User has PIN, show update options
      _showPinOptions(context);
    } else {
      // User doesn't have PIN or hasPin is null, show setup
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => PinSetupBottomSheet(profileStore: profileStore),
      );
    }
  }

  void _showPinOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
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

              // Title
              const Text(
                'PIN Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),

              // Update PIN Option
              ListTile(
                leading: const Icon(Icons.lock_outline,
                    color: AppTheme.primaryGreen),
                title: const Text(
                  'Update PIN',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  'Change your current PIN',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        PinUpdateBottomSheet(profileStore: profileStore),
                  );
                },
              ),

              // Forgot PIN Option
              ListTile(
                leading: const Icon(Icons.help_outline,
                    color: AppTheme.primaryGreen),
                title: const Text(
                  'Forgot PIN',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  'Reset PIN using email verification',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        ForgotPinBottomSheet(profileStore: profileStore),
                  );
                },
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryGreen),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
      trailing: trailing,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Security',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Observer(
            builder: (_) => _buildSettingsTile(
              icon: Icons.fingerprint,
              title: "Biometric Access",
              subtitle: "Use fingerprint or face ID",
              trailing: Switch(
                value: profileStore.biometricEnabled,
                onChanged: (value) => profileStore.toggleBiometric(value),
                activeColor: AppTheme.primaryGreen,
              ),
              onTap: () =>
                  profileStore.toggleBiometric(!profileStore.biometricEnabled),
            ),
          ),
          Observer(
            builder: (_) {
              final hasPin = profileStore.user?.hasPin ?? false;
              return _buildSettingsTile(
                icon: Icons.lock_outline,
                title: hasPin ? "Transaction PIN (Set)" : "Transaction PIN",
                subtitle: hasPin
                    ? "Update or reset your PIN"
                    : "Set up 4-digit PIN for transactions",
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      hasPin ? Icons.edit : Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => _showPinSetup(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                  ),
                ),
                onTap: () => _showPinSetup(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
