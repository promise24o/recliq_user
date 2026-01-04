import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../../../auth/domain/entities/user.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../../../shared/services/toast_service.dart';
import '../../../../core/errors/failures.dart';

part 'profile_store.g.dart';

@lazySingleton
class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final ProfileRepository _profileRepository;
  @Named('secure_storage')
  final FlutterSecureStorage _secureStorage;

  _ProfileStore(this._profileRepository, this._secureStorage);

  String? _formatPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) return null;

    // Remove the +234 country code and replace with 0
    if (phoneNumber.startsWith('+234')) {
      return '0' + phoneNumber.substring(4);
    }

    // If it already starts with 0, return as is
    if (phoneNumber.startsWith('0')) {
      return phoneNumber;
    }

    // If it's in some other format, try to handle it
    return phoneNumber;
  }

  /// Converts phone number from local format (09031292712) to international format (+2349031292712)
  String? _formatPhoneNumberForAPI(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) return null;

    // If it starts with 0, replace with +234
    if (phoneNumber.startsWith('0') && phoneNumber.length >= 11) {
      return '+234' + phoneNumber.substring(1);
    }

    // If it already starts with +234, return as is
    if (phoneNumber.startsWith('+234')) {
      return phoneNumber;
    }

    // If it's in some other format, try to handle it
    return phoneNumber;
  }

  @observable
  User? user;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  bool biometricEnabled = false;

  @observable
  bool priceUpdates = true;

  @observable
  bool loginEmails = true;

  @action
  Future<void> loadProfileData({bool retryForPinSetup = false}) async {
    isLoading = true;
    error = null;

    try {
      final result = await _profileRepository.getCurrentUser();
      result.fold(
        (failure) => _handleFailure(failure),
        (userData) async {
          // Format phone number from international to local format
          final formattedUserData = userData.copyWith(
            phoneNumber: _formatPhoneNumber(userData.phoneNumber),
          );
          user = formattedUserData;
          // Load settings from secure storage or defaults
          await _loadSettings();

          // If this is a retry for PIN setup and hasPin is still false, try again
          if (retryForPinSetup && userData.hasPin == false) {
            // Wait a bit more and retry once more
            await Future.delayed(const Duration(milliseconds: 1000));
            final retryResult = await _profileRepository.getCurrentUser();
            retryResult.fold(
              (failure) => _handleFailure(failure),
              (retryUserData) {
                // Format phone number from international to local format
                final formattedRetryUserData = retryUserData.copyWith(
                  phoneNumber: _formatPhoneNumber(retryUserData.phoneNumber),
                );
                user = formattedRetryUserData;
                _loadSettings();
              },
            );
          }
        },
      );
    } catch (e) {
      error = "Failed to load profile data";
    }

    isLoading = false;
  }

  @action
  Future<void> updateProfile({
    required String name,
    String? profilePhoto,
    String? phone,
    required bool priceUpdates,
    required bool loginEmails,
  }) async {
    isLoading = true;
    error = null;

    try {
      final result = await _profileRepository.updateProfile(
        name: name,
        profilePhoto: profilePhoto,
        phone: _formatPhoneNumberForAPI(phone),
        priceUpdates: priceUpdates,
        loginEmails: loginEmails,
      );

      result.fold(
        (failure) => _handleFailure(failure),
        (updatedUser) {
          // Format phone number from international to local format
          final formattedUpdatedUser = updatedUser.copyWith(
            phoneNumber: _formatPhoneNumber(updatedUser.phoneNumber),
          );
          user = formattedUpdatedUser;
          this.priceUpdates = priceUpdates;
          this.loginEmails = loginEmails;
          // Save updated user data to secure storage
          _secureStorage.write(
              key: 'user_data',
              value: jsonEncode(formattedUpdatedUser.toJson()));

          _saveSettings();
        },
      );
    } catch (e) {
      error = "Failed to update profile";
    }

    isLoading = false;
  }

  @action
  Future<void> uploadProfilePhoto(String imagePath) async {
    isLoading = true;
    error = null;

    try {
      final result = await _profileRepository.uploadProfilePhoto(imagePath);
      result.fold(
        (failure) => _handleFailure(failure),
        (photoUrl) {
          if (user != null) {
            user = user!.copyWith(profilePhoto: photoUrl);
            // Save updated user data to secure storage
            _secureStorage.write(
                key: 'user_data', value: jsonEncode(user!.toJson()));
          }
        },
      );
    } catch (e) {
      error = "Failed to upload photo";
    }

    isLoading = false;
  }

  @action
  Future<void> toggleBiometric(bool enabled) async {
    isLoading = true;
    error = null;

    try {
      final result = await _profileRepository.toggleBiometric(enabled);
      result.fold(
        (failure) => _handleFailure(failure),
        (_) {
          biometricEnabled = enabled;
          _saveSettings();
        },
      );
    } catch (e) {
      error = "Failed to update biometric settings";
    }

    isLoading = false;
  }

  @action
  Future<void> updatePin(String oldPin, String newPin) async {
    isLoading = true;
    error = null;

    final result = await _profileRepository.updatePin(oldPin, newPin);
    result.fold(
      (failure) => _handleFailure(failure),
      (_) {
        ToastService.showSuccess('PIN updated successfully!');
      },
    );

    isLoading = false;
  }

  @action
  Future<void> forgotPin(String email, String otp, String newPin) async {
    isLoading = true;
    error = null;

    final result = await _profileRepository.forgotPin(email, otp, newPin);
    result.fold(
      (failure) => _handleFailure(failure),
      (_) async {
        ToastService.showSuccess('PIN reset successfully!');
        // Refresh user data to update hasPin status
        await loadProfileData();
      },
    );

    isLoading = false;
  }

  @action
  Future<void> setupPin(String pin) async {
    isLoading = true;
    error = null;

    try {
      final result = await _profileRepository.setupPin(pin);
      result.fold(
        (failure) => _handleFailure(failure),
        (_) async {
          // PIN setup successful, show success message
          ToastService.showSuccess('PIN set up successfully!');

          // Add a small delay to ensure backend has updated the hasPin field
          await Future.delayed(const Duration(milliseconds: 500));

          // Refresh user data with retry mechanism for PIN setup
          await loadProfileData(retryForPinSetup: true);
        },
      );
    } catch (e) {
      error = "Failed to setup PIN";
    }

    isLoading = false;
  }

  @action
  Future<void> refreshToken() async {
    isLoading = true;
    error = null;

    try {
      final refreshToken = await _secureStorage.read(key: 'refresh_token');
      if (refreshToken == null) {
        error = "No refresh token available";
        return;
      }

      final result = await _profileRepository.refreshToken(refreshToken);
      result.fold(
        (failure) => _handleFailure(failure),
        (newAccessToken) {
          // Token refreshed successfully
          ToastService.showSuccess('Session refreshed successfully!');
        },
      );
    } catch (e) {
      error = "Failed to refresh token";
    }

    isLoading = false;
  }

  @action
  Future<bool> isTokenExpired() async {
    try {
      final result = await _profileRepository.getCurrentUser();
      return result.fold(
        (failure) => true, // If we can't get user, assume token is expired
        (user) => false, // If we can get user, token is valid
      );
    } catch (e) {
      return true;
    }
  }

  @action
  Future<Either<Failure, void>> sendOtpToEmail(String email) async {
    isLoading = true;
    error = null;

    try {
      final result = await _profileRepository.sendOtpToEmail(email);
      result.fold(
        (failure) => _handleFailure(failure),
        (_) {
          // OTP sent successfully
          ToastService.showSuccess('OTP sent to your email!');
        },
      );
      return result;
    } catch (e) {
      error = "Failed to send OTP";
      return Left(ServerFailure(e.toString()));
    } finally {
      isLoading = false;
    }
  }

  @action
  void setPriceUpdates(bool value) {
    priceUpdates = value;
    _saveSettings();
  }

  @action
  void setLoginEmails(bool value) {
    loginEmails = value;
    _saveSettings();
  }

  @action
  Future<void> logout() async {
    isLoading = true;
    error = null;

    try {
      // Clear stored tokens and user data from secure storage
      await _secureStorage.delete(key: 'access_token');
      await _secureStorage.delete(key: 'refresh_token');
      await _secureStorage.delete(key: 'user_data');

      // Clear local data
      user = null;
      biometricEnabled = false;
      priceUpdates = true;
      loginEmails = true;
      await _clearSettings();
    } catch (e) {
      error = "Failed to logout";
    }

    isLoading = false;
  }

  @action
  Future<void> _loadSettings() async {
    biometricEnabled =
        await _secureStorage.read(key: 'biometric_enabled') == 'true';
    priceUpdates = await _secureStorage.read(key: 'price_updates') != 'false';
    loginEmails = await _secureStorage.read(key: 'login_emails') != 'false';
  }

  Future<void> _saveSettings() async {
    await _secureStorage.write(
        key: 'biometric_enabled', value: biometricEnabled.toString());
    await _secureStorage.write(
        key: 'price_updates', value: priceUpdates.toString());
    await _secureStorage.write(
        key: 'login_emails', value: loginEmails.toString());
  }

  Future<void> _clearSettings() async {
    await _secureStorage.delete(key: 'biometric_enabled');
    await _secureStorage.delete(key: 'price_updates');
    await _secureStorage.delete(key: 'login_emails');
  }

  void _handleFailure(dynamic failure) {
    error = _extractServerMessage(failure);
    ToastService.showError(error!);
  }

  String _extractServerMessage(dynamic failure) {
    final failureString = failure.toString();

    // Handle UnauthorizedFailure(message: Unauthorized) pattern
    if (failureString.contains('UnauthorizedFailure(message:')) {
      final startIndex =
          failureString.indexOf('message:') + 8; // 'message:' length
      final endIndex = failureString.indexOf(')', startIndex);
      if (endIndex != -1) {
        return failureString.substring(startIndex, endIndex).trim();
      }
    }

    // Handle Failure.serverError(message: Unauthorized) pattern
    if (failureString.contains('Failure.serverError(message:')) {
      final startIndex =
          failureString.indexOf('message:') + 8; // 'message:' length
      final endIndex = failureString.indexOf(')', startIndex);
      if (endIndex != -1) {
        return failureString.substring(startIndex, endIndex).trim();
      }
    }

    // Handle other message patterns
    if (failureString.contains('message')) {
      // Look for various message patterns
      final patterns = [
        'message":"',
        "message':'",
        'message: ',
        'message = ',
      ];

      for (final pattern in patterns) {
        final index = failureString.indexOf(pattern);
        if (index != -1) {
          final startIndex = index + pattern.length;
          var endIndex = failureString.indexOf('"', startIndex);
          if (endIndex == -1) {
            endIndex = failureString.indexOf("'", startIndex);
          }
          if (endIndex == -1) {
            endIndex = failureString.indexOf(',', startIndex);
          }
          if (endIndex == -1) {
            endIndex = failureString.indexOf('}', startIndex);
          }
          if (endIndex != -1) {
            return failureString.substring(startIndex, endIndex).trim();
          }
        }
      }
    }

    return failureString.replaceAll('Exception: ', '');
  }
}
