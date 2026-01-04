import 'package:flutter/material.dart';
import '../../../../shared/themes/app_theme.dart';
import '../mobx/profile_store.dart';

class AccountSection extends StatelessWidget {
  final ProfileStore profileStore;
  final VoidCallback onLogout;

  const AccountSection({
    super.key,
    required this.profileStore,
    required this.onLogout,
  });

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
              'Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _buildSettingsTile(
            icon: Icons.logout,
            title: "Logout",
            subtitle: "Sign out of your account",
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
