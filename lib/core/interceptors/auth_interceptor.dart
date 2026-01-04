import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage;

  AuthInterceptor(this._secureStorage);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Check if this request requires authentication
    final requiresAuth = options.extra['requiresAuth'] ?? true;

    if (requiresAuth == true) {
      // Add authorization header if token exists
      final token = await _secureStorage.read(key: 'access_token');

      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 unauthorized errors
    if (err.response?.statusCode == 401) {
      // Token might be expired, clear stored data
      // _clearAuthData();
    }

    super.onError(err, handler);
  }

  void _clearAuthData() async {
    await _secureStorage.delete(key: 'access_token');
    await _secureStorage.delete(key: 'refresh_token');
    await _secureStorage.delete(key: 'user_data');
  }
}
