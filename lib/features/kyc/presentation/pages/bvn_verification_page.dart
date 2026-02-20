import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:dartz/dartz.dart' hide State;
import '../../../../shared/themes/app_theme.dart';
import '../../../../core/di/service_locator.dart';
import '../../../wallet/presentation/mobx/bank_accounts_store.dart';
import '../../../profile/presentation/mobx/profile_store.dart';
import '../../../wallet/domain/entities/bank.dart';
import '../../domain/repositories/kyc_repository.dart';
import '../../../../shared/widgets/custom_searchable_dropdown.dart';
import '../../../../shared/widgets/loading_overlay.dart';

class BvnVerificationPage extends StatefulWidget {
  const BvnVerificationPage({super.key});

  @override
  State<BvnVerificationPage> createState() => _BvnVerificationPageState();
}

class _BvnVerificationPageState extends State<BvnVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _bvnController = TextEditingController();
  final _accountNumberController = TextEditingController();
  late final BankAccountsStore _bankAccountsStore;
  late final ProfileStore _profileStore;
  late final KycRepository _kycRepository;
  Bank? _selectedBank;
  String? _accountName;
  bool _isResolvingAccount = false;
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    _bankAccountsStore = getIt<BankAccountsStore>();
    _profileStore = getIt<ProfileStore>();
    _kycRepository = getIt<KycRepository>();
    _bankAccountsStore.loadBanks();
    _profileStore.loadProfileData();
  }

  @override
  void dispose() {
    _bvnController.dispose();
    _accountNumberController.dispose();
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
          'BVN Verification',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) => LoadingOverlay(
          isVisible: _bankAccountsStore.isBanksLoading || _isVerifying,
          message: _isVerifying ? 'Verifying BVN...' : 'Loading banks...',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard(),
                  const SizedBox(height: 24),
                  _buildBankSelection(),
                  const SizedBox(height: 16),
                  _buildAccountNumberField(),
                  if (_accountName != null) ...[
                    const SizedBox(height: 16),
                    _buildAccountNameDisplay(),
                  ],
                  const SizedBox(height: 16),
                  _buildBvnField(),
                  const SizedBox(height: 32),
                  _buildVerifyButton(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
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
                Icons.info_outline,
                color: AppTheme.primaryGreen,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Important',
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
            'Your bank account name must match your registered name and the account must be linked to your BVN.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankSelection() {
    return CustomSearchableDropdown<Bank>(
      items: _bankAccountsStore.banks,
      selectedItem: _selectedBank,
      hint: 'Select bank',
      label: 'Bank',
      icon: Icons.account_balance_outlined,
      displayText: (bank) => bank.name,
      searchFilter: (bank) => bank.name.toLowerCase(),
      onChanged: (bank) {
        setState(() {
          _selectedBank = bank;
          _accountName = null;
        });
      },
    );
  }

  Widget _buildAccountNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _accountNumberController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            hintText: 'Enter your 10-digit account number',
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
              return 'Please enter your account number';
            }
            if (value.length != 10) {
              return 'Account number must be 10 digits';
            }
            return null;
          },
          onChanged: (value) {
            if (value.length == 10 && _selectedBank != null) {
              _resolveAccount();
            }
          },
        ),
      ],
    );
  }

  Widget _buildAccountNameDisplay() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppTheme.primaryGreen,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account Name',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _accountName!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBvnField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'BVN (Bank Verification Number)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _bvnController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
          decoration: InputDecoration(
            hintText: 'Enter your 11-digit BVN',
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
              return 'Please enter your BVN';
            }
            if (value.length != 11) {
              return 'BVN must be 11 digits';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isVerifying ? null : _handleVerification,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryGreen,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
                'Verify BVN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Future<void> _resolveAccount() async {
    if (_isResolvingAccount || _selectedBank == null) return;

    setState(() {
      _isResolvingAccount = true;
      _accountName = null;
    });

    try {
      // TODO: Call API to resolve account using BankAccountsStore
      final result = await _bankAccountsStore.verifyBankAccount(
        bank: _selectedBank!,
        accountNumber: _accountNumberController.text,
      );

      setState(() {
        _accountName = result;
        _isResolvingAccount = false;
      });
    } catch (e) {
      setState(() {
        _isResolvingAccount = false;
      });
      // Handle error
    }
  }

  Future<void> _handleVerification() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_accountName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please wait for Bank Account Verification'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isVerifying = true;
    });

    try {
      final user = _profileStore.user;
      if (user == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not found. Please login again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      // Proceed with BVN verification (KYC already initialized)
      final result = await _kycRepository.verifyBvn(
        userId: user.id,
        bvn: _bvnController.text.trim(),
        accountNumber: _accountNumberController.text.trim(),
        bankCode: _selectedBank!.code,
        userName: user.name ?? 'User',
      );

      setState(() {
        _isVerifying = false;
      });

      if (mounted) {
        result.fold(
          (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message ?? 'Verification failed'),
                backgroundColor: Colors.red,
              ),
            );
          },
          (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response.message),
                backgroundColor: AppTheme.primaryGreen,
              ),
            );
            // Refresh KYC status before navigating back
            _profileStore.loadProfileData();
            Navigator.pop(context);
          },
        );
      }
    } catch (e) {
      setState(() {
        _isVerifying = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Verification failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
