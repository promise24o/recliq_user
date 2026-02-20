import 'package:flutter/material.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/location_autocomplete.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/repositories/kyc_repository.dart';
import 'business_documents_page.dart';

class BusinessDetailsPage extends StatefulWidget {
  const BusinessDetailsPage({super.key});

  @override
  State<BusinessDetailsPage> createState() => _BusinessDetailsPageState();
}

class _BusinessDetailsPageState extends State<BusinessDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _businessDescriptionController = TextEditingController();
  final _businessEmailController = TextEditingController();
  final _businessPhoneController = TextEditingController();
  final _registrationNumberController = TextEditingController();
  final _taxIdController = TextEditingController();
  String? _selectedNature;
  LocationData? _selectedLocation;
  late final KycRepository _kycRepository;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _kycRepository = getIt<KycRepository>();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _businessDescriptionController.dispose();
    _businessEmailController.dispose();
    _businessPhoneController.dispose();
    _registrationNumberController.dispose();
    _taxIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Business Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard(),
              const SizedBox(height: 24),
              _buildTextField(
                label: 'Business Name',
                hint: 'Enter your business name',
                controller: _businessNameController,
              ),
              const SizedBox(height: 16),
              _buildAddressField(),
              const SizedBox(height: 16),
              _buildNatureOfBusinessDropdown(),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Business Description',
                hint: 'Describe your business',
                controller: _businessDescriptionController,
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Business Email',
                hint: 'business@example.com',
                controller: _businessEmailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Business Phone',
                hint: '+234XXXXXXXXXX',
                controller: _businessPhoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Registration Number',
                hint: 'RC123456',
                controller: _registrationNumberController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Tax Identification Number',
                hint: 'TIN123456789',
                controller: _taxIdController,
              ),
              const SizedBox(height: 32),
              _buildSubmitButton(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.primaryGreen.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.business,
                color: AppTheme.primaryGreen,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Enterprise Verification',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Provide your business details to complete KYC verification. You will need to upload business documents after this step.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[900]?.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[800]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[800]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppTheme.primaryGreen),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildAddressField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Business Address',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Builder(
          builder: (context) {
            return LocationAutocomplete(
              initialValue: _selectedLocation?.fullAddress,
              hintText: 'Enter your business address',
              onLocationSelected: (location) {
                setState(() {
                  _selectedLocation = location;
                });
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildNatureOfBusinessDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nature of Business',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900]?.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[800]!),
          ),
          child: DropdownButtonFormField<String>(
            value: _selectedNature,
            decoration: const InputDecoration(
              hintText: 'Select nature of business',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            dropdownColor: const Color(0xFF1A1A1A),
            style: const TextStyle(color: Colors.white, fontSize: 14),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
            items: const [
              DropdownMenuItem(value: 'office', child: Text('Office')),
              DropdownMenuItem(value: 'factory', child: Text('Factory')),
              DropdownMenuItem(value: 'estate', child: Text('Estate')),
              DropdownMenuItem(value: 'school', child: Text('School')),
              DropdownMenuItem(value: 'hotel', child: Text('Hotel')),
              DropdownMenuItem(value: 'retail', child: Text('Retail')),
              DropdownMenuItem(value: 'manufacturing', child: Text('Manufacturing')),
              DropdownMenuItem(value: 'healthcare', child: Text('Healthcare')),
              DropdownMenuItem(value: 'government', child: Text('Government')),
              DropdownMenuItem(value: 'other', child: Text('Other')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedNature = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select nature of business';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isSubmitting ? null : _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryGreen,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isSubmitting
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                'Submit Business Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedNature == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select nature of business'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter business address'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Prepare business details data
      final businessDetails = {
        'businessName': _businessNameController.text.trim(),
        'businessAddress': _selectedLocation!.fullAddress,
        'natureOfBusiness': _selectedNature,
        'businessDescription': _businessDescriptionController.text.trim(),
        'businessEmail': _businessEmailController.text.trim(),
        'businessPhone': _businessPhoneController.text.trim(),
        // Optional fields
        if (_registrationNumberController.text.trim().isNotEmpty)
          'registrationNumber': _registrationNumberController.text.trim(),
        if (_taxIdController.text.trim().isNotEmpty)
          'taxIdentificationNumber': _taxIdController.text.trim(),
        'businessLocation': {
          'latitude': _selectedLocation!.latitude,
          'longitude': _selectedLocation!.longitude,
          'address': _selectedLocation!.fullAddress,
        },
      };

      print('DEBUG: Submitting business details: $businessDetails');

      // Call API to submit business details
      final result = await _kycRepository.submitBusinessDetails(businessDetails);

      result.fold(
        (failure) {
          print('DEBUG: Business details submission failed: ${failure.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to submit business details: ${failure.message}'),
              backgroundColor: Colors.red,
            ),
          );
        },
        (success) {
          print('DEBUG: Business details submitted successfully');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Business details submitted successfully!'),
              backgroundColor: AppTheme.primaryGreen,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessDocumentsPage(),
            ),
          );
        },
      );
    } catch (e) {
      print('DEBUG: Error submitting business details: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error submitting business details: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }
}
