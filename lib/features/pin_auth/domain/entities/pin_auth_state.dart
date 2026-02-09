import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_auth_state.freezed.dart';

@freezed
class PinAuthState with _$PinAuthState {
  const factory PinAuthState({
    @Default(false) bool isAuthenticated,
    @Default(false) bool isBiometricEnabled,
    @Default(false) bool isPinSet,
    @Default(0) int failedAttempts,
    @Default(3) int maxAttempts,
    @Default('') String userFullName,
    @Default('') String userPhoto,
    @Default('') String errorMessage,
    @Default(false) bool isBlocked,
    @Default(false) bool isLoading,
  }) = _PinAuthState;

  const PinAuthState._();

  bool get isPinBlocked => failedAttempts >= maxAttempts;

  int get remainingAttempts => maxAttempts - failedAttempts;

  String get blockedMessage =>
      'Too many failed attempts. Please try again in 1 hour or sign in with password.';
}
