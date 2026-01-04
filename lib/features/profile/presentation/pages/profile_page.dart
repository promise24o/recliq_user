import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/account_section.dart';
import '../widgets/personal_info_section.dart';
import '../widgets/preferences_section.dart';
import '../widgets/profile_header.dart';
import '../widgets/security_section.dart';

import '../mobx/profile_store.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../shared/services/toast_service.dart';
import '../../../../shared/themes/app_theme.dart';

import '../../../auth/presentation/pages/auth_gate_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileStore = getIt<ProfileStore>();
  final _phoneController = TextEditingController();
  String? _phoneError;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    await _profileStore.loadProfileData();
    _phoneController.text = _profileStore.user?.phoneNumber ?? '';
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleUpdateProfile() async {
    setState(() {
      _phoneError = null;
    });

    final phone = _phoneController.text;
    if (phone.isEmpty) {
      setState(() {
        _phoneError = 'Phone number is required';
      });
      return;
    }

    if (phone.length != 11 || !phone.startsWith('0')) {
      setState(() {
        _phoneError = 'Enter a valid Nigerian phone number (e.g., 09031292671)';
      });
      return;
    }

    await _profileStore.updateProfile(
      name: _profileStore.user?.name ?? '',
      phone: _phoneController.text,
      profilePhoto: _profileStore.user?.profilePhoto,
      priceUpdates: _profileStore.priceUpdates,
      loginEmails: _profileStore.loginEmails,
    );

    if (_profileStore.error == null) {
      ToastService.showSuccess('Profile updated successfully!');
    }
  }

  Future<void> _handleUploadPhoto() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );

      if (image != null) {
        await _profileStore.uploadProfilePhoto(image.path);
        if (_profileStore.error == null) {
          ToastService.showSuccess('Photo uploaded successfully!');
        }
      }
    } catch (e) {
      ToastService.showError('Failed to upload photo');
    }
  }

  void _handleLogout() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF050214),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF1F6B43),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1F6B43).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF1F6B43).withValues(alpha: 0.3),
                ),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: Color(0xFF1F6B43),
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Color(0xFF1F6B43),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await _profileStore.logout();
                      if (mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AuthGatePage(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050214),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF050214),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              profileStore: _profileStore,
              onUploadPhoto: _handleUploadPhoto,
            ),
            PersonalInfoSection(
              profileStore: _profileStore,
              phoneController: _phoneController,
              phoneError: _phoneError,
              onUpdateProfile: _handleUpdateProfile,
            ),
            SecuritySection(
              profileStore: _profileStore,
            ),
            PreferencesSection(
              profileStore: _profileStore,
            ),
            AccountSection(
              profileStore: _profileStore,
              onLogout: _handleLogout,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
