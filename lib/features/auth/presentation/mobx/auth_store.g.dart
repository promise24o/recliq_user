// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: '_AuthStore.isAuthenticated'))
          .value;

  late final _$currentUserAtom =
      Atom(name: '_AuthStore.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AuthStore.isLoading', context: context);

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

  late final _$errorAtom = Atom(name: '_AuthStore.error', context: context);

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

  late final _$sendOtpAsyncAction =
      AsyncAction('_AuthStore.sendOtp', context: context);

  @override
  Future<void> sendOtp(String phoneNumber) {
    return _$sendOtpAsyncAction.run(() => super.sendOtp(phoneNumber));
  }

  late final _$verifyOtpAsyncAction =
      AsyncAction('_AuthStore.verifyOtp', context: context);

  @override
  Future<void> verifyOtp(String phoneNumber, String otp) {
    return _$verifyOtpAsyncAction.run(() => super.verifyOtp(phoneNumber, otp));
  }

  late final _$verifyOtpEmailAsyncAction =
      AsyncAction('_AuthStore.verifyOtpEmail', context: context);

  @override
  Future<void> verifyOtpEmail(String email, String otp) {
    return _$verifyOtpEmailAsyncAction
        .run(() => super.verifyOtpEmail(email, otp));
  }

  late final _$signupAsyncAction =
      AsyncAction('_AuthStore.signup', context: context);

  @override
  Future<void> signup(
      {required String phoneNumber,
      String? email,
      String? name,
      String? password}) {
    return _$signupAsyncAction.run(() => super.signup(
        phoneNumber: phoneNumber,
        email: email,
        name: name,
        password: password));
  }

  late final _$resendOtpAsyncAction =
      AsyncAction('_AuthStore.resendOtp', context: context);

  @override
  Future<void> resendOtp(String identifier) {
    return _$resendOtpAsyncAction.run(() => super.resendOtp(identifier));
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStore.login', context: context);

  @override
  Future<void> login(String identifier, {String? password}) {
    return _$loginAsyncAction
        .run(() => super.login(identifier, password: password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStore.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$getCurrentUserAsyncAction =
      AsyncAction('_AuthStore.getCurrentUser', context: context);

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  late final _$refreshTokenIfNeededAsyncAction =
      AsyncAction('_AuthStore.refreshTokenIfNeeded', context: context);

  @override
  Future<bool> refreshTokenIfNeeded() {
    return _$refreshTokenIfNeededAsyncAction
        .run(() => super.refreshTokenIfNeeded());
  }

  late final _$forgotPasswordAsyncAction =
      AsyncAction('_AuthStore.forgotPassword', context: context);

  @override
  Future<void> forgotPassword(String email) {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword(email));
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_AuthStore.resetPassword', context: context);

  @override
  Future<void> resetPassword(String email, String otp, String newPassword) {
    return _$resetPasswordAsyncAction
        .run(() => super.resetPassword(email, otp, newPassword));
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
isLoading: ${isLoading},
error: ${error},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
