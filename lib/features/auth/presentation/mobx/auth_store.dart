import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_store.g.dart';

@injectable
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthRepository _authRepository;

  _AuthStore(this._authRepository);

  @observable
  User? currentUser;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @computed
  bool get isAuthenticated => currentUser != null;

  @action
  Future<void> sendOtp(String phoneNumber) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.sendOtp(phoneNumber);
    result.fold((failure) => error = failure.toString(), (_) => null);

    isLoading = false;
  }

  @action
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.verifyOtp(phoneNumber, otp);
    result.fold(
      (failure) => error = failure.toString(),
      (user) => currentUser = user,
    );

    isLoading = false;
  }

  @action
  Future<void> signup({
    required String phoneNumber,
    String? email,
    String? name,
  }) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.signup(
      phoneNumber: phoneNumber,
      email: email,
      name: name,
    );
    result.fold(
      (failure) => error = failure.toString(),
      (user) => currentUser = user,
    );

    isLoading = false;
  }

  @action
  Future<void> login(String phoneNumber) async {
    isLoading = true;
    error = null;

    final result = await _authRepository.login(phoneNumber);
    result.fold(
      (failure) => error = failure.toString(),
      (user) => currentUser = user,
    );

    isLoading = false;
  }

  @action
  Future<void> logout() async {
    isLoading = true;
    error = null;

    final result = await _authRepository.logout();
    result.fold(
      (failure) => error = failure.toString(),
      (_) => currentUser = null,
    );

    isLoading = false;
  }

  @action
  Future<void> getCurrentUser() async {
    isLoading = true;
    error = null;

    final result = await _authRepository.getCurrentUser();
    result.fold(
      (failure) => error = failure.toString(),
      (user) => currentUser = user,
    );

    isLoading = false;
  }
}
