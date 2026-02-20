import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../features/auth/presentation/mobx/auth_store.dart';
import '../../features/profile/presentation/mobx/profile_store.dart';
import '../../features/wallet/presentation/mobx/wallet_store.dart';
import '../../features/wallet/presentation/mobx/bank_accounts_store.dart';
import '../../features/notifications/presentation/mobx/notification_store.dart';
import '../../features/rewards/presentation/mobx/rewards_store.dart';
import '../../features/pin_auth/data/datasources/pin_auth_local_datasource.dart';
import '../../features/pin_auth/data/repositories/pin_auth_repository_impl.dart';
import '../../features/pin_auth/domain/repositories/pin_auth_repository.dart';
import '../../features/pin_auth/domain/usecases/verify_pin.dart';
import '../../features/pin_auth/domain/usecases/authenticate_with_biometric.dart';
import '../../features/pin_auth/domain/usecases/get_pin_auth_state.dart';
import '../../features/pin_auth/presentation/mobx/pin_auth_store.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/repositories/onboarding_repository.dart';
import '../../features/auth/data/repositories/onboarding_repository_impl.dart';
import '../../features/auth/data/datasources/onboarding_secure_storage.dart';
import '../../features/auth/domain/usecases/get_onboarding_status.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/wallet/domain/repositories/wallet_repository.dart';
import '../../features/wallet/data/repositories/wallet_repository_impl.dart';
import '../../features/wallet/data/datasources/wallet_remote_data_source.dart';
import '../../features/wallet/data/datasources/wallet_local_data_source.dart';
import '../../features/notifications/domain/repositories/notification_repository.dart';
import '../../features/notifications/data/repositories/notification_repository_impl.dart';
import '../../features/notifications/data/datasources/notification_remote_data_source.dart';
import '../../features/notifications/data/datasources/notification_local_data_source.dart';
import '../../features/rewards/domain/repositories/rewards_repository.dart';
import '../../features/rewards/data/repositories/rewards_repository_impl.dart';
import '../../features/rewards/data/datasources/rewards_datasource.dart';
import '../../features/rewards/data/datasources/rewards_datasource_impl.dart';
import '../../features/rewards/data/datasources/rewards_remote_data_source.dart';
import '../../features/kyc/domain/repositories/kyc_repository.dart';
import '../../features/kyc/data/repositories/kyc_repository_impl.dart';
import '../../features/kyc/data/datasources/kyc_remote_datasource.dart';
import '../../core/network/network_info.dart';
import '../config/app_config.dart';
import '../../features/auth/domain/usecases/complete_onboarding.dart';
import '../interceptors/auth_interceptor.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  final secureStorage = const FlutterSecureStorage();
  final localAuth = LocalAuthentication();
  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    validateStatus: (status) => status != null && status < 500,
  ));
  dio.interceptors.add(AuthInterceptor(secureStorage));

  // Register singletons
  getIt.registerSingleton(sharedPreferences);
  getIt.registerSingleton(secureStorage);
  getIt.registerSingleton(localAuth);
  getIt.registerSingleton(dio);
  getIt.registerSingleton(NetworkInfoImpl(
    connectionChecker: InternetConnectionChecker.createInstance(),
  ));

  // Auth and Profile repositories
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      secureStorage: secureStorage,
      dio: dio,
      pinAuthLocalDataSource: getIt<PinAuthLocalDataSource>(),
    ),
  );

  getIt.registerFactory<ProfileRepository>(
    () => ProfileRepositoryImpl(
      secureStorage,
      dio,
      getIt<PinAuthLocalDataSource>(),
    ),
  );

  // Wallet repositories
  getIt.registerFactory<WalletRemoteDataSource>(
    () => WalletRemoteDataSourceImpl(dio: dio),
  );

  getIt.registerFactory<WalletLocalDataSource>(
    () => WalletLocalDataSourceImpl(prefs: sharedPreferences),
  );

  getIt.registerFactory<WalletRepository>(
    () => WalletRepositoryImpl(
      remoteDataSource: getIt<WalletRemoteDataSource>(),
      localDataSource: getIt<WalletLocalDataSource>(),
    ),
  );

  // Notification repositories
  getIt.registerFactory<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(dio: dio),
  );

  getIt.registerFactory<NotificationLocalDataSource>(
    () => NotificationLocalDataSourceImpl(sharedPreferences),
  );

  getIt.registerFactory<NotificationRepository>(
    () => NotificationRepositoryImpl(
      remoteDataSource: getIt<NotificationRemoteDataSource>(),
      localDataSource: getIt<NotificationLocalDataSource>(),
      networkInfo: getIt<NetworkInfoImpl>(),
    ),
  );

  // Rewards repositories
  getIt.registerFactory<RewardsRemoteDataSource>(
    () => RewardsRemoteDataSourceImpl(dio: dio),
  );

  getIt.registerFactory<RewardsDataSource>(
    () => RewardsDataSourceImpl(
      remoteDataSource: getIt<RewardsRemoteDataSource>(),
    ),
  );

  getIt.registerFactory<RewardsRepository>(
    () => RewardsRepositoryImpl(getIt<RewardsDataSource>()),
  );

  // PIN Auth dependencies
  getIt.registerSingleton<PinAuthLocalDataSource>(
    PinAuthLocalDataSourceImpl(
      secureStorage: secureStorage,
      localAuth: localAuth,
    ),
  );

  getIt.registerFactory<PinAuthRepository>(
    () => PinAuthRepositoryImpl(
      localDataSource: getIt<PinAuthLocalDataSource>(),
      currentUser: getIt<AuthStore>().currentUser,
    ),
  );

  getIt.registerFactory<VerifyPin>(
    () => VerifyPin(getIt<PinAuthRepository>()),
  );

  getIt.registerFactory<AuthenticateWithBiometric>(
    () => AuthenticateWithBiometric(getIt<PinAuthRepository>()),
  );

  getIt.registerFactory<GetPinAuthState>(
    () => GetPinAuthState(getIt<PinAuthRepository>()),
  );

  getIt.registerFactory<PinAuthStore>(
    () => PinAuthStore(
      verifyPin: getIt<VerifyPin>(),
      authenticateWithBiometric: getIt<AuthenticateWithBiometric>(),
      getPinAuthState: getIt<GetPinAuthState>(),
      repository: getIt<PinAuthRepository>(),
    ),
  );

  // Auth and Profile stores
  getIt.registerFactory<AuthStore>(
    () => AuthStore(
      getIt<AuthRepository>(),
      getIt<ProfileRepository>(),
      secureStorage,
    ),
  );

  getIt.registerFactory<ProfileStore>(
    () => ProfileStore(
      getIt<ProfileRepository>(),
      secureStorage,
    ),
  );

  // Onboarding dependencies
  getIt.registerFactory<OnboardingSecureStorage>(
    () => OnboardingSecureStorageImpl(secureStorage),
  );

  getIt.registerFactory<OnboardingRepository>(
    () => OnboardingRepositoryImpl(getIt<OnboardingSecureStorage>()),
  );

  getIt.registerFactory<GetOnboardingStatus>(
    () => GetOnboardingStatus(getIt<OnboardingRepository>()),
  );

  getIt.registerFactory<CompleteOnboarding>(
    () => CompleteOnboarding(getIt<OnboardingRepository>()),
  );

  // Wallet store
  getIt.registerFactory<WalletStore>(
    () => WalletStore(repository: getIt<WalletRepository>()),
  );

  // Bank accounts store
  getIt.registerFactory<BankAccountsStore>(
    () => BankAccountsStore(getIt<WalletRepository>()),
  );

  // Notification store
  getIt.registerFactory<NotificationStore>(
    () => NotificationStore(
      notificationRepository: getIt<NotificationRepository>(),
    ),
  );

  // Rewards store
  getIt.registerFactory<RewardsStore>(
    () => RewardsStore(getIt<RewardsRepository>()),
  );

  // KYC dependencies
  getIt.registerFactory<KycRemoteDataSource>(
    () => KycRemoteDataSourceImpl(dio),
  );

  getIt.registerFactory<KycRepository>(
    () => KycRepositoryImpl(getIt<KycRemoteDataSource>()),
  );
}
