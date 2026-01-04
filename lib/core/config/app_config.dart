import 'package:flutter/material.dart';

class AppConfig {
  static const String appName = 'Recliq';
  static const String baseUrl = 'http://localhost:5001'; // Mock API URL

  // API Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';
  static const String verifyOtpEndpoint = '/auth/verify-otp';
  static const String refreshTokenEndpoint = '/auth/refresh-token';

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'user';

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Animations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
}
