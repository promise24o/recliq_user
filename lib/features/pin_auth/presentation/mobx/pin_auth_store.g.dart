// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PinAuthStore on _PinAuthStore, Store {
  Computed<bool>? _$isPinCompleteComputed;

  @override
  bool get isPinComplete =>
      (_$isPinCompleteComputed ??= Computed<bool>(() => super.isPinComplete,
              name: '_PinAuthStore.isPinComplete'))
          .value;
  Computed<bool>? _$canAddDigitComputed;

  @override
  bool get canAddDigit =>
      (_$canAddDigitComputed ??= Computed<bool>(() => super.canAddDigit,
              name: '_PinAuthStore.canAddDigit'))
          .value;
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: '_PinAuthStore.isAuthenticated'))
          .value;
  Computed<bool>? _$isBiometricAvailableComputed;

  @override
  bool get isBiometricAvailable => (_$isBiometricAvailableComputed ??=
          Computed<bool>(() => super.isBiometricAvailable,
              name: '_PinAuthStore.isBiometricAvailable'))
      .value;

  late final _$authStateAtom =
      Atom(name: '_PinAuthStore.authState', context: context);

  @override
  PinAuthState get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(PinAuthState value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  late final _$pinInputAtom =
      Atom(name: '_PinAuthStore.pinInput', context: context);

  @override
  String get pinInput {
    _$pinInputAtom.reportRead();
    return super.pinInput;
  }

  @override
  set pinInput(String value) {
    _$pinInputAtom.reportWrite(value, super.pinInput, () {
      super.pinInput = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PinAuthStore.isLoading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_PinAuthStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$initializeAuthAsyncAction =
      AsyncAction('_PinAuthStore.initializeAuth', context: context);

  @override
  Future<void> initializeAuth() {
    return _$initializeAuthAsyncAction.run(() => super.initializeAuth());
  }

  late final _$verifyPinAsyncAction =
      AsyncAction('_PinAuthStore.verifyPin', context: context);

  @override
  Future<void> verifyPin() {
    return _$verifyPinAsyncAction.run(() => super.verifyPin());
  }

  late final _$authenticateWithBiometricAsyncAction =
      AsyncAction('_PinAuthStore.authenticateWithBiometric', context: context);

  @override
  Future<void> authenticateWithBiometric() {
    return _$authenticateWithBiometricAsyncAction
        .run(() => super.authenticateWithBiometric());
  }

  late final _$signOutAsyncAction =
      AsyncAction('_PinAuthStore.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$_PinAuthStoreActionController =
      ActionController(name: '_PinAuthStore', context: context);

  @override
  void addPinDigit(int digit) {
    final _$actionInfo = _$_PinAuthStoreActionController.startAction(
        name: '_PinAuthStore.addPinDigit');
    try {
      return super.addPinDigit(digit);
    } finally {
      _$_PinAuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePinDigit() {
    final _$actionInfo = _$_PinAuthStoreActionController.startAction(
        name: '_PinAuthStore.removePinDigit');
    try {
      return super.removePinDigit();
    } finally {
      _$_PinAuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearPinInput() {
    final _$actionInfo = _$_PinAuthStoreActionController.startAction(
        name: '_PinAuthStore.clearPinInput');
    try {
      return super.clearPinInput();
    } finally {
      _$_PinAuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_PinAuthStoreActionController.startAction(
        name: '_PinAuthStore.clearError');
    try {
      return super.clearError();
    } finally {
      _$_PinAuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authState: ${authState},
pinInput: ${pinInput},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isPinComplete: ${isPinComplete},
canAddDigit: ${canAddDigit},
isAuthenticated: ${isAuthenticated},
isBiometricAvailable: ${isBiometricAvailable}
    ''';
  }
}
