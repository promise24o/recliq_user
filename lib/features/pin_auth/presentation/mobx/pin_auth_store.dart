import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entities/pin_auth_state.dart';
import '../../domain/repositories/pin_auth_repository.dart';
import '../../domain/usecases/verify_pin.dart';
import '../../domain/usecases/authenticate_with_biometric.dart';
import '../../domain/usecases/get_pin_auth_state.dart';
import '../../../../shared/services/toast_service.dart';
import '../../../../core/errors/failures.dart';

part 'pin_auth_store.g.dart';

class PinAuthStore = _PinAuthStore with _$PinAuthStore;

abstract class _PinAuthStore with Store {
  final VerifyPin _verifyPin;
  final AuthenticateWithBiometric _authenticateWithBiometric;
  final GetPinAuthState _getPinAuthState;
  final PinAuthRepository _repository;

  _PinAuthStore({
    required VerifyPin verifyPin,
    required AuthenticateWithBiometric authenticateWithBiometric,
    required GetPinAuthState getPinAuthState,
    required PinAuthRepository repository,
  })  : _verifyPin = verifyPin,
        _authenticateWithBiometric = authenticateWithBiometric,
        _getPinAuthState = getPinAuthState,
        _repository = repository;

  @observable
  PinAuthState authState = const PinAuthState();

  @observable
  String pinInput = '';

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @computed
  bool get isPinComplete => pinInput.length == 4;

  @computed
  bool get canAddDigit => pinInput.length < 4 && !authState.isBlocked;

  @computed
  bool get isAuthenticated => authState.isAuthenticated;

  @computed
  bool get isBiometricAvailable =>
      authState.isBiometricEnabled && authState.isPinSet;

  @action
  Future<void> initializeAuth() async {
    try {
      isLoading = true;
      errorMessage = '';

      final result = await _getPinAuthState();

      result.fold(
        (failure) {
          errorMessage = _extractServerMessage(failure);
        },
        (state) {
          authState = state;
        },
      );
    } catch (e) {
      errorMessage = 'Failed to initialize authentication';
    } finally {
      isLoading = false;
    }
  }

  @action
  void addPinDigit(int digit) {
    if (canAddDigit) {
      HapticFeedback.lightImpact();
      pinInput += digit.toString();
      print('DEBUG: Added digit: $digit, current PIN: $pinInput');

      if (isPinComplete) {
        print('DEBUG: PIN is complete, verifying...');
        verifyPin();
      }
    }
  }

  @action
  void removePinDigit() {
    if (pinInput.isNotEmpty) {
      HapticFeedback.selectionClick();
      pinInput = pinInput.substring(0, pinInput.length - 1);
    }
  }

  @action
  void clearPinInput() {
    pinInput = '';
  }

  @action
  Future<void> verifyPin() async {
    if (!isPinComplete || isLoading) return;

    print('DEBUG: Starting PIN verification for PIN: $pinInput');

    try {
      isLoading = true;
      errorMessage = '';

      final result = await _verifyPin(pinInput);
      print('DEBUG: PIN verification result: $result');

      result.fold(
        (failure) {
          print('DEBUG: PIN verification failed: $failure');
          HapticFeedback.heavyImpact();
          errorMessage = _extractServerMessage(failure);
          clearPinInput();

          // Refresh state to get updated failed attempts
          initializeAuth();
        },
        (success) {
          if (success) {
            print('DEBUG: PIN verification successful!');
            HapticFeedback.lightImpact();
            authState = authState.copyWith(isAuthenticated: true);
            ToastService.showSuccess('Authentication successful!');
          }
        },
      );
    } catch (e) {
      print('DEBUG: PIN verification error: $e');
      errorMessage = 'Authentication failed';
      clearPinInput();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> authenticateWithBiometric() async {
    if (isLoading) return;

    print('DEBUG: Starting biometric authentication...');

    try {
      isLoading = true;
      errorMessage = '';

      final result = await _authenticateWithBiometric();
      print('DEBUG: Biometric authentication result: $result');

      result.fold(
        (failure) {
          print('DEBUG: Biometric authentication failed: $failure');
          HapticFeedback.heavyImpact();
          errorMessage = _extractServerMessage(failure);
        },
        (success) {
          if (success) {
            print('DEBUG: Biometric authentication successful!');
            HapticFeedback.lightImpact();
            authState = authState.copyWith(isAuthenticated: true);
            ToastService.showSuccess('Biometric authentication successful!');
          } else {
            print('DEBUG: Biometric authentication cancelled or failed');
            // Don't show an error message - user likely cancelled
          }
        },
      );
    } catch (e) {
      print('DEBUG: Biometric authentication error: $e');
      errorMessage = 'Biometric authentication failed';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> signOut() async {
    try {
      await _repository.signOut();
      clearPinInput();
      authState = const PinAuthState();
    } catch (e) {
      errorMessage = 'Failed to sign out';
    }
  }

  @action
  void clearError() {
    errorMessage = '';
  }

  String _extractServerMessage(Failure failure) {
    // Use proper Freezed pattern matching for Failure objects
    try {
      return failure.when(
        serverError: (message) => message ?? 'Server error. Please try again.',
        networkError: (message) =>
            message ?? 'Network error. Please check your internet connection.',
        invalidInput: (message) =>
            message ?? 'Invalid input. Please check your details.',
        unauthorized: (message) =>
            message ?? 'Session expired. Please login again.',
        forbidden: (message) =>
            message ??
            'Access denied. You don\'t have permission to perform this action.',
        notFound: (message) =>
            message ?? 'The requested resource was not found.',
        cacheError: (message) => message ?? 'Cache error. Please try again.',
        biometricError: (message) =>
            message ?? 'Biometric authentication failed. Please try again.',
        unexpected: (message) =>
            message ?? 'Something went wrong. Please try again.',
      );
    } catch (e) {
      // Fallback if pattern matching fails
      final failureString = failure.toString();

      // Try to extract message from Failure.serverError(message: xxx) pattern
      if (failureString.contains('Failure.serverError(message:')) {
        final startIndex = failureString.indexOf('message:') + 8;
        final endIndex = failureString.indexOf(')', startIndex);
        if (endIndex != -1) {
          final message = failureString.substring(startIndex, endIndex).trim();
          if (message.isNotEmpty && message != 'null') {
            return message;
          }
        }
      }

      // Clean up any remaining Failure prefixes
      return failureString
          .replaceAll(RegExp(r'^Failure\.[^:]+\(message:\s*'), '')
          .replaceAll(RegExp(r'\)$'), '');
    }
  }
}
