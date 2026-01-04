// notification_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../mobx/notification_store.dart';
import '../widgets/notification_item.dart';
import '../widgets/notification_filter_sheet.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/loading_overlay.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationStore _store = getIt<NotificationStore>();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // Use cache-first loading instead of force refresh
    _store.loadNotifications();

    // Start background refresh after a short delay to get fresh data
    Future.delayed(const Duration(milliseconds: 500), () {
      _store.refreshInBackground();
    });

    _controller.addListener(() {
      if (_controller.position.pixels >
          _controller.position.maxScrollExtent - 200) {
        _store.loadMoreNotifications();
      }
    });
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.darkBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => NotificationFilterSheet(
        notificationStore: _store,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => LoadingOverlay(
        isVisible: _store.isLoading,
        message: 'Loading notifications...',
        child: Scaffold(
          backgroundColor: AppTheme.darkBackground,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppTheme.darkBackground,
            centerTitle: true,
            title: const Text(
              'Notification',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            actions: [
              Observer(
                builder: (_) => TextButton(
                  onPressed: _store.unreadCount > 0
                      ? _store.markAllNotificationsAsRead
                      : null,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Mark all as read',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: _showFilterSheet,
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: ListView.builder(
            controller: _controller,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: _store.groupedNotifications.length,
            itemBuilder: (context, index) {
              final group = _store.groupedNotifications[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      group.label.toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ...group.items.map(
                    (n) => NotificationItem(
                      notification: n,
                      onTap: () {
                        if (!n.isRead) {
                          _store.markNotificationAsRead(n.id);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
