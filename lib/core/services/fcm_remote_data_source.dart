import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FcmRemoteDataSource {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  FcmRemoteDataSource(this._dio, this._secureStorage);

  Future<bool> registerFcmToken({
    required String fcmToken,
    required String deviceType,
  }) async {
    try {
      final token = await _secureStorage.read(key: 'access_token');
      
      final response = await _dio.post(
        '/auth/fcm/register',
        data: {
          'deviceType': deviceType,
          'fcmToken': fcmToken,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('[FCM] Error registering token: $e');
      return false;
    }
  }

  Future<bool> unregisterFcmToken({
    required String deviceType,
  }) async {
    try {
      final token = await _secureStorage.read(key: 'access_token');
      
      final response = await _dio.post(
        '/auth/fcm/unregister',
        data: {
          'deviceType': deviceType,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('[FCM] Error unregistering token: $e');
      return false;
    }
  }

  Future<Map<String, String>?> getFcmTokens() async {
    try {
      final token = await _secureStorage.read(key: 'access_token');
      
      final response = await _dio.get(
        '/auth/fcm/tokens',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final tokens = response.data['tokens'] as Map<String, dynamic>;
        return tokens.map((key, value) => MapEntry(key, value.toString()));
      }
      return null;
    } catch (e) {
      print('[FCM] Error getting tokens: $e');
      return null;
    }
  }
}
