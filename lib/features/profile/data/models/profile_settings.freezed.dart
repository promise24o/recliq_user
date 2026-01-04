// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileSettings {
  bool get biometricEnabled => throw _privateConstructorUsedError;
  bool get priceUpdates => throw _privateConstructorUsedError;
  bool get loginEmails => throw _privateConstructorUsedError;
  String? get profilePhotoUrl => throw _privateConstructorUsedError;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileSettingsCopyWith<ProfileSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSettingsCopyWith<$Res> {
  factory $ProfileSettingsCopyWith(
          ProfileSettings value, $Res Function(ProfileSettings) then) =
      _$ProfileSettingsCopyWithImpl<$Res, ProfileSettings>;
  @useResult
  $Res call(
      {bool biometricEnabled,
      bool priceUpdates,
      bool loginEmails,
      String? profilePhotoUrl});
}

/// @nodoc
class _$ProfileSettingsCopyWithImpl<$Res, $Val extends ProfileSettings>
    implements $ProfileSettingsCopyWith<$Res> {
  _$ProfileSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? biometricEnabled = null,
    Object? priceUpdates = null,
    Object? loginEmails = null,
    Object? profilePhotoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      priceUpdates: null == priceUpdates
          ? _value.priceUpdates
          : priceUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      loginEmails: null == loginEmails
          ? _value.loginEmails
          : loginEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileSettingsImplCopyWith<$Res>
    implements $ProfileSettingsCopyWith<$Res> {
  factory _$$ProfileSettingsImplCopyWith(_$ProfileSettingsImpl value,
          $Res Function(_$ProfileSettingsImpl) then) =
      __$$ProfileSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool biometricEnabled,
      bool priceUpdates,
      bool loginEmails,
      String? profilePhotoUrl});
}

/// @nodoc
class __$$ProfileSettingsImplCopyWithImpl<$Res>
    extends _$ProfileSettingsCopyWithImpl<$Res, _$ProfileSettingsImpl>
    implements _$$ProfileSettingsImplCopyWith<$Res> {
  __$$ProfileSettingsImplCopyWithImpl(
      _$ProfileSettingsImpl _value, $Res Function(_$ProfileSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? biometricEnabled = null,
    Object? priceUpdates = null,
    Object? loginEmails = null,
    Object? profilePhotoUrl = freezed,
  }) {
    return _then(_$ProfileSettingsImpl(
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      priceUpdates: null == priceUpdates
          ? _value.priceUpdates
          : priceUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      loginEmails: null == loginEmails
          ? _value.loginEmails
          : loginEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProfileSettingsImpl implements _ProfileSettings {
  const _$ProfileSettingsImpl(
      {required this.biometricEnabled,
      required this.priceUpdates,
      required this.loginEmails,
      this.profilePhotoUrl});

  @override
  final bool biometricEnabled;
  @override
  final bool priceUpdates;
  @override
  final bool loginEmails;
  @override
  final String? profilePhotoUrl;

  @override
  String toString() {
    return 'ProfileSettings(biometricEnabled: $biometricEnabled, priceUpdates: $priceUpdates, loginEmails: $loginEmails, profilePhotoUrl: $profilePhotoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSettingsImpl &&
            (identical(other.biometricEnabled, biometricEnabled) ||
                other.biometricEnabled == biometricEnabled) &&
            (identical(other.priceUpdates, priceUpdates) ||
                other.priceUpdates == priceUpdates) &&
            (identical(other.loginEmails, loginEmails) ||
                other.loginEmails == loginEmails) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, biometricEnabled, priceUpdates,
      loginEmails, profilePhotoUrl);

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSettingsImplCopyWith<_$ProfileSettingsImpl> get copyWith =>
      __$$ProfileSettingsImplCopyWithImpl<_$ProfileSettingsImpl>(
          this, _$identity);
}

abstract class _ProfileSettings implements ProfileSettings {
  const factory _ProfileSettings(
      {required final bool biometricEnabled,
      required final bool priceUpdates,
      required final bool loginEmails,
      final String? profilePhotoUrl}) = _$ProfileSettingsImpl;

  @override
  bool get biometricEnabled;
  @override
  bool get priceUpdates;
  @override
  bool get loginEmails;
  @override
  String? get profilePhotoUrl;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSettingsImplCopyWith<_$ProfileSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
