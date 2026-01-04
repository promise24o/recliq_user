// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationStore on _NotificationStore, Store {
  Computed<bool>? _$hasFiltersComputed;

  @override
  bool get hasFilters =>
      (_$hasFiltersComputed ??= Computed<bool>(() => super.hasFilters,
              name: '_NotificationStore.hasFilters'))
          .value;
  Computed<List<notification_model.Notification>>?
      _$unreadNotificationsComputed;

  @override
  List<notification_model.Notification> get unreadNotifications =>
      (_$unreadNotificationsComputed ??=
              Computed<List<notification_model.Notification>>(
                  () => super.unreadNotifications,
                  name: '_NotificationStore.unreadNotifications'))
          .value;
  Computed<List<NotificationGroup>>? _$groupedNotificationsComputed;

  @override
  List<NotificationGroup> get groupedNotifications =>
      (_$groupedNotificationsComputed ??= Computed<List<NotificationGroup>>(
              () => super.groupedNotifications,
              name: '_NotificationStore.groupedNotifications'))
          .value;

  late final _$notificationsAtom =
      Atom(name: '_NotificationStore.notifications', context: context);

  @override
  ObservableList<notification_model.Notification> get notifications {
    _$notificationsAtom.reportRead();
    return super.notifications;
  }

  @override
  set notifications(ObservableList<notification_model.Notification> value) {
    _$notificationsAtom.reportWrite(value, super.notifications, () {
      super.notifications = value;
    });
  }

  late final _$unreadCountAtom =
      Atom(name: '_NotificationStore.unreadCount', context: context);

  @override
  int get unreadCount {
    _$unreadCountAtom.reportRead();
    return super.unreadCount;
  }

  @override
  set unreadCount(int value) {
    _$unreadCountAtom.reportWrite(value, super.unreadCount, () {
      super.unreadCount = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_NotificationStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasMoreAtom =
      Atom(name: '_NotificationStore.hasMore', context: context);

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  late final _$totalAtom =
      Atom(name: '_NotificationStore.total', context: context);

  @override
  int get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_NotificationStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_NotificationStore.selectedCategory', context: context);

  @override
  String? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectedTypeAtom =
      Atom(name: '_NotificationStore.selectedType', context: context);

  @override
  String? get selectedType {
    _$selectedTypeAtom.reportRead();
    return super.selectedType;
  }

  @override
  set selectedType(String? value) {
    _$selectedTypeAtom.reportWrite(value, super.selectedType, () {
      super.selectedType = value;
    });
  }

  late final _$showUnreadOnlyAtom =
      Atom(name: '_NotificationStore.showUnreadOnly', context: context);

  @override
  bool get showUnreadOnly {
    _$showUnreadOnlyAtom.reportRead();
    return super.showUnreadOnly;
  }

  @override
  set showUnreadOnly(bool value) {
    _$showUnreadOnlyAtom.reportWrite(value, super.showUnreadOnly, () {
      super.showUnreadOnly = value;
    });
  }

  late final _$currentOffsetAtom =
      Atom(name: '_NotificationStore.currentOffset', context: context);

  @override
  int get currentOffset {
    _$currentOffsetAtom.reportRead();
    return super.currentOffset;
  }

  @override
  set currentOffset(int value) {
    _$currentOffsetAtom.reportWrite(value, super.currentOffset, () {
      super.currentOffset = value;
    });
  }

  late final _$loadNotificationsAsyncAction =
      AsyncAction('_NotificationStore.loadNotifications', context: context);

  @override
  Future<void> loadNotifications({bool refresh = false}) {
    return _$loadNotificationsAsyncAction
        .run(() => super.loadNotifications(refresh: refresh));
  }

  late final _$loadMoreNotificationsAsyncAction =
      AsyncAction('_NotificationStore.loadMoreNotifications', context: context);

  @override
  Future<void> loadMoreNotifications() {
    return _$loadMoreNotificationsAsyncAction
        .run(() => super.loadMoreNotifications());
  }

  late final _$refreshNotificationsAsyncAction =
      AsyncAction('_NotificationStore.refreshNotifications', context: context);

  @override
  Future<void> refreshNotifications() {
    return _$refreshNotificationsAsyncAction
        .run(() => super.refreshNotifications());
  }

  late final _$refreshInBackgroundAsyncAction =
      AsyncAction('_NotificationStore.refreshInBackground', context: context);

  @override
  Future<void> refreshInBackground() {
    return _$refreshInBackgroundAsyncAction
        .run(() => super.refreshInBackground());
  }

  late final _$loadUnreadCountAsyncAction =
      AsyncAction('_NotificationStore.loadUnreadCount', context: context);

  @override
  Future<void> loadUnreadCount() {
    return _$loadUnreadCountAsyncAction.run(() => super.loadUnreadCount());
  }

  late final _$refreshUnreadCountAsyncAction =
      AsyncAction('_NotificationStore.refreshUnreadCount', context: context);

  @override
  Future<void> refreshUnreadCount() {
    return _$refreshUnreadCountAsyncAction
        .run(() => super.refreshUnreadCount());
  }

  late final _$markNotificationAsReadAsyncAction = AsyncAction(
      '_NotificationStore.markNotificationAsRead',
      context: context);

  @override
  Future<void> markNotificationAsRead(String notificationId) {
    return _$markNotificationAsReadAsyncAction
        .run(() => super.markNotificationAsRead(notificationId));
  }

  late final _$markAllNotificationsAsReadAsyncAction = AsyncAction(
      '_NotificationStore.markAllNotificationsAsRead',
      context: context);

  @override
  Future<void> markAllNotificationsAsRead() {
    return _$markAllNotificationsAsReadAsyncAction
        .run(() => super.markAllNotificationsAsRead());
  }

  late final _$getUnreadCountAsyncAction =
      AsyncAction('_NotificationStore.getUnreadCount', context: context);

  @override
  Future<void> getUnreadCount() {
    return _$getUnreadCountAsyncAction.run(() => super.getUnreadCount());
  }

  late final _$seedNotificationsAsyncAction =
      AsyncAction('_NotificationStore.seedNotifications', context: context);

  @override
  Future<void> seedNotifications() {
    return _$seedNotificationsAsyncAction.run(() => super.seedNotifications());
  }

  late final _$_NotificationStoreActionController =
      ActionController(name: '_NotificationStore', context: context);

  @override
  void setCategoryFilter(String? category) {
    final _$actionInfo = _$_NotificationStoreActionController.startAction(
        name: '_NotificationStore.setCategoryFilter');
    try {
      return super.setCategoryFilter(category);
    } finally {
      _$_NotificationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypeFilter(String? type) {
    final _$actionInfo = _$_NotificationStoreActionController.startAction(
        name: '_NotificationStore.setTypeFilter');
    try {
      return super.setTypeFilter(type);
    } finally {
      _$_NotificationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnreadOnlyFilter(bool value) {
    final _$actionInfo = _$_NotificationStoreActionController.startAction(
        name: '_NotificationStore.setUnreadOnlyFilter');
    try {
      return super.setUnreadOnlyFilter(value);
    } finally {
      _$_NotificationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_NotificationStoreActionController.startAction(
        name: '_NotificationStore.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_NotificationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_NotificationStoreActionController.startAction(
        name: '_NotificationStore.clearError');
    try {
      return super.clearError();
    } finally {
      _$_NotificationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notifications: ${notifications},
unreadCount: ${unreadCount},
isLoading: ${isLoading},
hasMore: ${hasMore},
total: ${total},
error: ${error},
selectedCategory: ${selectedCategory},
selectedType: ${selectedType},
showUnreadOnly: ${showUnreadOnly},
currentOffset: ${currentOffset},
hasFilters: ${hasFilters},
unreadNotifications: ${unreadNotifications},
groupedNotifications: ${groupedNotifications}
    ''';
  }
}
