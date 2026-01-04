import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings.freezed.dart';

@freezed
class ProfileSettings with _$ProfileSettings {
  const factory ProfileSettings({
    required bool biometricEnabled,
    required bool priceUpdates,
    required bool loginEmails,
    String? profilePhotoUrl,
  }) = _ProfileSettings;
}
