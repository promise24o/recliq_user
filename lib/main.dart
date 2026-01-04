import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/service_locator.dart';
import 'features/wallet/presentation/mobx/wallet_store.dart';
import 'shared/themes/app_theme.dart';
import 'shared/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  // Initialize wallet data on app start
  final walletStore = getIt<WalletStore>();
  walletStore.loadWalletOverview();

  runApp(const RecliqApp());
}

class RecliqApp extends StatelessWidget {
  const RecliqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X dimensions as base
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Recliq',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          themeMode: ThemeMode.dark,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
