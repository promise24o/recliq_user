import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/di/service_locator.dart';
import 'core/services/fcm_service.dart';
import 'features/wallet/presentation/mobx/wallet_store.dart';
import 'shared/themes/app_theme.dart';
import 'shared/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator();

  final fcmService = getIt<FcmService>();
  await fcmService.initialize();
  fcmService.listenForTokenRefresh();

  final walletStore = getIt<WalletStore>();
  walletStore.loadWalletOverview();

  runApp(const RecliqApp());
}

class RecliqApp extends StatelessWidget {
  const RecliqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Recliq',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme.copyWith(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              actionsIconTheme: IconThemeData(color: Colors.white),
              foregroundColor: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
          themeMode: ThemeMode.dark,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}