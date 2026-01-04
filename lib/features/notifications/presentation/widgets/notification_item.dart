// notification_item.dart
import 'package:flutter/material.dart';
import '../../domain/entities/notification.dart' as model;
import '../../../../shared/themes/app_theme.dart';

class NotificationItem extends StatelessWidget {
  final model.Notification notification;
  final VoidCallback onTap;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = _resolveStyle();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: notification.isRead
            ? AppTheme.surfaceDark
            : style.background.withOpacity(0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: style.border.withOpacity(notification.isRead ? 0.15 : 0.35),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _icon(style),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: notification.isRead
                            ? FontWeight.w500
                            : FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _chip(style),
                        const Spacer(),
                        Text(
                          _time(notification.createdAt),
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!notification.isRead)
                Container(
                  margin: const EdgeInsets.only(left: 8, top: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: style.dot,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _NotificationStyle _resolveStyle() {
    final type = notification.type.toLowerCase();
    final category = notification.category.toLowerCase();

    // 🚨 Critical / Danger only (security failures, fraud, rejected)
    if (type.contains('suspicious') ||
        type.contains('failed') ||
        type.contains('rejected')) {
      return _NotificationStyle(
        background: const Color(0xFFFF3B30),
        border: const Color(0xFFFF453A),
        icon: Icons.error_outline,
        dot: const Color(0xFFFF453A),
      );
    }

    // 🚚 Pickup & Operations (high ≠ danger)
    if (category == 'operations' || type.contains('pickup')) {
      return _NotificationStyle(
        background: const Color(0xFF0A84FF),
        border: const Color(0xFF409CFF),
        icon: Icons.local_shipping,
        dot: const Color(0xFF0A84FF),
      );
    }

    // 💰 Finance
    if (category == 'finance' ||
        type.contains('wallet') ||
        type.contains('withdrawal')) {
      return _NotificationStyle(
        background: const Color(0xFF34C759),
        border: const Color(0xFF30D158),
        icon: Icons.account_balance_wallet,
        dot: const Color(0xFF30D158),
      );
    }

    // 🔒 Security (non-critical)
    if (category == 'security' || type.contains('login')) {
      return _NotificationStyle(
        background: const Color(0xFFFF9F0A),
        border: const Color(0xFFFFB340),
        icon: Icons.lock_outline,
        dot: const Color(0xFFFF9F0A),
      );
    }

    // 🏆 Rewards
    if (category == 'rewards') {
      return _NotificationStyle(
        background: const Color(0xFFFFD60A),
        border: const Color(0xFFFFE34A),
        icon: Icons.emoji_events,
        dot: const Color(0xFFFFD60A),
      );
    }

    // 🌱 Impact
    if (category == 'impact') {
      return _NotificationStyle(
        background: const Color(0xFF2CD158),
        border: const Color(0xFF32D74B),
        icon: Icons.eco,
        dot: const Color(0xFF32D74B),
      );
    }

    // 📣 Marketing
    if (category == 'marketing') {
      return _NotificationStyle(
        background: const Color(0xFFBF5AF2),
        border: const Color(0xFFD07DFF),
        icon: Icons.campaign,
        dot: const Color(0xFFBF5AF2),
      );
    }

    // ⚙️ System / default
    return _NotificationStyle(
      background: AppTheme.primaryGreen,
      border: AppTheme.primaryGreen,
      icon: Icons.notifications,
      dot: AppTheme.primaryGreen,
    );
  }

  Widget _icon(_NotificationStyle style) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: style.background.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        style.icon,
        color: style.border,
        size: 20,
      ),
    );
  }

  Widget _chip(_NotificationStyle style) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: style.background.withOpacity(0.18),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        notification.category.toUpperCase(),
        style: TextStyle(
          color: style.border,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _time(DateTime d) {
    final diff = DateTime.now().difference(d);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m';
    if (diff.inDays < 1) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    return '${d.day}/${d.month}/${d.year}';
  }
}

class _NotificationStyle {
  final Color background;
  final Color border;
  final Color dot;
  final IconData icon;

  _NotificationStyle({
    required this.background,
    required this.border,
    required this.dot,
    required this.icon,
  });
}
