import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/notification_model.dart';

abstract class NotificationLocalDataSource {
  Future<void> cacheNotifications(List<NotificationModel> notifications);
  Future<List<NotificationModel>> getCachedNotifications();
  Future<void> cacheUnreadCount(int count);
  Future<int> getCachedUnreadCount();
  Future<void> clearCache();
  Future<bool> isCacheExpired();
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  final SharedPreferences _prefs;

  static const String _notificationsKey = 'cached_notifications';
  static const String _unreadCountKey = 'cached_unread_count';
  static const String _lastUpdatedKey = 'notifications_last_updated';

  NotificationLocalDataSourceImpl(this._prefs);

  @override
  Future<void> cacheNotifications(List<NotificationModel> notifications) async {
    try {
      print(' LocalDataSource: Caching ${notifications.length} notifications');
      final List<Map<String, dynamic>> jsonList =
          notifications.map((notification) => notification.toJson()).toList();
      await _prefs.setString(_notificationsKey, jsonEncode(jsonList));
      await _prefs.setString(_lastUpdatedKey, DateTime.now().toIso8601String());
      print(' LocalDataSource: Cache saved successfully');
    } catch (e) {
      print(' LocalDataSource: Cache save error: $e');
    }
  }

  @override
  Future<List<NotificationModel>> getCachedNotifications() async {
    try {
      print(' LocalDataSource: Retrieving cached notifications');
      final String? jsonString = _prefs.getString(_notificationsKey);
      if (jsonString == null) {
        print(' LocalDataSource: No cached notifications found');
        return [];
      }

      final List<dynamic> jsonList = jsonDecode(jsonString);
      final notifications = jsonList
          .map((json) =>
              NotificationModel.fromJson(json as Map<String, dynamic>))
          .toList();
      print(
          ' LocalDataSource: Retrieved ${notifications.length} cached notifications');
      return notifications;
    } catch (e) {
      print(' LocalDataSource: Cache retrieval error: $e');
      return [];
    }
  }

  @override
  Future<void> cacheUnreadCount(int count) async {
    try {
      print('💾 LocalDataSource: Caching unread count: $count');
      await _prefs.setInt(_unreadCountKey, count);
      print('💾 LocalDataSource: Unread count cached successfully');
    } catch (e) {
      print('💾 LocalDataSource: Unread count cache error: $e');
    }
  }

  @override
  Future<int> getCachedUnreadCount() async {
    try {
      print(' LocalDataSource: Retrieving cached unread count');
      final count = _prefs.getInt(_unreadCountKey) ?? 0;
      print(' LocalDataSource: Retrieved cached unread count: $count');
      return count;
    } catch (e) {
      print(' LocalDataSource: Unread count retrieval error: $e');
      return 0;
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await _prefs.remove(_notificationsKey);
      await _prefs.remove(_unreadCountKey);
      await _prefs.remove(_lastUpdatedKey);
    } catch (e) {
      // Silently fail cache clearing
    }
  }

  @override
  Future<bool> isCacheExpired() async {
    try {
      print(' LocalDataSource: Checking cache expiration');
      final String? lastUpdated = _prefs.getString(_lastUpdatedKey);
      if (lastUpdated == null) {
        print(' LocalDataSource: No cache timestamp found, cache expired');
        return true;
      }

      final DateTime lastUpdateTime = DateTime.parse(lastUpdated);
      final DateTime now = DateTime.now();
      final minutesSinceUpdate = now.difference(lastUpdateTime).inMinutes;

      // Cache expires after 5 minutes
      final isExpired = minutesSinceUpdate > 5;
      print(
          ' LocalDataSource: Cache age: $minutesSinceUpdate minutes, expired: $isExpired');
      return isExpired;
    } catch (e) {
      print(' LocalDataSource: Cache expiration check error: $e');
      return true;
    }
  }
}
