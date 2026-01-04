// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:recliq_user/core/di/modules.dart' as _i400;
import 'package:recliq_user/core/di/service_locator.dart' as _i218;
import 'package:recliq_user/core/network/network_info.dart' as _i204;
import 'package:recliq_user/features/auth/data/datasources/onboarding_secure_storage.dart'
    as _i333;
import 'package:recliq_user/features/auth/data/repositories/auth_repository_impl.dart'
    as _i260;
import 'package:recliq_user/features/auth/data/repositories/onboarding_repository_impl.dart'
    as _i1060;
import 'package:recliq_user/features/auth/domain/repositories/auth_repository.dart'
    as _i307;
import 'package:recliq_user/features/auth/domain/repositories/onboarding_repository.dart'
    as _i517;
import 'package:recliq_user/features/auth/domain/usecases/complete_onboarding.dart'
    as _i691;
import 'package:recliq_user/features/auth/domain/usecases/get_onboarding_status.dart'
    as _i815;
import 'package:recliq_user/features/auth/presentation/mobx/auth_store.dart'
    as _i668;
import 'package:recliq_user/features/notifications/data/datasources/notification_local_data_source.dart'
    as _i145;
import 'package:recliq_user/features/notifications/data/datasources/notification_remote_data_source.dart'
    as _i115;
import 'package:recliq_user/features/notifications/domain/repositories/notification_repository.dart'
    as _i975;
import 'package:recliq_user/features/notifications/presentation/mobx/notification_store.dart'
    as _i831;
import 'package:recliq_user/features/profile/data/repositories/profile_repository_impl.dart'
    as _i502;
import 'package:recliq_user/features/profile/domain/repositories/profile_repository.dart'
    as _i478;
import 'package:recliq_user/features/profile/presentation/mobx/profile_store.dart'
    as _i24;
import 'package:recliq_user/features/rewards/data/datasources/rewards_datasource.dart'
    as _i1065;
import 'package:recliq_user/features/rewards/data/datasources/rewards_remote_data_source.dart'
    as _i1067;
import 'package:recliq_user/features/rewards/domain/repositories/rewards_repository.dart'
    as _i12;
import 'package:recliq_user/features/rewards/presentation/mobx/rewards_store.dart'
    as _i244;
import 'package:recliq_user/features/wallet/data/datasources/wallet_local_data_source.dart'
    as _i153;
import 'package:recliq_user/features/wallet/data/datasources/wallet_remote_data_source.dart'
    as _i648;
import 'package:recliq_user/features/wallet/domain/repositories/wallet_repository.dart'
    as _i1029;
import 'package:recliq_user/features/wallet/presentation/mobx/bank_accounts_store.dart'
    as _i901;
import 'package:recliq_user/features/wallet/presentation/mobx/wallet_store.dart'
    as _i659;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyModules = _$ThirdPartyModules();
    final registerSharedPreferences = _$RegisterSharedPreferences();
    gh.factory<_i558.FlutterSecureStorage>(
        () => thirdPartyModules.flutterSecureStorage);
    gh.factory<_i361.Dio>(() => thirdPartyModules.dio);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerSharedPreferences.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i478.ProfileRepository>(
        () => thirdPartyModules.profileRepository);
    gh.lazySingleton<_i204.NetworkInfo>(() => thirdPartyModules.networkInfo);
    gh.lazySingleton<_i115.NotificationRemoteDataSource>(
        () => thirdPartyModules.notificationRemoteDataSource);
    gh.lazySingleton<_i648.WalletRemoteDataSource>(
        () => thirdPartyModules.walletRemoteDataSource);
    gh.lazySingleton<_i1067.RewardsRemoteDataSource>(
        () => thirdPartyModules.rewardsRemoteDataSource);
    gh.lazySingleton<_i145.NotificationLocalDataSource>(() => thirdPartyModules
        .notificationLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i153.WalletLocalDataSource>(() =>
        thirdPartyModules.walletLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i975.NotificationRepository>(
        () => thirdPartyModules.notificationRepository(
              gh<_i115.NotificationRemoteDataSource>(),
              gh<_i145.NotificationLocalDataSource>(),
              gh<_i204.NetworkInfo>(),
            ));
    gh.lazySingleton<_i24.ProfileStore>(() => _i24.ProfileStore(
          gh<_i478.ProfileRepository>(),
          gh<_i558.FlutterSecureStorage>(),
        ));
    gh.lazySingleton<_i831.NotificationStore>(() => thirdPartyModules
        .notificationStore(gh<_i975.NotificationRepository>()));
    gh.factory<_i558.FlutterSecureStorage>(
      () => thirdPartyModules.secureStorage,
      instanceName: 'secure_storage',
    );
    gh.factory<_i502.ProfileRepositoryImpl>(() => _i502.ProfileRepositoryImpl(
          gh<_i558.FlutterSecureStorage>(instanceName: 'secure_storage'),
          gh<_i361.Dio>(),
        ));
    gh.lazySingleton<_i1065.RewardsDataSource>(() => thirdPartyModules
        .rewardsDataSource(gh<_i1067.RewardsRemoteDataSource>()));
    gh.lazySingleton<_i12.RewardsRepository>(() =>
        thirdPartyModules.rewardsRepository(gh<_i1065.RewardsDataSource>()));
    gh.lazySingleton<_i244.RewardsStore>(
        () => thirdPartyModules.rewardsStore(gh<_i12.RewardsRepository>()));
    gh.lazySingleton<_i1029.WalletRepository>(
        () => thirdPartyModules.walletRepository(
              gh<_i648.WalletRemoteDataSource>(),
              gh<_i153.WalletLocalDataSource>(),
            ));
    gh.factory<_i901.BankAccountsStore>(
        () => _i901.BankAccountsStore(gh<_i1029.WalletRepository>()));
    gh.lazySingleton<_i659.WalletStore>(
        () => thirdPartyModules.walletStore(gh<_i1029.WalletRepository>()));
    gh.factory<_i333.OnboardingSecureStorage>(() =>
        _i333.OnboardingSecureStorageImpl(
            gh<_i558.FlutterSecureStorage>(instanceName: 'secure_storage')));
    gh.factory<_i307.AuthRepository>(() => _i260.AuthRepositoryImpl(
          gh<_i558.FlutterSecureStorage>(instanceName: 'secure_storage'),
          gh<_i361.Dio>(),
        ));
    gh.factory<_i668.AuthStore>(() => _i668.AuthStore(
          gh<_i307.AuthRepository>(),
          gh<_i478.ProfileRepository>(),
          gh<_i558.FlutterSecureStorage>(),
        ));
    gh.factory<_i517.OnboardingRepository>(() =>
        _i1060.OnboardingRepositoryImpl(gh<_i333.OnboardingSecureStorage>()));
    gh.factory<_i691.CompleteOnboarding>(
        () => _i691.CompleteOnboarding(gh<_i517.OnboardingRepository>()));
    gh.factory<_i815.GetOnboardingStatus>(
        () => _i815.GetOnboardingStatus(gh<_i517.OnboardingRepository>()));
    return this;
  }
}

class _$ThirdPartyModules extends _i400.ThirdPartyModules {}

class _$RegisterSharedPreferences extends _i218.RegisterSharedPreferences {}
