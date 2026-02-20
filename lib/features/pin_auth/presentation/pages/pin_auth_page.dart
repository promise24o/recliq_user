import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/themes/app_theme.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/services/toast_service.dart';
import '../../../auth/presentation/mobx/auth_store.dart';
import '../../../auth/presentation/pages/auth_gate_page.dart';
import '../mobx/pin_auth_store.dart';
import '../../data/repositories/pin_auth_repository_impl.dart';
import '../../domain/repositories/pin_auth_repository.dart';

class PinAuthPage extends StatefulWidget {
  const PinAuthPage({super.key});

  @override
  State<PinAuthPage> createState() => _PinAuthPageState();
}

class _PinAuthPageState extends State<PinAuthPage> {
  final PinAuthStore _pinAuthStore = getIt<PinAuthStore>();
  final AuthStore _authStore = getIt<AuthStore>();

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _initializeAuth();
    _checkAuthenticationStatus();
    reaction((_) => _pinAuthStore.isAuthenticated, (bool isAuthenticated) {
      if (isAuthenticated && mounted) {
        context.go('/home');
      }
    });
  }

  Future<void> _loadUserData() async {
    await _authStore.getCurrentUser();
  }

  void _checkAuthenticationStatus() {
    if (_pinAuthStore.isAuthenticated) {
      context.go('/home');
    }
  }

  Future<void> _initializeAuth() async {
    await _pinAuthStore.initializeAuth();
    if (!_pinAuthStore.authState.isPinSet) {
      final pinAuthRepo = getIt<PinAuthRepository>();
      if (pinAuthRepo is PinAuthRepositoryImpl) {
        await pinAuthRepo.localDataSource.storePin('1234');
        await _pinAuthStore.initializeAuth();
      }
    }
    if (!_pinAuthStore.authState.isBiometricEnabled) {
      final pinAuthRepo = getIt<PinAuthRepository>();
      if (pinAuthRepo is PinAuthRepositoryImpl) {
        await pinAuthRepo.localDataSource.setBiometricEnabled(true);
        await _pinAuthStore.initializeAuth();
      }
    }
    _checkAuthenticationStatus();
  }

  void _onKeyPressed(int value) {
    _pinAuthStore.addPinDigit(value);
  }

  void _onBackspace() {
    _pinAuthStore.removePinDigit();
  }

  Future<void> _onBiometricPressed() async {
    await _pinAuthStore.authenticateWithBiometric();
  }

  Future<void> _showSignOutDialog() async {
    final shouldSignOut = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(
          'Sign Out',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: const Text(
          'Are you sure you want to sign out? This will clear all your data.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () {
              HapticFeedback.selectionClick();
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              Navigator.of(context).pop(true);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );

    if (shouldSignOut == true) {
      await _pinAuthStore.signOut();
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const AuthGatePage()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xFF050214),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  16.verticalSpace,
                  _buildProfileAvatar(context),
                  16.verticalSpace,
                  _buildWelcomeText(size),
                  4.verticalSpace,
                  _buildStatusText(size),
                  16.verticalSpace,
                  _buildPinDots(size),
                  Observer(
                    builder: (context) {
                      final errorMessage = _pinAuthStore.errorMessage;
                      if (errorMessage.isNotEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            errorMessage,
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: Colors.red,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  size.height < 650 ? 18.verticalSpace : 24.verticalSpace,
                  Expanded(child: _buildNumPad(size)),
                  16.verticalSpace,
                  _buildActionButtons(),
                  8.verticalSpace,
                  _buildForgotPinButton(),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return Observer(
      builder: (context) {
        final user = _authStore.currentUser;
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen,
            shape: BoxShape.circle,
          ),
          child: user?.profilePhoto != null && user!.profilePhoto!.isNotEmpty
              ? ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: user.profilePhoto!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    httpHeaders: const {'User-Agent': 'Mozilla/5.0'},
                    placeholder: (context, url) => Container(
                      color: AppTheme.primaryGreen,
                      child: const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      ImagePaths.avatar,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Image.asset(
                  ImagePaths.avatar,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
        );
      },
    );
  }

  Widget _buildWelcomeText(Size size) {
    return Observer(
      builder: (context) {
        final user = _authStore.currentUser;
        return Column(
          children: [
            Text(
              'Welcome back,',
              style: TextStyle(
                color: Colors.white70,
                fontSize: size.height < 650 ? 16 : 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              user?.name ?? 'User',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.height < 650 ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (user?.email != null)
              Text(
                user!.email!,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: size.height < 650 ? 14 : 16,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildStatusText(Size size) {
    return Observer(
      builder: (context) {
        final authState = _pinAuthStore.authState;
        final errorMessage = _pinAuthStore.errorMessage;
        if (errorMessage.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }
        if (authState.failedAttempts > 0 && !authState.isPinBlocked) {
          return Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              '${authState.remainingAttempts} attempts remaining',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }
        return Text(
          authState.isPinBlocked
              ? authState.blockedMessage
              : 'Enter your PIN to log in',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: size.width < 365 ? 11.sp : 12.sp,
            color: authState.isPinBlocked ? Colors.red : Colors.grey[600],
          ),
        );
      },
    );
  }

  Widget _buildPinDots(Size size) {
    return Observer(
      builder: (context) {
        final pinInput = _pinAuthStore.pinInput;
        final authState = _pinAuthStore.authState;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(4, (index) {
            final filled = index < pinInput.length;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: 18.w,
              height: 18.w,
              margin: EdgeInsets.symmetric(
                horizontal: size.width > 365 ? 9.w : 6.w,
              ),
              decoration: BoxDecoration(
                color: _getDotColor(filled, authState.isPinBlocked),
                shape: BoxShape.circle,
                border: Border.all(
                  color: authState.isPinBlocked
                      ? Colors.red
                      : AppTheme.primaryGreen,
                  width: 2,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Color _getDotColor(bool filled, bool isBlocked) {
    if (isBlocked) {
      return filled ? Colors.red : Colors.grey[300]!;
    }
    return filled ? AppTheme.primaryGreen : Colors.grey[300]!;
  }

  Widget _buildNumPad(Size size) {
    final keys = [1, 2, 3, 4, 5, 6, 7, 8, 9, null, 0, -1];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: keys.length,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final key = keys[index];

        if (key == null) {
          return Observer(
            builder: (context) {
              final isBiometricAvailable = _pinAuthStore.isBiometricAvailable;
              return GlassButton(
                icon: Platform.isAndroid ? Icons.fingerprint : Icons.face,
                onTap: isBiometricAvailable ? _onBiometricPressed : null,
              );
            },
          );
        }

        if (key == -1) {
          return Observer(
            builder: (context) {
              final hasInput = _pinAuthStore.pinInput.isNotEmpty;
              return GlassButton(
                icon: Icons.backspace_outlined,
                onTap: hasInput ? _onBackspace : null,
              );
            },
          );
        }

        return Observer(
          builder: (context) {
            final canAddDigit = _pinAuthStore.canAddDigit;
            return GlassButton(
              text: '$key',
              onTap: canAddDigit ? () => _onKeyPressed(key) : null,
            );
          },
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Observer(
      builder: (context) {
        final authState = _pinAuthStore.authState;
        if (authState.isPinBlocked) {
          return GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const AuthGatePage()),
              (route) => false,
            ),
            child: Text(
              'Sign In with Password',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppTheme.primaryGreen,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: _showSignOutDialog,
          child: _pinAuthStore.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Not You? ',
                        style: GoogleFonts.inter(
                          color: AppTheme.primaryGreen,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Log out',
                        style: GoogleFonts.inter(
                          color: AppTheme.primaryGreen,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildForgotPinButton() {
    return GestureDetector(
      onTap: () {
        ToastService.showError('Forgot PIN feature coming soon');
      },
      child: Text(
        'Forgot PIN?',
        style: GoogleFonts.inter(
          color: Colors.grey[600],
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class GlassButton extends StatefulWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback? onTap;

  const GlassButton({
    super.key,
    this.text,
    this.icon,
    this.onTap,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation<double>? _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.92).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 60.0;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
        HapticFeedback.lightImpact();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scale ?? const AlwaysStoppedAnimation(1.0),
        builder: (_, __) {
          return Transform.scale(
            scale: _scale?.value ?? 1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(buttonSize / 2),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.10),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: widget.text != null
                        ? Text(
                            widget.text!,
                            style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )
                        : Icon(
                            widget.icon,
                            size: 26.sp,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
