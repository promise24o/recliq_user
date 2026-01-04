import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../mobx/profile_store.dart';

class PersonalInfoSection extends StatelessWidget {
  final ProfileStore profileStore;
  final TextEditingController phoneController;
  final String? phoneError;
  final VoidCallback onUpdateProfile;

  const PersonalInfoSection({
    super.key,
    required this.profileStore,
    required this.phoneController,
    required this.phoneError,
    required this.onUpdateProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Personal Information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Name (Read-only)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              label: "Full Name",
              hint: "Your full name",
              icon: Icons.person_outline,
              controller:
                  TextEditingController(text: profileStore.user?.name ?? ''),
              enabled: false,
            ),
          ),
          const SizedBox(height: 16),
          // Phone Number
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              label: "Phone Number",
              hint: "Enter your phone number (e.g., 09031292971)",
              icon: Icons.phone_outlined,
              controller: phoneController,
              errorText: phoneError,
              isPhone: true,
              onChanged: (value) {
                // Only allow digits
                if (value.isNotEmpty && !RegExp(r'^[0-9]*$').hasMatch(value)) {
                  phoneController.text =
                      value.replaceAll(RegExp(r'[^0-9]'), '');
                  phoneController.selection = TextSelection.fromPosition(
                    TextPosition(offset: phoneController.text.length),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          // Referral Code (Read-only)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              label: "Referral Code",
              hint: "Your referral code",
              icon: FontAwesomeIcons.gift,
              controller: TextEditingController(
                  text: profileStore.user?.referralCode ?? ''),
              enabled: false,
            ),
          ),
          const SizedBox(height: 8),
          // Referral Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.primaryGreen.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.infoCircle,
                    color: AppTheme.primaryGreen,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Share your referral code with friends to earn 100 Recliq Points for each successful referral!',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Observer(
                builder: (_) => ElevatedButton(
                  onPressed: profileStore.isLoading ? null : onUpdateProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: profileStore.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          "Update Profile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
