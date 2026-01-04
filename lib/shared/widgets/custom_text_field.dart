import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool isEmail;
  final bool isPhone;
  final bool isPassword;
  final String? errorText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isEmail = false,
    this.isPhone = false,
    this.isPassword = false,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  Color get _disabledFillColor => AppTheme.surfaceDark.withOpacity(0.55);

  Color get _disabledBorderColor => AppTheme.primaryGreen.withOpacity(0.25);

  Color get _disabledIconColor => AppTheme.primaryGreen.withOpacity(0.4);

  Color get _disabledTextColor => Colors.white.withOpacity(0.6);

  @override
  Widget build(BuildContext context) {
    final bool hasError = widget.errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: hasError ? Colors.redAccent : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          keyboardType: widget.isEmail
              ? TextInputType.emailAddress
              : widget.isPhone
                  ? TextInputType.phone
                  : widget.isPassword
                      ? TextInputType.visiblePassword
                      : TextInputType.text,
          obscureText: widget.isPassword ? _obscureText : false,
          enabled: widget.enabled,
          style: TextStyle(
            color: widget.enabled ? Colors.white : _disabledTextColor,
            fontSize: 14,
          ),
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: widget.enabled ? Colors.white38 : Colors.white24,
            ),
            prefixIcon: Icon(
              widget.icon,
              color: hasError
                  ? Colors.redAccent
                  : widget.enabled
                      ? (_isFocused ? AppTheme.primaryGreen : Colors.white54)
                      : _disabledIconColor,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color:
                          widget.enabled ? Colors.white54 : _disabledIconColor,
                    ),
                    onPressed: widget.enabled
                        ? () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          }
                        : null,
                  )
                : null,
            filled: true,
            fillColor:
                widget.enabled ? AppTheme.surfaceDark : _disabledFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: hasError
                    ? Colors.redAccent
                    : widget.enabled
                        ? Colors.white24
                        : _disabledBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: hasError ? Colors.redAccent : Colors.white24,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: hasError ? Colors.redAccent : AppTheme.primaryGreen,
                width: 1.2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _disabledBorderColor,
                width: 1.1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
