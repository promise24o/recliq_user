// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      phoneNumber: json['phone'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      hasPin: json['hasPin'] as bool? ?? false,
      walletBalance: (json['walletBalance'] as num?)?.toDouble() ?? 0.0,
      profilePhoto: json['profilePhoto'] as String?,
      referralCode: json['referralCode'] as String?,
      pin: json['pin'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      notifications: json['notifications'] == null
          ? null
          : Notifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phoneNumber,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'hasPin': instance.hasPin,
      'walletBalance': instance.walletBalance,
      'profilePhoto': instance.profilePhoto,
      'referralCode': instance.referralCode,
      'pin': instance.pin,
      'location': instance.location,
      'notifications': instance.notifications,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$NotificationsImpl _$$NotificationsImplFromJson(Map<String, dynamic> json) =>
    _$NotificationsImpl(
      loginAlerts: json['loginAlerts'] == null
          ? null
          : NotificationSettings.fromJson(
              json['loginAlerts'] as Map<String, dynamic>),
      passwordChanges: json['passwordChanges'] == null
          ? null
          : NotificationSettings.fromJson(
              json['passwordChanges'] as Map<String, dynamic>),
      failedLoginAttempts: json['failedLoginAttempts'] == null
          ? null
          : NotificationSettings.fromJson(
              json['failedLoginAttempts'] as Map<String, dynamic>),
      pickupEscalations: json['pickupEscalations'] == null
          ? null
          : NotificationSettings.fromJson(
              json['pickupEscalations'] as Map<String, dynamic>),
      agentStatusChanges: json['agentStatusChanges'] == null
          ? null
          : NotificationSettings.fromJson(
              json['agentStatusChanges'] as Map<String, dynamic>),
      paymentApprovals: json['paymentApprovals'] == null
          ? null
          : NotificationSettings.fromJson(
              json['paymentApprovals'] as Map<String, dynamic>),
      floatAlerts: json['floatAlerts'] == null
          ? null
          : NotificationSettings.fromJson(
              json['floatAlerts'] as Map<String, dynamic>),
      systemUpdates: json['systemUpdates'] == null
          ? null
          : NotificationSettings.fromJson(
              json['systemUpdates'] as Map<String, dynamic>),
      priceUpdates: json['priceUpdates'] as bool?,
      loginEmails: json['loginEmails'] as bool?,
    );

Map<String, dynamic> _$$NotificationsImplToJson(_$NotificationsImpl instance) =>
    <String, dynamic>{
      'loginAlerts': instance.loginAlerts,
      'passwordChanges': instance.passwordChanges,
      'failedLoginAttempts': instance.failedLoginAttempts,
      'pickupEscalations': instance.pickupEscalations,
      'agentStatusChanges': instance.agentStatusChanges,
      'paymentApprovals': instance.paymentApprovals,
      'floatAlerts': instance.floatAlerts,
      'systemUpdates': instance.systemUpdates,
      'priceUpdates': instance.priceUpdates,
      'loginEmails': instance.loginEmails,
    };

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      email: json['email'] as bool?,
      inApp: json['inApp'] as bool?,
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'inApp': instance.inApp,
    };
