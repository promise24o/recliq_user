import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/welcome_page.dart';
import '../../features/auth/presentation/pages/initial_screen.dart';
import '../../features/auth/presentation/pages/auth_gate_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/wallet/presentation/pages/wallet_page.dart';
import '../../features/wallet/presentation/pages/transactions_page.dart';
import '../../features/wallet/presentation/pages/bank_accounts_page.dart';
import '../../features/rewards/presentation/pages/rewards_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const InitialScreen(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const InitialScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomePage(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const WelcomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: '/auth-gate',
        builder: (context, state) => const AuthGatePage(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AuthGatePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupPage(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignupPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/otp-verification',
        builder: (context, state) => OtpVerificationPage(
          email: state.extra as String? ?? '',
        ),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: OtpVerificationPage(
            email: state.extra as String? ?? '',
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ForgotPasswordPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ProfilePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/wallet',
        builder: (context, state) => const WalletPage(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const WalletPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              ),
              child: child,
            );
          },
        ),
        routes: [
          GoRoute(
            path: 'bank-accounts',
            builder: (context, state) => const BankAccountsPage(),
          ),
          GoRoute(
            path: 'transactions',
            builder: (context, state) => const TransactionsPage(),
          ),
          GoRoute(
            path: 'earnings',
            builder: (context, state) =>
                Container(), // TODO: Create EarningsSummaryPage
          ),
          GoRoute(
            path: 'withdraw',
            builder: (context, state) =>
                Container(), // TODO: Create WithdrawPage
          ),
          GoRoute(
            path: 'airtime-data',
            builder: (context, state) =>
                Container(), // TODO: Create AirtimeDataPage
          ),
          GoRoute(
            path: 'rewards',
            builder: (context, state) => const RewardsPage(),
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const RewardsPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: animation.drive(
                    Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
                  ),
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}
