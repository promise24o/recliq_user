import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../domain/usecases/get_onboarding_status.dart';
import '../mobx/auth_store.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late final GetOnboardingStatus _getOnboardingStatus;
  late final AuthStore _authStore;

  @override
  void initState() {
    super.initState();
    _getOnboardingStatus = GetIt.instance<GetOnboardingStatus>();
    _authStore = GetIt.instance<AuthStore>();
    _checkOnboardingAndNavigate();
  }

  Future<void> _checkOnboardingAndNavigate() async {
    // Add a small delay to prevent flash
    await Future.delayed(const Duration(milliseconds: 3000));

    final isCompleted = await _getOnboardingStatus();

    if (mounted) {
      if (isCompleted) {
        // Onboarding completed, check if user is logged in
        await _authStore.getCurrentUser();

        if (_authStore.isAuthenticated) {
          // User is logged in, redirect to dashboard
          context.go('/home');
        } else {
          // User is not logged in, show auth gate
          context.go('/auth-gate');
        }
      } else {
        // First time user, show welcome screen
        context.go('/welcome');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/logo-animation.json',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
