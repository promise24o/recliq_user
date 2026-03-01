import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'fcm_remote_data_source.dart';
import '../widgets/fcm_permission_bottom_sheet.dart';

/// Background message handler - must be top-level function
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('[FCM] Background message: ${message.messageId}');
  print('[FCM] Title: ${message.notification?.title}');
  print('[FCM] Body: ${message.notification?.body}');
}

class FcmService {
  final FirebaseMessaging _firebaseMessaging;
  final FcmRemoteDataSource _remoteDataSource;
  final SharedPreferences _prefs;
  final FlutterLocalNotificationsPlugin _localNotifications;

  FcmService(
    this._firebaseMessaging,
    this._remoteDataSource,
    this._prefs,
  ) : _localNotifications = FlutterLocalNotificationsPlugin();

  /// Initialize FCM and set up listeners
  Future<void> initialize() async {
    print('[FCM] Initializing FCM service...');

    // Initialize local notifications
    await _initializeLocalNotifications();

    // Set up background message handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('[FCM] Foreground message: ${message.messageId}');
      print('[FCM] Title: ${message.notification?.title}');
      print('[FCM] Body: ${message.notification?.body}');
      print('[FCM] Data: ${message.data}');
      
      // Show local notification for foreground messages
      _showLocalNotification(message);
    });

    // Handle notification taps when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('[FCM] Notification tapped: ${message.messageId}');
      print('[FCM] Data: ${message.data}');
      
      // Handle navigation based on notification data
      _handleNotificationTap(message);
    });

    // Check if app was opened from a notification
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      print('[FCM] App opened from notification: ${initialMessage.messageId}');
      _handleNotificationTap(initialMessage);
    }

    print('[FCM] FCM service initialized');
  }

  /// Initialize local notifications
  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create Android notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'default',
      'Default Notifications',
      description: 'Default notification channel',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('notification'),
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Show local notification for foreground messages
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'default',
      'Default Notifications',
      channelDescription: 'Default notification channel',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      color: Color(0xFF4CAF50),
      ledColor: Color(0xFF4CAF50),
      ledOnMs: 1000,
      ledOffMs: 500,
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _localNotifications.show(
      message.hashCode,
      message.notification?.title ?? 'Recliq',
      message.notification?.body ?? 'You have a new notification',
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  }

  /// Handle notification tap from local notifications
  void _onNotificationTapped(NotificationResponse notificationResponse) {
    print('[FCM] Local notification tapped: ${notificationResponse.payload}');
    
    if (notificationResponse.payload != null) {
      try {
        // Parse the data from payload and handle navigation
        final data = Map<String, dynamic>.from(
          // Convert string back to map
          Map<String, dynamic>.from(
            // This is a simple approach - you might need better parsing
            {'data': notificationResponse.payload}
          )
        );
        _handleNotificationTap(RemoteMessage(data: data));
      } catch (e) {
        print('[FCM] Error parsing notification payload: $e');
      }
    }
  }

  /// Request notification permissions and show custom bottom sheet
  Future<bool> requestPermission(BuildContext context) async {
    // Check current permission status
    final currentSettings = await _firebaseMessaging.getNotificationSettings();
    final isAlreadyGranted = currentSettings.authorizationStatus == AuthorizationStatus.authorized ||
        currentSettings.authorizationStatus == AuthorizationStatus.provisional;
    
    // If already granted, just register token and return
    if (isAlreadyGranted) {
      print('[FCM] Permission already granted');
      await registerToken();
      return true;
    }

    // Permission not granted - show bottom sheet
    print('[FCM] Permission not granted, showing bottom sheet');
    final shouldRequest = await _showPermissionBottomSheet(context);
    
    if (!shouldRequest) {
      print('[FCM] User declined notification permission');
      return false;
    }

    // Request permission from system
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    final granted = settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;

    print('[FCM] Permission status: ${settings.authorizationStatus}');
    
    if (granted) {
      // Get and register FCM token
      await registerToken();
    }

    return granted;
  }

  /// Show custom permission bottom sheet
  Future<bool> _showPermissionBottomSheet(BuildContext context) async {
    return await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return const FcmPermissionBottomSheet();
      },
    ) ?? false;
  }

  /// Get FCM token and register with backend
  Future<void> registerToken({int retryCount = 0}) async {
    const maxRetries = 3;
    
    try {
      final fcmToken = await _firebaseMessaging.getToken();
      if (fcmToken != null) {
        print('[FCM] Attempting to register token (attempt ${retryCount + 1}/$maxRetries)');
        
        final deviceType = Platform.isAndroid ? 'android' : 'ios';
        final success = await _remoteDataSource.registerFcmToken(
          fcmToken: fcmToken,
          deviceType: deviceType,
        );
        
        if (success) {
          print('[FCM] Token registered successfully');
        } else {
          print('[FCM] Failed to register token with backend');
          // Retry if we haven't reached max attempts
          if (retryCount < maxRetries) {
            print('[FCM] Retrying token registration in 2 seconds...');
            await Future.delayed(const Duration(seconds: 2));
            await registerToken(retryCount: retryCount + 1);
          }
        }
      } else {
        print('[FCM] Failed to get FCM token');
      }
    } catch (e) {
      print('[FCM] Error registering token: $e');
      // Retry if it's a connection error and we haven't reached max attempts
      if (retryCount < maxRetries && e.toString().contains('Connection')) {
        print('[FCM] Connection error, retrying in 3 seconds...');
        await Future.delayed(const Duration(seconds: 3));
        await registerToken(retryCount: retryCount + 1);
      }
    }
  }

  /// Unregister FCM token from backend
  Future<void> unregisterToken() async {
    try {
      final deviceType = Platform.isAndroid ? 'android' : 'ios';
      
      final success = await _remoteDataSource.unregisterFcmToken(
        deviceType: deviceType,
      );

      if (success) {
        print('[FCM] Token unregistered successfully');
        await _prefs.remove('fcm_token');
        await _prefs.remove('fcm_device_type');
      } else {
        print('[FCM] Failed to unregister token');
      }
    } catch (e) {
      print('[FCM] Error unregistering token: $e');
    }
  }

  /// Handle notification tap
  void _handleNotificationTap(RemoteMessage message) {
    final data = message.data;
    
    // Handle different notification types
    if (data.containsKey('type')) {
      switch (data['type']) {
        case 'pickup_accepted':
          print('[FCM] Navigate to pickup details: ${data['pickupId']}');
          // TODO: Navigate to pickup details page
          break;
        case 'pickup_completed':
          print('[FCM] Navigate to pickup history');
          // TODO: Navigate to pickup history
          break;
        case 'payment_received':
          print('[FCM] Navigate to wallet');
          // TODO: Navigate to wallet page
          break;
        default:
          print('[FCM] Unknown notification type: ${data['type']}');
      }
    }
  }

  /// Listen for token refresh
  void listenForTokenRefresh() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) async {
      print('[FCM] Token refreshed: ${newToken.substring(0, 20)}...');
      
      final deviceType = Platform.isAndroid ? 'android' : 'ios';
      
      await _remoteDataSource.registerFcmToken(
        fcmToken: newToken,
        deviceType: deviceType,
      );
      
      await _prefs.setString('fcm_token', newToken);
    });
  }
}
