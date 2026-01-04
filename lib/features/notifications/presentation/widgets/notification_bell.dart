import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../mobx/notification_store.dart';
import '../pages/notification_page.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/themes/app_theme.dart';

class NotificationBell extends StatelessWidget {
  final NotificationStore? notificationStore;
  final Color? iconColor;
  final double? iconSize;

  const NotificationBell({
    super.key,
    this.notificationStore,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final store = notificationStore ?? getIt<NotificationStore>();

    return Observer(
      builder: (_) {
        return Stack(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => _navigateToNotifications(context),
                icon: Icon(
                  Icons.notifications_outlined,
                  color: iconColor ?? Colors.white,
                  size: iconSize ?? 22,
                ),
              ),
            ),
            // Show loading indicator while fetching count
            if (store.isLoading)
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppTheme.textSecondary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppTheme.darkBackground,
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 8,
                      height: 8,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            // Show count badge when not loading and has unread notifications
            if (!store.isLoading && store.unreadCount > 0)
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.danger,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppTheme.darkBackground,
                      width: 1.5,
                    ),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    store.unreadCount > 99
                        ? '99+'
                        : store.unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  void _navigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const NotificationPage(),
      ),
    );
  }
}
