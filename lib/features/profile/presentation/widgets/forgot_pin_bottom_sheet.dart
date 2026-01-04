import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../shared/themes/app_theme.dart';
import '../mobx/profile_store.dart';

class ForgotPinBottomSheet extends StatefulWidget {
  final ProfileStore profileStore;

  const ForgotPinBottomSheet({
    super.key,
    required this.profileStore,
  });

  @override
  State<ForgotPinBottomSheet> createState() => _ForgotPinBottomSheetState();
}

class _ForgotPinBottomSheetState extends State<ForgotPinBottomSheet> {
  final _otpController = TextEditingController();
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();

  bool _otpSent = false;
  String? _otpError;
  String? _newPinError;
  String? _confirmPinError;

  String get userEmail {
    return widget.profileStore.user?.email ?? '';
  }

  @override
  void dispose() {
    _otpController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  void _handleSendOtp() async {
    setState(() {
      _otpSent = false;
    });

    if (userEmail.isEmpty) {
      setState(() {
        _otpError = "User email not found. Please try again.";
      });
      return;
    }

    final result = await widget.profileStore.sendOtpToEmail(userEmail);
    result.fold(
      (failure) {
        setState(() {
          _otpError = "Failed to send OTP. Please try again.";
        });
      },
      (_) {
        setState(() {
          _otpSent = true;
        });
      },
    );
  }

  void _handleResetPin() async {
    setState(() {
      _otpError = null;
      _newPinError = null;
      _confirmPinError = null;
    });

    if (_otpController.text.isEmpty || _otpController.text.length != 6) {
      setState(() {
        _otpError = _otpController.text.isEmpty
            ? "OTP is required"
            : "OTP must be 6 digits";
      });
      return;
    }

    if (_newPinController.text.isEmpty || _newPinController.text.length != 4) {
      setState(() {
        _newPinError = _newPinController.text.isEmpty
            ? "New PIN is required"
            : "PIN must be 4 digits";
      });
      return;
    }

    if (_confirmPinController.text.isEmpty) {
      setState(() {
        _confirmPinError = "Please confirm your new PIN";
      });
      return;
    }

    if (_newPinController.text != _confirmPinController.text) {
      setState(() {
        _confirmPinError = "PINs do not match";
      });
      return;
    }

    await widget.profileStore.forgotPin(
      userEmail,
      _otpController.text,
      _newPinController.text,
    );

    if (widget.profileStore.error == null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              const Text(
                'Reset Transaction PIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                _otpSent
                    ? 'Enter the OTP sent to your email and set a new PIN'
                    : 'We’ll send an OTP to your registered email to verify your identity',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              if (!_otpSent)
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.primaryGreen.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: AppTheme.primaryGreen,
                        size: 28,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Verification email will be sent to',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              userEmail,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              if (!_otpSent)
                const SizedBox(
                    height:
                        40), // Extra spacing before buttons when email is shown

              if (_otpSent) ...[
                const SizedBox(height: 8),
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'OTP Code',
                    hintText: 'Enter 6-digit code',
                    errorText: _otpError,
                    counterText: '',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                    labelStyle: const TextStyle(color: Colors.white70),
                    hintStyle: const TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: AppTheme.primaryGreen, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.redAccent),
                    ),
                  ),
                  onChanged: (_) => setState(() => _otpError = null),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _newPinController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white, letterSpacing: 4),
                  decoration: InputDecoration(
                    labelText: 'New PIN',
                    hintText: '••••',
                    errorText: _newPinError,
                    counterText: '',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                    labelStyle: const TextStyle(color: Colors.white70),
                    hintStyle: const TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: AppTheme.primaryGreen, width: 2),
                    ),
                  ),
                  onChanged: (_) => setState(() => _newPinError = null),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _confirmPinController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white, letterSpacing: 4),
                  decoration: InputDecoration(
                    labelText: 'Confirm New PIN',
                    hintText: '••••',
                    errorText: _confirmPinError,
                    counterText: '',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                    labelStyle: const TextStyle(color: Colors.white70),
                    hintStyle: const TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: AppTheme.primaryGreen, width: 2),
                    ),
                  ),
                  onChanged: (_) => setState(() => _confirmPinError = null),
                ),
                const SizedBox(height: 32),
              ],

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14), // Smaller height
                        side: BorderSide(color: Colors.grey[600]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Observer(
                      builder: (_) => ElevatedButton(
                        onPressed: widget.profileStore.isLoading
                            ? null
                            : (_otpSent ? _handleResetPin : _handleSendOtp),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryGreen,
                          padding: const EdgeInsets.symmetric(
                              vertical: 14), // Smaller height
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: widget.profileStore.isLoading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                _otpSent ? 'Reset PIN' : 'Send OTP',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
