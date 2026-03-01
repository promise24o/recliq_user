import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/fcm_service.dart';

class FcmPermissionHelper {
  static Future<void> requestNotificationPermission(BuildContext context) async {
    final fcmService = GetIt.instance<FcmService>();
    
    // Request permission with custom dialog
    final granted = await fcmService.requestPermission(context);
    
    if (granted) {
      print('[FCM] Notification permission granted');
    } else {
      print('[FCM] Notification permission denied');
    }
  }
  
  /// Call this after successful login
  static Future<void> requestPermissionAfterLogin(BuildContext context) async {
    // Wait a bit for the user to see the home screen
    await Future.delayed(const Duration(seconds: 2));
    
    if (context.mounted) {
      await requestNotificationPermission(context);
    }
  }
}
