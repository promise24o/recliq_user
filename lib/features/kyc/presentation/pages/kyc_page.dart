import 'package:flutter/material.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../../core/di/service_locator.dart';
import '../../../profile/presentation/mobx/profile_store.dart';
import '../../domain/repositories/kyc_repository.dart';
import '../widgets/kyc_type_selection_sheet.dart';
import 'bvn_verification_page.dart';
import 'business_details_page.dart';

class KycPage extends StatefulWidget {
  const KycPage({super.key});

  @override
  State<KycPage> createState() => _KycPageState();
}

class _KycPageState extends State<KycPage> with WidgetsBindingObserver {
  bool _isLoading = true;
  String? _userType;
  String? _currentTier;
  String? _status;
  Map<String, dynamic>? _limits;
  List<String>? _nextTierRequirements;
  String? _rejectionReason;
  bool _emailVerified = false;
  bool _bvnVerified = false;
  bool _documentsUploaded = false;
  bool _selfieUploaded = false;
  bool _businessDocumentsUploaded = false;
  late final ProfileStore _profileStore;
  late final KycRepository _kycRepository;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _profileStore = getIt<ProfileStore>();
    _kycRepository = getIt<KycRepository>();
    _loadProfileAndKycStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Refresh KYC status when app resumes (e.g., after navigation)
      _loadProfileAndKycStatus();
    }
  }

  @override
  void didUpdateWidget(KycPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Refresh KYC status when page is updated/comes back to foreground
    _loadProfileAndKycStatus();
  }

  Future<void> _loadProfileAndKycStatus() async {
    print('DEBUG: Loading profile data first...');
    await _profileStore.loadProfileData();
    print('DEBUG: Profile data loaded, now checking user...');
    _loadKycStatus();
  }

  Future<void> _loadKycStatus() async {
    try {
      final user = _profileStore.user;
      if (user == null) {
        print('DEBUG: No user found, setting loading to false');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      print('DEBUG: User found: ${user.id}, calling KYC status API');
      final result = await _kycRepository.getKycStatus(user.id);
      
      setState(() {
        _isLoading = false;
        result.fold(
          (failure) {
            print('DEBUG: KYC status API failed: ${failure.message}');
            // Handle error - set default values
            _userType = 'individual';
            _currentTier = 'sprout';
            _status = 'pending';
            _limits = {
              'dailyWithdrawal': 1000000,
              'maxWalletBalance': 5000000,
            };
            _nextTierRequirements = ['BVN verification required'];
            _rejectionReason = failure.message ?? 'Failed to load KYC status';
          },
          (kycStatus) {
            print('DEBUG: KYC status API success: ${kycStatus.status}, tier: ${kycStatus.currentTier}');
            _userType = kycStatus.userType.toLowerCase();
            _currentTier = kycStatus.currentTier.toLowerCase();
            _status = kycStatus.status.toLowerCase();
            _limits = {
              'dailyWithdrawal': kycStatus.limits.dailyWithdrawal,
              'maxWalletBalance': kycStatus.limits.maxWalletBalance,
            };
            _nextTierRequirements = kycStatus.nextTierRequirements;
            _rejectionReason = null; // KycStatus doesn't have rejectionReason field
            
            // Set verification status flags
            _emailVerified = kycStatus.emailVerified;
            _bvnVerified = kycStatus.bvnVerified;
            _documentsUploaded = kycStatus.documentsUploaded;
            _selfieUploaded = kycStatus.selfieUploaded;
            _businessDocumentsUploaded = kycStatus.businessDocumentsUploaded;
          },
        );
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        // Set default values on error
        _userType = 'individual';
        _currentTier = 'sprout';
        _status = 'pending';
        _limits = {
          'dailyWithdrawal': 1000000,
          'maxWalletBalance': 5000000,
        };
        _nextTierRequirements = ['BVN verification required'];
        _rejectionReason = e.toString();
      });
    }
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
          'KYC Verification',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: LoadingOverlay(
        isVisible: _isLoading,
        message: 'Loading KYC status...',
        child: RefreshIndicator(
          onRefresh: _loadProfileAndKycStatus,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatusCard(),
                const SizedBox(height: 24),
                _buildContentBasedOnStatus(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getStatusColor().withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getStatusIcon(),
                  color: _getStatusColor(),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_currentTier?.toUpperCase() ?? 'SPROUT'} Tier',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    _getStatusText(),
                    style: TextStyle(
                      color: _getStatusColor(),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'Current Limits',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildLimitRow(
            'Daily Withdrawal',
            '₦${(_limits?['dailyWithdrawal'] ?? 0).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
          ),
          const SizedBox(height: 8),
          _buildLimitRow(
            'Max Wallet Balance',
            '₦${(_limits?['maxWalletBalance'] ?? 0).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
          ),
        ],
      ),
    );
  }

  Widget _buildLimitRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (_status) {
      case 'verified':
        return Colors.green;
      case 'pending_admin_approval':
        return Colors.orange;
      case 'rejected':
        return Colors.red;
      case 'in_progress':
        return Colors.blue;
      case 'pending':
      default:
        return Colors.orange;
    }
  }

  IconData _getStatusIcon() {
    switch (_status) {
      case 'verified':
        return Icons.verified;
      case 'pending_admin_approval':
        return Icons.pending_actions;
      case 'rejected':
        return Icons.cancel;
      case 'in_progress':
        return Icons.hourglass_top;
      case 'pending':
      default:
        return Icons.pending_outlined;
    }
  }

  String _getStatusText() {
    switch (_status) {
      case 'verified':
        return 'Verified';
      case 'pending_admin_approval':
        return 'Pending Admin Approval';
      case 'rejected':
        return 'Rejected';
      case 'in_progress':
        return 'In Progress';
      case 'pending':
      default:
        return 'Pending Verification';
    }
  }

  Widget _buildContentBasedOnStatus() {
    switch (_status) {
      case 'verified':
        return _buildVerifiedContent();
      case 'rejected':
        return _buildRejectedContent();
      case 'pending_admin_approval':
        return _buildPendingApprovalContent();
      case 'in_progress':
        return _buildInProgressContent();
      case 'pending':
      default:
        return _buildPendingContent();
    }
  }

  Widget _buildVerifiedContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.verified,
                color: Colors.green,
                size: 24,
              ),
              const SizedBox(width: 12),
              const Text(
                'KYC Verification Complete',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _userType == 'individual'
                ? 'Your account has been verified and upgraded to ${_currentTier?.toUpperCase()} tier. You now have access to all features and higher limits.'
                : 'Your business account has been verified. You can now access all enterprise features and enjoy higher transaction limits.',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRejectedContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 24,
              ),
              const SizedBox(width: 12),
              const Text(
                'KYC Verification Rejected',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_rejectionReason != null) ...[
            Text(
              'Reason: $_rejectionReason',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
          ],
          const Text(
            'Please review the requirements and resubmit your verification.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          _buildStartButton(context),
        ],
      ),
    );
  }

  Widget _buildPendingApprovalContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.hourglass_empty,
                color: Colors.orange,
                size: 24,
              ),
              const SizedBox(width: 12),
              const Text(
                'Awaiting Admin Approval',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Your documents have been submitted and are currently under review by our verification team. This process typically takes 1-3 business days.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[900]?.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.grey,
                  size: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'You will receive a notification once the review is complete.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingContent() {
    return Column(
      children: [
        _buildVerificationSteps(),
        const SizedBox(height: 24),
        _buildStartButton(context),
      ],
    );
  }

  Widget _buildVerificationSteps() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upgrade Your Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _buildStep(1, 'Choose Verification Type', 'Individual (BVN) or Enterprise (Business)', true),
          _buildStep(2, 'Complete Verification', 'Submit required documents and information', false),
          _buildStep(3, 'Unlock Higher Limits', 'Access increased transaction and wallet limits', false),
          const SizedBox(height: 16),
          Container(
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
                      'Important Information',
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
                  'To verify your BVN, you will need to provide your bank account number. Please ensure:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                _buildInfoPoint('Your bank account name matches your registered name'),
                _buildInfoPoint('Your account is linked to your BVN'),
                _buildInfoPoint('Your date of birth matches your BVN records'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int number, String title, String subtitle, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isActive ? AppTheme.primaryGreen : Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(
                  color: isActive ? Colors.black : Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInProgressContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.hourglass_top,
                color: Colors.blue,
                size: 32,
              ),
              const SizedBox(width: 12),
              const Text(
                'KYC Verification In Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Your enterprise KYC verification is currently being reviewed by our team. We\'ve received your business documents and are processing them.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          if (_userType == 'enterprise') ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900]?.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[800]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enterprise Verification Status',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildVerificationItem('Email Verification', _emailVerified),
                  _buildVerificationItem('BVN Verification', _bvnVerified),
                  _buildVerificationItem('Business Details', true),
                  _buildVerificationItem('Business Documents', _businessDocumentsUploaded),
                  const SizedBox(height: 12),
                  const Text(
                    'Your business documents are under review. This typically takes 1-2 business days.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'What\'s Next?',
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
                  '• We\'ll review your submitted documents\n• You may be contacted for additional information\n• You\'ll receive notification once verification is complete\n• Current limits remain in place during review',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationItem(String title, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: isCompleted ? Colors.white : Colors.grey,
              fontSize: 14,
              fontWeight: isCompleted ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _showKycTypeSelection(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryGreen,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          _status == 'pending' ? 'Continue KYC Verification' : 'Start KYC Verification',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showKycTypeSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => KycTypeSelectionSheet(
        onTypeSelected: (userType) {
          if (userType == 'individual') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BvnVerificationPage(),
              ),
            );
          } else if (userType == 'enterprise') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BusinessDetailsPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
