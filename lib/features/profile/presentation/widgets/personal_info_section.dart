import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/location_autocomplete.dart';
import '../mobx/profile_store.dart';

class PersonalInfoSection extends StatefulWidget {
  final ProfileStore profileStore;
  final TextEditingController phoneController;
  final String? phoneError;
  final VoidCallback onUpdateProfile;
  final Function(LocationData) onLocationSelected;

  const PersonalInfoSection({
    super.key,
    required this.profileStore,
    required this.phoneController,
    required this.phoneError,
    required this.onUpdateProfile,
    required this.onLocationSelected,
  });

  @override
  State<PersonalInfoSection> createState() => _PersonalInfoSectionState();
}

class _PersonalInfoSectionState extends State<PersonalInfoSection> {
  LocationData? _selectedLocation;
  TextEditingController? _nameController;
  TextEditingController? _referralController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _referralController = TextEditingController();
    // Initialize immediately if user data is already available
    if (widget.profileStore.user != null) {
      _updateControllers();
    }
  }

  
  @override
  void dispose() {
    _nameController?.dispose();
    _referralController?.dispose();
    super.dispose();
  }

  void _updateControllers() {
    if (_nameController == null || _referralController == null) return;
    
    final user = widget.profileStore.user;
    
    _nameController!.text = user?.name ?? '';
    _referralController!.text = user?.referralCode ?? '';
    
    // Initialize location from user data if available
    if (user?.location != null) {
      final location = user!.location!;
      _selectedLocation = LocationData(
        address: location.address ?? '',
        city: location.city ?? '',
        state: location.state ?? '',
        country: location.country ?? '',
        latitude: location.coordinates?[1] ?? 0.0, // latitude is second element
        longitude: location.coordinates?[0] ?? 0.0, // longitude is first element
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get current user data - Observer ensures this rebuilds when user changes
    final user = widget.profileStore.user;
    
    // Update controllers with current user data
    if (user != null) {
      _nameController?.text = user.name ?? '';
      _referralController?.text = user.referralCode ?? '';
      
      // Initialize location if not already set
      if (_selectedLocation == null && user.location != null) {
        final location = user.location!;
        _selectedLocation = LocationData(
          address: location.address ?? '',
          city: location.city ?? '',
          state: location.state ?? '',
          country: location.country ?? '',
          latitude: location.coordinates?[1] ?? 0.0,
          longitude: location.coordinates?[0] ?? 0.0,
        );
      }
    }
    
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
                  controller: _nameController ?? TextEditingController(),
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
                  controller: widget.phoneController,
                  errorText: widget.phoneError,
                  isPhone: true,
                  onChanged: (value) {
                    // Only allow digits
                    if (value.isNotEmpty && !RegExp(r'^[0-9]*$').hasMatch(value)) {
                      widget.phoneController.text =
                          value.replaceAll(RegExp(r'[^0-9]'), '');
                      widget.phoneController.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.phoneController.text.length),
                      );
                    }
                  },
            ),
          ),
          const SizedBox(height: 16),
          // Location
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_selectedLocation?.fullAddress != null)
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Current Address: ${_selectedLocation!.fullAddress}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                Builder(
              builder: (context) {
                return LocationAutocomplete(
                  initialValue: _selectedLocation?.fullAddress,
                  hintText: 'Enter your address',
                  onLocationSelected: (location) {
                    setState(() {
                      _selectedLocation = location;
                    });
                    widget.onLocationSelected(location);
                  },
                );
              },
            ),
              ],
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
              controller: _referralController ?? TextEditingController(),
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
                  onPressed: widget.profileStore.isLoading ? null : widget.onUpdateProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
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
