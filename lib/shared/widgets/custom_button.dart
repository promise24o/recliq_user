import 'dart:ui';
import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

enum AppButtonVariant {
  filled,
  outlined,
  ghost,
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool disabled;

  final AppButtonVariant variant;

  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  final Widget? leading;
  final Widget? trailing;

  final double height;
  final double? width;
  final double radius;
  final EdgeInsetsGeometry padding;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.variant = AppButtonVariant.filled,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.height = 48,
    this.width,
    this.radius = 14,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  });

  bool get _isDisabled => disabled || loading || onPressed == null;

  @override
  Widget build(BuildContext context) {
    final fg = _getTextColor();
    final bg = _getBackgroundColor();
    final br = _getBorderColor();

    return SizedBox(
      width: width,
      height: height,
      child: Opacity(
        opacity: _isDisabled ? 0.5 : 1,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _isDisabled ? null : onPressed,
            borderRadius: BorderRadius.circular(radius),
            splashColor: _isDisabled ? Colors.transparent : null,
            highlightColor: _isDisabled ? Colors.transparent : null,
            child: Ink(
              decoration: _decoration(bg, br),
              child: Padding(
                padding: padding,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: loading
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: fg,
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (leading != null) ...[
                                leading!,
                                const SizedBox(width: 8),
                              ],
                              Text(
                                label,
                                style: TextStyle(
                                  color: fg,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Manrope',
                                ),
                              ),
                              if (trailing != null) ...[
                                const SizedBox(width: 8),
                                trailing!,
                              ],
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getTextColor() {
    if (_isDisabled) {
      return AppTheme.textSecondary.withOpacity(0.7);
    }

    return color ??
        switch (variant) {
          AppButtonVariant.filled => AppTheme.textPrimary,
          AppButtonVariant.outlined => AppTheme.textSecondary,
          AppButtonVariant.ghost => AppTheme.textSecondary,
        };
  }

  Color _getBackgroundColor() {
    if (_isDisabled) {
      return AppTheme.surfaceDark;
    }

    return backgroundColor ??
        switch (variant) {
          AppButtonVariant.filled => Colors.transparent,
          AppButtonVariant.outlined => Colors.transparent,
          AppButtonVariant.ghost => AppTheme.surfaceDark,
        };
  }

  Color _getBorderColor() {
    if (_isDisabled) {
      return AppTheme.borderSoft.withOpacity(0.6);
    }

    return borderColor ??
        switch (variant) {
          AppButtonVariant.filled => Colors.transparent,
          AppButtonVariant.outlined => AppTheme.borderSoft,
          AppButtonVariant.ghost => Colors.transparent,
        };
  }

  BoxDecoration _decoration(Color bg, Color br) {
    if (variant == AppButtonVariant.filled && !_isDisabled) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: AppTheme.greenGradient,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      );
    }

    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: bg,
      border: Border.all(color: br, width: 1),
    );
  }
}

/// presets

class PrimaryButton extends AppButton {
  const PrimaryButton({
    super.key,
    required super.label,
    super.onPressed,
    super.loading,
    super.disabled,
    super.leading,
    super.trailing,
    super.width,
  }) : super(variant: AppButtonVariant.filled);
}

class OutlineButtonX extends AppButton {
  const OutlineButtonX({
    super.key,
    required super.label,
    super.onPressed,
    super.loading,
    super.disabled,
    super.leading,
    super.trailing,
    super.width,
  }) : super(variant: AppButtonVariant.outlined);
}

class GhostButton extends AppButton {
  const GhostButton({
    super.key,
    required super.label,
    super.onPressed,
    super.loading,
    super.disabled,
    super.leading,
    super.trailing,
    super.width,
  }) : super(variant: AppButtonVariant.ghost);
}

class DangerButton extends AppButton {
  const DangerButton({
    super.key,
    required super.label,
    super.onPressed,
    super.loading,
    super.disabled,
    super.leading,
    super.trailing,
    super.width,
  }) : super(
          variant: AppButtonVariant.filled,
          backgroundColor: AppTheme.danger,
          color: AppTheme.textPrimary,
        );
}

class SecondaryButton extends AppButton {
  const SecondaryButton({
    super.key,
    required super.label,
    super.onPressed,
    super.loading,
    super.disabled,
    super.leading,
    super.trailing,
    super.width,
  }) : super(variant: AppButtonVariant.ghost);
}
