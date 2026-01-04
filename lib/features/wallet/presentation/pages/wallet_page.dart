import 'package:flutter/material.dart';
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
    store = WalletStoreFactory.createFake();
    store.refreshAll();
    _loadProfileDataIfNeeded();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

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
          builder: (context) {
            return Column(
              children: [
                // Header matching home page
                _buildHeader(),

                // Main Content
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
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),

                          // Modern Wallet Card
                          ModernWalletCard(
                            balance: store.availableBalance,
                            totalEarnings: store.totalEarnings,
                            todayEarnings: store.todayEarnings,
                            accountNumber: store.accountNumber,
                            accountName: store.accountName,
                          ),

                          const SizedBox(height: 24),

                          // Quick Actions
                          _buildQuickActions(),

                          const SizedBox(height: 32),

                          // Recent Transaction Preview
                          ModernTransactionPreview(
                            transaction: store.lastTransaction,
                            onViewAll: () => context.go('/wallet/transactions'),
                          ),

                          const SizedBox(height: 32),

                          // Menu Items
                          _buildMenuItems(),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
          ],
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
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                icon: Icons.credit_score,
                title: 'Withdraw',
                subtitle: 'Send to bank',
                color: const Color(0xFF1F6B43),
                onTap: () => context.go('/wallet/withdraw'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionCard(
                icon: Icons.phone,
                title: 'Airtime',
                subtitle: 'Buy airtime/data',
                color: const Color(0xFF9C27B0),
                onTap: () => context.go('/wallet/airtime-data'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                icon: FontAwesomeIcons.trophy,
                title: 'Rewards',
                subtitle: 'View rewards',
                color: const Color(0xFFFF9800),
                onTap: () => context.go('/wallet/rewards'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionCard(
                icon: Icons.history,
                title: 'History',
                subtitle: 'All transactions',
                color: const Color(0xFF2196F3),
                onTap: () => context.go('/wallet/transactions'),
              ),
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
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ModernMenuItem(
          icon: FontAwesomeIcons.buildingColumns,
          title: 'Bank Accounts',
          subtitle: 'Manage withdrawal accounts',
          onTap: () => context.go('/wallet/bank-accounts'),
        ),
        const SizedBox(height: 12),
        ModernMenuItem(
          icon: FontAwesomeIcons.chartLine,
          title: 'Earnings',
          subtitle: 'View detailed breakdown',
          onTap: () => context.go('/wallet/earnings'),
        ),
      ],
    );
  }
}
