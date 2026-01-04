import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../features/rewards/data/datasources/rewards_datasource_impl.dart'
    show RewardsDataSourceImpl;
import '../interceptors/auth_interceptor.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/notifications/data/repositories/notification_repository_impl.dart';
import '../../features/notifications/domain/repositories/notification_repository.dart';
import '../../features/notifications/data/datasources/notification_remote_data_source.dart';
import '../../features/notifications/data/datasources/notification_local_data_source.dart';
import '../../features/notifications/presentation/mobx/notification_store.dart';
import '../../features/wallet/data/repositories/wallet_repository_impl.dart';
import '../../features/wallet/domain/repositories/wallet_repository.dart';
import '../../features/wallet/data/datasources/wallet_remote_data_source.dart';
import '../../features/wallet/data/datasources/wallet_local_data_source.dart';
import '../../features/rewards/data/repositories/rewards_repository_impl.dart';
import '../../features/rewards/domain/repositories/rewards_repository.dart';
import '../../features/rewards/data/datasources/rewards_datasource.dart';
import '../../features/rewards/data/datasources/rewards_remote_data_source.dart';
import '../../features/rewards/presentation/mobx/rewards_store.dart';
import '../../core/network/network_info.dart';

@module
abstract class ThirdPartyModules {
  @Named('secure_storage')
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  // Also register without name for direct injection
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  @lazySingleton
  ProfileRepository get profileRepository =>
      ProfileRepositoryImpl(secureStorage, dio);

  @lazySingleton
  NetworkInfo get networkInfo => NetworkInfoImpl(
        connectionChecker: InternetConnectionChecker.createInstance(),
      );

  @lazySingleton
  NotificationRemoteDataSource get notificationRemoteDataSource =>
      NotificationRemoteDataSourceImpl(dio: dio);

  @lazySingleton
  NotificationLocalDataSource notificationLocalDataSource(
          SharedPreferences prefs) =>
      NotificationLocalDataSourceImpl(prefs);

  @lazySingleton
  NotificationRepository notificationRepository(
    NotificationRemoteDataSource remoteDataSource,
    NotificationLocalDataSource localDataSource,
    NetworkInfo networkInfo,
  ) =>
      NotificationRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
        networkInfo: networkInfo,
      );

  @lazySingleton
  NotificationStore notificationStore(
          NotificationRepository notificationRepository) =>
      NotificationStore(notificationRepository: notificationRepository);

  @lazySingleton
  WalletRemoteDataSource get walletRemoteDataSource =>
      WalletRemoteDataSourceImpl(dio: dio);

  @lazySingleton
  WalletLocalDataSource walletLocalDataSource(SharedPreferences prefs) =>
      WalletLocalDataSourceImpl(prefs: prefs);

  @lazySingleton
  WalletRepository walletRepository(
    WalletRemoteDataSource remoteDataSource,
    WalletLocalDataSource localDataSource,
  ) =>
      WalletRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
      );

  @lazySingleton
  RewardsRemoteDataSource get rewardsRemoteDataSource =>
      RewardsRemoteDataSourceImpl(dio: dio);

  @lazySingleton
  RewardsDataSource rewardsDataSource(
          RewardsRemoteDataSource rewardsRemoteDataSource) =>
      RewardsDataSourceImpl(remoteDataSource: rewardsRemoteDataSource);

  @lazySingleton
  RewardsRepository rewardsRepository(
    RewardsDataSource dataSource,
  ) =>
      RewardsRepositoryImpl(dataSource);

  @lazySingleton
  RewardsStore rewardsStore(RewardsRepository rewardsRepository) =>
      RewardsStore(rewardsRepository);

  Dio get dio {
    final dio = Dio(BaseOptions(
      baseUrl: _getBaseUrl(),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (status) => status != null && status < 500,
    ));

    // Add auth interceptor
    dio.interceptors.add(AuthInterceptor(secureStorage));

    return dio;
  }
}

String _getBaseUrl() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:5001'; // Android emulator
  } else {
    return 'http://localhost:5001'; // iOS simulator & macOS
  }
}
