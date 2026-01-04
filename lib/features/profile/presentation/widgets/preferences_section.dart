import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../shared/themes/app_theme.dart';
import '../mobx/profile_store.dart';

class PreferencesSection extends StatelessWidget {
  final ProfileStore profileStore;

  const PreferencesSection({
    super.key,
    required this.profileStore,
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
              'Preferences',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Observer(
            builder: (_) => _buildSettingsTile(
              icon: Icons.notifications_outlined,
              title: "Price Updates",
              subtitle: "Get notified about price changes",
              trailing: Switch(
                value: profileStore.priceUpdates,
                onChanged: (value) => profileStore.setPriceUpdates(value),
                activeColor: AppTheme.primaryGreen,
              ),
              onTap: () =>
                  profileStore.setPriceUpdates(!profileStore.priceUpdates),
            ),
          ),
          Observer(
            builder: (_) => _buildSettingsTile(
              icon: Icons.email_outlined,
              title: "Login Emails",
              subtitle: "Receive email notifications for logins",
              trailing: Switch(
                value: profileStore.loginEmails,
                onChanged: (value) => profileStore.setLoginEmails(value),
                activeColor: AppTheme.primaryGreen,
              ),
              onTap: () =>
                  profileStore.setLoginEmails(!profileStore.loginEmails),
            ),
          ),
        ],
      ),
    );
  }
}
