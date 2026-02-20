import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'coordinates') List<double>? coordinates,
    String? address,
    String? city,
    String? state,
    String? country,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    @JsonKey(name: 'phone') String? phoneNumber,
    String? email,
    String? name,
    String? role,
    @Default(false) bool isVerified,
    @Default(false) bool hasPin,
    @Default(0.0) double walletBalance,
    String? profilePhoto,
    String? referralCode,
    String? pin, // Add PIN field
    Location? location,
    @JsonKey(name: 'notifications') Notifications? notifications,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Notifications with _$Notifications {
  const factory Notifications({
    @JsonKey(name: 'loginAlerts') NotificationSettings? loginAlerts,
    @JsonKey(name: 'passwordChanges') NotificationSettings? passwordChanges,
    @JsonKey(name: 'failedLoginAttempts') NotificationSettings? failedLoginAttempts,
    @JsonKey(name: 'pickupEscalations') NotificationSettings? pickupEscalations,
    @JsonKey(name: 'agentStatusChanges') NotificationSettings? agentStatusChanges,
    @JsonKey(name: 'paymentApprovals') NotificationSettings? paymentApprovals,
    @JsonKey(name: 'floatAlerts') NotificationSettings? floatAlerts,
    @JsonKey(name: 'systemUpdates') NotificationSettings? systemUpdates,
    @JsonKey(name: 'priceUpdates') bool? priceUpdates,
    @JsonKey(name: 'loginEmails') bool? loginEmails,
  }) = _Notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    bool? email,
    bool? inApp,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => _$NotificationSettingsFromJson(json);
}
