// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$userAtom = Atom(name: '_ProfileStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProfileStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ProfileStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$biometricEnabledAtom =
      Atom(name: '_ProfileStore.biometricEnabled', context: context);

  @override
  bool get biometricEnabled {
    _$biometricEnabledAtom.reportRead();
    return super.biometricEnabled;
  }

  @override
  set biometricEnabled(bool value) {
    _$biometricEnabledAtom.reportWrite(value, super.biometricEnabled, () {
      super.biometricEnabled = value;
    });
  }

  late final _$priceUpdatesAtom =
      Atom(name: '_ProfileStore.priceUpdates', context: context);

  @override
  bool get priceUpdates {
    _$priceUpdatesAtom.reportRead();
    return super.priceUpdates;
  }

  @override
  set priceUpdates(bool value) {
    _$priceUpdatesAtom.reportWrite(value, super.priceUpdates, () {
      super.priceUpdates = value;
    });
  }

  late final _$loginEmailsAtom =
      Atom(name: '_ProfileStore.loginEmails', context: context);

  @override
  bool get loginEmails {
    _$loginEmailsAtom.reportRead();
    return super.loginEmails;
  }

  @override
  set loginEmails(bool value) {
    _$loginEmailsAtom.reportWrite(value, super.loginEmails, () {
      super.loginEmails = value;
    });
  }

  late final _$loadProfileDataAsyncAction =
      AsyncAction('_ProfileStore.loadProfileData', context: context);

  @override
  Future<void> loadProfileData({bool retryForPinSetup = false}) {
    return _$loadProfileDataAsyncAction
        .run(() => super.loadProfileData(retryForPinSetup: retryForPinSetup));
  }

  late final _$updateProfileAsyncAction =
      AsyncAction('_ProfileStore.updateProfile', context: context);

  @override
  Future<void> updateProfile(
      {required String name,
      String? profilePhoto,
      String? phone,
      required bool priceUpdates,
      required bool loginEmails}) {
    return _$updateProfileAsyncAction.run(() => super.updateProfile(
        name: name,
        profilePhoto: profilePhoto,
        phone: phone,
        priceUpdates: priceUpdates,
        loginEmails: loginEmails));
  }

  late final _$uploadProfilePhotoAsyncAction =
      AsyncAction('_ProfileStore.uploadProfilePhoto', context: context);

  @override
  Future<void> uploadProfilePhoto(String imagePath) {
    return _$uploadProfilePhotoAsyncAction
        .run(() => super.uploadProfilePhoto(imagePath));
  }

  late final _$toggleBiometricAsyncAction =
      AsyncAction('_ProfileStore.toggleBiometric', context: context);

  @override
  Future<void> toggleBiometric(bool enabled) {
    return _$toggleBiometricAsyncAction
        .run(() => super.toggleBiometric(enabled));
  }

  late final _$updatePinAsyncAction =
      AsyncAction('_ProfileStore.updatePin', context: context);

  @override
  Future<void> updatePin(String oldPin, String newPin) {
    return _$updatePinAsyncAction.run(() => super.updatePin(oldPin, newPin));
  }

  late final _$forgotPinAsyncAction =
      AsyncAction('_ProfileStore.forgotPin', context: context);

  @override
  Future<void> forgotPin(String email, String otp, String newPin) {
    return _$forgotPinAsyncAction
        .run(() => super.forgotPin(email, otp, newPin));
  }

  late final _$setupPinAsyncAction =
      AsyncAction('_ProfileStore.setupPin', context: context);

  @override
  Future<void> setupPin(String pin) {
    return _$setupPinAsyncAction.run(() => super.setupPin(pin));
  }

  late final _$refreshTokenAsyncAction =
      AsyncAction('_ProfileStore.refreshToken', context: context);

  @override
  Future<void> refreshToken() {
    return _$refreshTokenAsyncAction.run(() => super.refreshToken());
  }

  late final _$isTokenExpiredAsyncAction =
      AsyncAction('_ProfileStore.isTokenExpired', context: context);

  @override
  Future<bool> isTokenExpired() {
    return _$isTokenExpiredAsyncAction.run(() => super.isTokenExpired());
  }

  late final _$sendOtpToEmailAsyncAction =
      AsyncAction('_ProfileStore.sendOtpToEmail', context: context);

  @override
  Future<Either<Failure, void>> sendOtpToEmail(String email) {
    return _$sendOtpToEmailAsyncAction.run(() => super.sendOtpToEmail(email));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_ProfileStore.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_loadSettingsAsyncAction =
      AsyncAction('_ProfileStore._loadSettings', context: context);

  @override
  Future<void> _loadSettings() {
    return _$_loadSettingsAsyncAction.run(() => super._loadSettings());
  }

  late final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore', context: context);

  @override
  void setPriceUpdates(bool value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setPriceUpdates');
    try {
      return super.setPriceUpdates(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoginEmails(bool value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setLoginEmails');
    try {
      return super.setLoginEmails(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoading: ${isLoading},
error: ${error},
biometricEnabled: ${biometricEnabled},
priceUpdates: ${priceUpdates},
loginEmails: ${loginEmails}
    ''';
  }
}
