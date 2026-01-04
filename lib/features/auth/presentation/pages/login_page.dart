import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../mobx/auth_store.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authStore = getIt<AuthStore>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _identifierError;
  String? _passwordError;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    // Clear previous errors
    setState(() {
      _identifierError = null;
      _passwordError = null;
    });

    bool hasError = false;

    if (_identifierController.text.isEmpty) {
      setState(() {
        _identifierError = "Email or phone number is required";
      });
      hasError = true;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordError = "Password is required";
      });
      hasError = true;
    }

    if (hasError) {
      return;
    }

    await _authStore.login(
      _identifierController.text,
      password: _passwordController.text,
    );

    if (_authStore.error == null && mounted) {
      context.go('/otp-verification', extra: _identifierController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.darkBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/auth-gate'),
        ),
        title: const Text(
          'Welcome Back',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Sign in to your account to continue your recycling journey.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40),
            CustomTextField(
              label: "Email",
              hint: "Enter your email",
              icon: Icons.person_outline,
              controller: _identifierController,
              errorText: _identifierError,
              onChanged: (value) {
                if (_identifierError != null) {
                  setState(() {
                    _identifierError = null;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Password",
              hint: "••••••••",
              icon: Icons.lock_outline,
              controller: _passwordController,
              isPassword: true,
              errorText: _passwordError,
              onChanged: (value) {
                if (_passwordError != null) {
                  setState(() {
                    _passwordError = null;
                  });
                }
              },
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  context.go('/forgot-password');
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: AppTheme.primaryGreen,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Observer(
              builder: (_) => SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _authStore.isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    disabledBackgroundColor: Colors.grey.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _authStore.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "or continue with",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () => context.go('/signup'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.envelope,
                      color: Colors.white70,
                      size: 18,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Create New Account",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "By signing in, you agree to our ",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
