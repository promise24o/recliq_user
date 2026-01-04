import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../shared/themes/app_theme.dart';
import '../mobx/profile_store.dart';

class PinUpdateBottomSheet extends StatefulWidget {
  final ProfileStore profileStore;

  const PinUpdateBottomSheet({
    super.key,
    required this.profileStore,
  });

  @override
  State<PinUpdateBottomSheet> createState() => _PinUpdateBottomSheetState();
}

class _PinUpdateBottomSheetState extends State<PinUpdateBottomSheet> {
  final _oldPinController = TextEditingController();
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();
  String? _oldPinError;
  String? _newPinError;
  String? _confirmPinError;

  @override
  void dispose() {
    _oldPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  void _handleUpdatePin() async {
    setState(() {
      _oldPinError = null;
      _newPinError = null;
      _confirmPinError = null;
    });

    // Validate old PIN
    if (_oldPinController.text.isEmpty) {
      setState(() {
        _oldPinError = "Current PIN is required";
      });
      return;
    }

    if (_oldPinController.text.length != 4) {
      setState(() {
        _oldPinError = "PIN must be 4 digits";
      });
      return;
    }

    // Validate new PIN
    if (_newPinController.text.isEmpty) {
      setState(() {
        _newPinError = "New PIN is required";
      });
      return;
    }

    if (_newPinController.text.length != 4) {
      setState(() {
        _newPinError = "PIN must be 4 digits";
      });
      return;
    }

    // Validate confirm PIN
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

    await widget.profileStore.updatePin(
      _oldPinController.text,
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
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Title
              const Text(
                'Update Transaction PIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),

              // Description
              const Text(
                'Enter your current PIN and create a new one',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),

              // Current PIN Input
              TextField(
                controller: _oldPinController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Current PIN',
                  hintText: '••••',
                  errorText: _oldPinError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppTheme.primaryGreen),
                  ),
                ),
                onChanged: (value) {
                  if (_oldPinError != null) {
                    setState(() {
                      _oldPinError = null;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),

              // New PIN Input
              TextField(
                controller: _newPinController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New PIN',
                  hintText: '••••',
                  errorText: _newPinError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppTheme.primaryGreen),
                  ),
                ),
                onChanged: (value) {
                  if (_newPinError != null) {
                    setState(() {
                      _newPinError = null;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),

              // Confirm PIN Input
              TextField(
                controller: _confirmPinController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm New PIN',
                  hintText: '••••',
                  errorText: _confirmPinError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppTheme.primaryGreen),
                  ),
                ),
                onChanged: (value) {
                  if (_confirmPinError != null) {
                    setState(() {
                      _confirmPinError = null;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _clearControllers();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Update PIN Button
                  Expanded(
                    child: Observer(
                      builder: (_) => ElevatedButton(
                        onPressed: widget.profileStore.isLoading
                            ? null
                            : _handleUpdatePin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryGreen,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: widget.profileStore.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Update PIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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

  void _clearControllers() {
    _oldPinController.clear();
    _newPinController.clear();
    _confirmPinController.clear();
  }
}
