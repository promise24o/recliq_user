import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../shared/services/toast_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../profile/domain/repositories/profile_repository.dart';

part 'auth_store.g.dart';

@injectable
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;
  final FlutterSecureStorage _secureStorage;

  _AuthStore(
      this._authRepository, this._profileRepository, this._secureStorage);

  @observable
  User? currentUser;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @computed
  bool get isAuthenticated => currentUser != null;

  @action
  Future<void> sendOtp(String phoneNumber) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.sendOtp(phoneNumber);
    result.fold(
      (failure) => _handleFailure(failure),
      (_) => null,
    );

    isLoading = false;
  }

  @action
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.verifyOtp(phoneNumber, otp);
    result.fold(
      (failure) => _handleFailure(failure),
      (user) => currentUser = user,
    );

    isLoading = false;
  }

  @action
  Future<void> verifyOtpEmail(String email, String otp) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.verifyOtpEmail(email, otp);
    result.fold(
      (failure) => _handleFailure(failure),
      (user) {
        currentUser = user;
        ToastService.showSuccess('Email verified successfully!');
      },
    );

    isLoading = false;
  }

  @action
  Future<void> signup({
    required String phoneNumber,
    String? email,
    String? name,
    String? password,
  }) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.signup(
      phoneNumber: phoneNumber,
      email: email,
      name: name,
      password: password,
    );

    result.fold(
      (failure) {
        print('AuthStore: API failed with error: $failure');
        _handleFailure(failure);
      },
      (user) {
        print('AuthStore: API succeeded');
        currentUser = user;
        ToastService.showSuccess('Account created successfully!');
      },
    );

    isLoading = false;
  }

  @action
  Future<void> resendOtp(String identifier) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.resendOtp(identifier);

    result.fold(
      (failure) {
        _handleFailure(failure);
      },
      (message) {
        ToastService.showSuccess('OTP resent successfully!');
      },
    );

    isLoading = false;
  }

  @action
  Future<void> login(String identifier, {String? password}) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.login(identifier, password: password);
    result.fold(
      (failure) => _handleFailure(failure),
      (user) => currentUser = user,
    );

    isLoading = false;
  }

  @action
  Future<void> logout() async {
    isLoading = true;
    error = null;

    final result = await _authRepository.logout();
    result.fold(
      (failure) => _handleFailure(failure),
      (_) => currentUser = null,
    );

    isLoading = false;
  }

  @action
  Future<void> getCurrentUser() async {
    isLoading = true;
    error = null;

    final result = await _authRepository.getCurrentUser();
    result.fold(
      (failure) => _handleFailure(failure),
      (user) => currentUser = user,
    );

    isLoading = false;
  }

  void _handleFailure(dynamic failure) {
    final String message = _extractServerMessage(failure);

    error = message;
    ToastService.showError(message);
  }

  String _extractServerMessage(dynamic failure) {
    // 1. DioException (PRIMARY – real backend errors)
    if (failure is DioException) {
      final response = failure.response;

      if (response != null) {
        final data = response.data;

        // JSON response
        if (data is Map<String, dynamic>) {
          if (data['message'] is String) return data['message'];
          if (data['error'] is String) return data['error'];
          if (data['errors'] is List && data['errors'].isNotEmpty) {
            return data['errors'].first.toString();
          }
        }

        // Plain string response
        if (data is String && data.isNotEmpty) {
          return data;
        }

        // Fallback with status code
        return 'Request failed (${response.statusCode})';
      }

      // Network / timeout errors
      switch (failure.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'Request timeout. Please try again.';
        case DioExceptionType.connectionError:
          return 'No internet connection.';
        default:
          return failure.message ?? 'Network error occurred.';
      }
    }

    // 2. Custom Failure class (Repository layer)
    if (failure.toString().contains('UnauthorizedFailure')) {
      return 'Session expired. Please login again.';
    } else if (failure.toString().contains('ForbiddenFailure')) {
      return 'Access denied. You don\'t have permission to perform this action.';
    } else if (failure.toString().contains('NotFoundFailure')) {
      return 'The requested resource was not found.';
    } else if (failure.toString().contains('NetworkFailure')) {
      return 'Network error. Please check your internet connection.';
    } else if (failure.toString().contains('ServerFailure')) {
      return 'Server error. Please try again later.';
    }

    // 3. Generic fallback
    return failure.toString().replaceAll('Failure: ', '');
  }

  @action
  Future<bool> refreshTokenIfNeeded() async {
    try {
      final refreshToken = await _secureStorage.read(key: 'refresh_token');
      if (refreshToken == null) {
        return false;
      }

      final result = await _profileRepository.refreshToken(refreshToken);
      return result.fold(
        (failure) {
          // Refresh failed, user needs to login again
          _handleFailure(failure);
          return false;
        },
        (newAccessToken) {
          // Token refreshed successfully
          ToastService.showSuccess('Session refreshed automatically.');
          return true;
        },
      );
    } catch (e) {
      error = 'Failed to refresh session';
      return false;
    }
  }

  @action
  Future<void> forgotPassword(String email) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.forgotPassword(email);
    result.fold(
      (failure) => _handleFailure(failure),
      (_) {
        ToastService.showSuccess('Password reset OTP sent to your email!');
      },
    );

    isLoading = false;
  }

  @action
  Future<void> resetPassword(
      String email, String otp, String newPassword) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.resetPassword(email, otp, newPassword);
    result.fold(
      (failure) => _handleFailure(failure),
      (user) {
        currentUser = user;
        ToastService.showSuccess('Password reset successfully!');
      },
    );

    isLoading = false;
  }
}
