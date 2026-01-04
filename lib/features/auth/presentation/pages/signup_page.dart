import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../mobx/auth_store.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/services/toast_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _authStore = getIt<AuthStore>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  bool agreeTerms = false;
  String? _nameError;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSignup() async {
    // Clear previous errors
    setState(() {
      _nameError = null;
      _emailError = null;
      _passwordError = null;
    });

    bool hasError = false;

    if (!agreeTerms) {
      ToastService.showWarning(
          'Please agree to the Terms & Conditions to continue');
      hasError = true;
    }

    if (_nameController.text.isEmpty) {
      setState(() {
        _nameError = 'Name is required';
      });
      hasError = true;
    }

    if (_emailController.text.isEmpty) {
      setState(() {
        _emailError = 'Email is required';
      });
      hasError = true;
    } else if (!_isValidEmail(_emailController.text)) {
      setState(() {
        _emailError = 'Please enter a valid email';
      });
      hasError = true;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordError = 'Password is required';
      });
      hasError = true;
    } else if (_passwordController.text.length < 6) {
      setState(() {
        _passwordError = 'Password must be at least 6 characters';
      });
      hasError = true;
    }

    if (hasError) {
      return;
    }

    await _authStore.signup(
      phoneNumber: _emailController.text, // Use email as identifier
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
    );

    if (_authStore.error == null && mounted) {
      context.go('/otp-verification', extra: _emailController.text);
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
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
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text(
          "Create Account",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Fill your information below or register\nwith your social account.",
                style:
                    TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                label: "Name",
                hint: "John Doe",
                icon: Icons.person_outline,
                controller: _nameController,
                errorText: _nameError,
                onChanged: (value) {
                  if (_nameError != null) {
                    setState(() {
                      _nameError = null;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Email",
                hint: "example@gmail.com",
                icon: Icons.email_outlined,
                controller: _emailController,
                isEmail: true,
                errorText: _emailError,
                onChanged: (value) {
                  if (_emailError != null) {
                    setState(() {
                      _emailError = null;
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
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: agreeTerms,
                    activeColor: AppTheme.primaryGreen,
                    onChanged: (v) => setState(() => agreeTerms = v!),
                  ),
                  const Text(
                    "Agree with ",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    "Terms & Condition",
                    style: TextStyle(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Observer(
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _authStore.isLoading ? null : _handleSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryGreen,
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
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.white24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or sign up with",
                        style: TextStyle(color: Colors.white54, fontSize: 14)),
                  ),
                  Expanded(child: Divider(color: Colors.white24)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _socialButton(FontAwesomeIcons.apple),
                  _socialButton(FontAwesomeIcons.google),
                  _socialButton(FontAwesomeIcons.facebook),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () => context.go('/login'),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: AppTheme.primaryGreen,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _socialButton(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 22,
          color: Colors.white70,
        ),
      ),
    );
  }
}
