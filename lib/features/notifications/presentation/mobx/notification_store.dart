import 'package:mobx/mobx.dart';
import '../../domain/entities/notification.dart' as notification_model;
import '../../domain/repositories/notification_repository.dart';

part 'notification_store.g.dart';

class NotificationGroup {
  final String label;
  final List<notification_model.Notification> items;

  const NotificationGroup({
    required this.label,
    required this.items,
  });
}

class NotificationStore = _NotificationStore with _$NotificationStore;

abstract class _NotificationStore with Store {
  final NotificationRepository _notificationRepository;

  _NotificationStore({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository {
    // Load unread count immediately when store is created
    loadUnreadCount();
  }

  @observable
  ObservableList<notification_model.Notification> notifications =
      ObservableList<notification_model.Notification>();

  @observable
  int unreadCount = 0;

  @observable
  bool isLoading = false;

  @observable
  bool hasMore = true;

  @observable
  int total = 0;

  @observable
  String? error;

  @observable
  String? selectedCategory;

  @observable
  String? selectedType;

  @observable
  bool showUnreadOnly = false;

  @observable
  int currentOffset = 0;

  static const int _limit = 20;

  @action
  Future<void> loadNotifications({bool refresh = false}) async {
    if (refresh) {
      currentOffset = 0;
      notifications.clear();
      hasMore = true;
    }

    if (isLoading || !hasMore) return;

    isLoading = true;
    error = null;

    try {
      print(
          '🔍 Loading notifications - Category: $selectedCategory, Type: $selectedType, UnreadOnly: $showUnreadOnly');
      final result = await _notificationRepository.getNotifications(
        category: selectedCategory,
        type: selectedType,
        unreadOnly: showUnreadOnly,
        limit: _limit,
        offset: currentOffset,
        forceRefresh: refresh,
      );

      result.fold(
        (failure) => _handleFailure(failure),
        (response) {
          if (refresh) {
            notifications.clear();
          }
          notifications.addAll(response.notifications);
          unreadCount = response.unreadCount;
          hasMore = response.hasMore;
          total = response.total;
          currentOffset += _limit;
        },
      );
    } catch (e) {
      error = 'Failed to load notifications';
    }

    isLoading = false;
  }

  @action
  Future<void> loadMoreNotifications() async {
    await loadNotifications(refresh: false);
  }

  @action
  Future<void> refreshNotifications() async {
    await loadNotifications(refresh: true);
  }

  @action
  Future<void> refreshInBackground() async {
    try {
      final result = await _notificationRepository.getNotifications(
        category: selectedCategory,
        type: selectedType,
        unreadOnly: showUnreadOnly,
        limit: _limit,
        offset: 0,
        forceRefresh: true,
      );

      result.fold(
        (failure) {
          // Silently handle background refresh failures
          print('Background refresh failed: $failure');
        },
        (response) {
          // Update notifications with fresh data
          notifications.clear();
          notifications.addAll(response.notifications);
          unreadCount = response.unreadCount;
          hasMore = response.hasMore;
          total = response.total;
          currentOffset = _limit;
        },
      );
    } catch (e) {
      print('Background refresh error: $e');
    }
  }

  @action
  Future<void> loadUnreadCount() async {
    isLoading = true;
    try {
      final result = await _notificationRepository.getUnreadCount();
      result.fold(
        (failure) => _handleFailure(failure),
        (response) {
          unreadCount = response.unreadCount;
        },
      );
    } catch (e) {
      error = 'Failed to load unread count';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> refreshUnreadCount() async {
    try {
      final result =
          await _notificationRepository.getUnreadCount(forceRefresh: true);
      result.fold(
        (failure) => _handleFailure(failure),
        (response) {
          unreadCount = response.unreadCount;
        },
      );
    } catch (e) {
      error = 'Failed to refresh unread count';
    }
  }

  @action
  Future<void> markNotificationAsRead(String notificationId) async {
    try {
      final result =
          await _notificationRepository.markNotificationAsRead(notificationId);
      result.fold(
        (failure) => _handleFailure(failure),
        (_) {
          final index = notifications.indexWhere((n) => n.id == notificationId);
          if (index != -1) {
            final updatedNotification = notifications[index].copyWith(
              isRead: true,
              readAt: DateTime.now(),
            );
            notifications[index] = updatedNotification;
            if (unreadCount > 0) unreadCount--;
          }
        },
      );
    } catch (e) {
      error = 'Failed to mark notification as read';
    }
  }

  @action
  Future<void> markAllNotificationsAsRead() async {
    try {
      final result = await _notificationRepository.markAllNotificationsAsRead();
      result.fold(
        (failure) => _handleFailure(failure),
        (_) {
          for (int i = 0; i < notifications.length; i++) {
            notifications[i] = notifications[i].copyWith(
              isRead: true,
              readAt: DateTime.now(),
            );
          }
          unreadCount = 0;
        },
      );
    } catch (e) {
      error = 'Failed to mark all notifications as read';
    }
  }

  @action
  Future<void> getUnreadCount() async {
    try {
      final result = await _notificationRepository.getUnreadCount();
      result.fold(
        (failure) => _handleFailure(failure),
        (response) => unreadCount = response.unreadCount,
      );
    } catch (e) {
      error = 'Failed to get unread count';
    }
  }

  @action
  Future<void> seedNotifications() async {
    isLoading = true;
    error = null;

    try {
      final result = await _notificationRepository.seedNotifications();
      result.fold(
        (failure) => _handleFailure(failure),
        (_) => refreshNotifications(),
      );
    } catch (e) {
      error = 'Failed to seed notifications';
    }

    isLoading = false;
  }

  @action
  void setCategoryFilter(String? category) {
    selectedCategory = category;
    refreshNotifications();
  }

  @action
  void setTypeFilter(String? type) {
    selectedType = type;
    refreshNotifications();
  }

  @action
  void setUnreadOnlyFilter(bool value) {
    print('🔍 Setting unreadOnly filter to: $value');
    showUnreadOnly = value;
    refreshNotifications();
  }

  @action
  void clearFilters() {
    selectedCategory = null;
    selectedType = null;
    showUnreadOnly = false;
    refreshNotifications();
  }

  @action
  void clearError() {
    error = null;
  }

  void _handleFailure(dynamic failure) {
    if (failure.toString().contains('Network')) {
      error = 'Network error. Please check your internet connection.';
    } else {
      error = 'Server error. Please try again later.';
    }
  }

  @computed
  bool get hasFilters =>
      selectedCategory != null || selectedType != null || showUnreadOnly;

  @computed
  List<notification_model.Notification> get unreadNotifications =>
      notifications.where((n) => !n.isRead).toList();

  @computed
  List<NotificationGroup> get groupedNotifications {
    final groups = <String, List<notification_model.Notification>>{};
    final now = DateTime.now();

    for (final notification in notifications) {
      final label = _getGroupLabel(notification.createdAt, now);
      groups.putIfAbsent(label, () => []).add(notification);
    }

    return groups.entries
        .map((entry) => NotificationGroup(label: entry.key, items: entry.value))
        .toList();
  }

  String _getGroupLabel(DateTime dateTime, DateTime now) {
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return 'This Week';
    } else if (difference.inDays < 30) {
      return 'This Month';
    } else {
      return 'Older';
    }
  }
}
