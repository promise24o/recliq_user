import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../mobx/auth_store.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _authStore = getIt<AuthStore>();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _emailError;
  String? _otpError;
  String? _newPasswordError;
  String? _confirmPasswordError;

  bool _otpSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSendOtp() async {
    // Clear previous errors
    setState(() {
      _emailError = null;
    });

    bool hasError = false;

    if (_emailController.text.isEmpty) {
      setState(() {
        _emailError = "Email is required";
      });
      hasError = true;
    }

    if (!_emailController.text.contains('@')) {
      setState(() {
        _emailError = "Please enter a valid email";
      });
      hasError = true;
    }

    if (hasError) return;

    await _authStore.forgotPassword(_emailController.text);

    if (_authStore.error == null) {
      setState(() {
        _otpSent = true;
      });
    }
  }

  void _handleResetPassword() async {
    // Clear previous errors
    setState(() {
      _otpError = null;
      _newPasswordError = null;
      _confirmPasswordError = null;
    });

    bool hasError = false;

    if (_otpController.text.isEmpty) {
      setState(() {
        _otpError = "OTP is required";
      });
      hasError = true;
    }

    if (_otpController.text.length != 6) {
      setState(() {
        _otpError = "OTP must be 6 digits";
      });
      hasError = true;
    }

    if (_newPasswordController.text.isEmpty) {
      setState(() {
        _newPasswordError = "New password is required";
      });
      hasError = true;
    }

    if (_newPasswordController.text.length < 6) {
      setState(() {
        _newPasswordError = "Password must be at least 6 characters";
      });
      hasError = true;
    }

    if (_confirmPasswordController.text.isEmpty) {
      setState(() {
        _confirmPasswordError = "Please confirm your password";
      });
      hasError = true;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() {
        _confirmPasswordError = "Passwords do not match";
      });
      hasError = true;
    }

    if (hasError) return;

    await _authStore.resetPassword(
      _emailController.text,
      _otpController.text,
      _newPasswordController.text,
    );

    if (_authStore.error == null && mounted) {
      context.go('/home');
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
          'Reset Password',
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
        child: Observer(
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Icon
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    FontAwesomeIcons.key,
                    color: AppTheme.primaryGreen,
                    size: 32,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Title
              const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                _otpSent
                    ? 'Enter the OTP sent to your email and create a new password'
                    : 'Enter your email address to receive a password reset OTP',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 40),

              // Email Field (only shown before OTP is sent)
              if (!_otpSent) ...[
                CustomTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  hint: 'Enter your email',
                  icon: FontAwesomeIcons.envelope,
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
                const SizedBox(height: 24),
              ],

              // OTP Field (only shown after OTP is sent)
              if (_otpSent) ...[
                CustomTextField(
                  controller: _otpController,
                  label: 'OTP Code',
                  hint: 'Enter 6-digit code',
                  icon: FontAwesomeIcons.message,
                  isPhone: true,
                  errorText: _otpError,
                  onChanged: (value) {
                    if (_otpError != null) {
                      setState(() {
                        _otpError = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 24),

                // New Password Field
                CustomTextField(
                  controller: _newPasswordController,
                  label: 'New Password',
                  hint: 'Enter new password',
                  icon: FontAwesomeIcons.lock,
                  isPassword: true,
                  errorText: _newPasswordError,
                  onChanged: (value) {
                    if (_newPasswordError != null) {
                      setState(() {
                        _newPasswordError = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 24),

                // Confirm Password Field
                CustomTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  hint: 'Confirm new password',
                  icon: FontAwesomeIcons.lock,
                  isPassword: true,
                  errorText: _confirmPasswordError,
                  onChanged: (value) {
                    if (_confirmPasswordError != null) {
                      setState(() {
                        _confirmPasswordError = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 32),
              ],

              // Error Message
              if (_authStore.error != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.exclamationCircle,
                        color: Colors.red[400],
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _authStore.error!,
                          style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _authStore.isLoading
                      ? null
                      : (_otpSent ? _handleResetPassword : _handleSendOtp),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: _authStore.isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          _otpSent ? 'Reset Password' : 'Send OTP',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 24),

              // Back to Login
              Center(
                child: TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text.rich(
                    TextSpan(
                      text: "Remember your password? ",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: AppTheme.primaryGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
