import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/app_header.dart';
import '../../../../core/di/service_locator.dart';
import '../mobx/wallet_store.dart';
import '../../../profile/presentation/mobx/profile_store.dart';
import '../widgets/modern_wallet_card.dart';
import '../widgets/modern_menu_item.dart';
import '../widgets/modern_transaction_preview.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TickerProviderStateMixin {
  late WalletStore store;
  final _profileStore = getIt<ProfileStore>();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    store = GetIt.I<WalletStore>();
    store.refreshAll();
    store.loadWalletOverview(forceRefresh: true);
    _loadProfileDataIfNeeded();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadProfileDataIfNeeded() async {
    if (_profileStore.user == null) {
      await _profileStore.loadProfileData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SafeArea(
        child: Observer(
          builder: (_) => Column(
            children: [
              // Header
              _buildHeader(),

              // Main Scrollable Content
              Expanded(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await store.loadWalletOverview(forceRefresh: true);
                    },
                    color: AppTheme.primaryGreen,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),

                          // Wallet Card
                          Observer(
                            builder: (_) =>
                                ModernWalletCard(walletStore: store),
                          ),

                          const SizedBox(height: 32),

                          // Quick Actions
                          _buildQuickActions(),

                          const SizedBox(height: 40),

                          // Recent Transaction
                          ModernTransactionPreview(
                            transaction: store.lastTransaction,
                            onViewAll: () => context.go('/wallet/transactions'),
                          ),

                          const SizedBox(height: 40),

                          // More Options Menu
                          _buildMenuItems(),

                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return AppHeader(
      title: 'Manage Your Funds',
      subtitle: 'Your Wallet',
      showBackButton: true,
      onLeadingTap: () => context.go('/home'),
      profileStore: _profileStore,
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surfaceDark,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderSoft),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withOpacity(0.3)),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey[400], fontSize: 13),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildActionCard(
              icon: Icons.credit_score_outlined,
              title: 'Withdraw',
              subtitle: 'Send earnings to bank',
              color: AppTheme.primaryGreen,
              onTap: () => context.go('/wallet/withdraw'),
            ),
            const SizedBox(width: 16),
            _buildActionCard(
              icon: Icons.phone_android,
              title: 'Airtime & Data',
              subtitle: 'Top up mobile',
              color: const Color(0xFF9C27B0),
              onTap: () => context.go('/wallet/airtime-data'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildActionCard(
              icon: FontAwesomeIcons.trophy,
              title: 'Rewards',
              subtitle: 'Badges & points',
              color: const Color(0xFFFF9800),
              onTap: () => context.go('/wallet/rewards'),
            ),
            const SizedBox(width: 16),
            _buildActionCard(
              icon: Icons.history,
              title: 'Transaction History',
              subtitle: 'View all activity',
              color: const Color(0xFF2196F3),
              onTap: () => context.go('/wallet/transactions'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'More Options',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        ModernMenuItem(
          icon: FontAwesomeIcons.buildingColumns,
          title: 'Bank Accounts',
          subtitle: 'Manage linked accounts',
          onTap: () => context.go('/wallet/bank-accounts'),
        ),
        const SizedBox(height: 12),
        ModernMenuItem(
          icon: FontAwesomeIcons.chartLine,
          title: 'Earnings Breakdown',
          subtitle: 'View detailed earnings report and analytics',
          onTap: () => context.go('/wallet/earnings'),
        ),
      ],
    );
  }
}
