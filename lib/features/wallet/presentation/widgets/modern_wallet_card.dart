import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/image_paths.dart';
import '../mobx/wallet_store.dart';

class ModernWalletCard extends StatefulWidget {
  final WalletStore walletStore;

  const ModernWalletCard({
    super.key,
    required this.walletStore,
  });

  @override
  State<ModernWalletCard> createState() => _ModernWalletCardState();
}

class _ModernWalletCardState extends State<ModernWalletCard> {
  String _formatNumber(double number) {
    final parts = number.toStringAsFixed(2).split('.');
    final integerPart = parts[0];
    final buffer = StringBuffer();

    for (int i = 0; i < integerPart.length; i++) {
      if (i > 0 && (integerPart.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(integerPart[i]);
    }

    return '${buffer.toString()}.${parts[1]}';
  }

  Widget _maskedBalance() => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          6,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      );

  void _copyAccountDetails() {
    final accountDetails =
        'Name: ${widget.walletStore.accountName}\nAccount Number: ${widget.walletStore.accountNumber}';
    Clipboard.setData(ClipboardData(text: accountDetails));
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account details copied!'),
        backgroundColor: Color(0xFF1F6B43),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Container(
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1F6B43),
                    Color(0xFF2E8B57),
                    Color(0xFF3CB371),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1F6B43).withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Card Pattern Background
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        ImagePaths.cardPattern,
                        fit: BoxFit.cover,
                        color: Colors.white.withOpacity(0.05),
                        colorBlendMode: BlendMode.overlay,
                      ),
                    ),
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Account row
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.18),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                FontAwesomeIcons.user,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.walletStore.accountName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.walletStore.accountNumber,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.85),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      GestureDetector(
                                        onTap: _copyAccountDetails,
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: const Icon(
                                            Icons.copy,
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        // Balance
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Available Balance',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                HapticFeedback.lightImpact();
                                widget.walletStore.toggleBalanceVisibility();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  widget.walletStore.isBalanceHidden
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  size: 12,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '₦',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(width: 4),
                            widget.walletStore.isBalanceHidden
                                ? _maskedBalance()
                                : Text(
                                    _formatNumber(
                                        widget.walletStore.availableBalance),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: -1,
                                    ),
                                  ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Mini Stats with improved design
                        Row(
                          children: [
                            Expanded(
                              child: _buildMiniStat(
                                icon: FontAwesomeIcons.calendarDay,
                                label: "Today's Earnings",
                                value: widget.walletStore.todayEarnings,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildMiniStat(
                                icon: FontAwesomeIcons.arrowDown,
                                label: "Last Withdrawal",
                                value: widget.walletStore.walletOverview
                                        ?.lastWithdrawnAmount ??
                                    0.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget _buildMiniStat({
    required IconData icon,
    required String label,
    required double value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 12,
                color: Colors.white.withOpacity(0.85),
              ),
              const SizedBox(width: 4),
              Icon(
                FontAwesomeIcons.nairaSign,
                size: 10,
                color: Colors.white.withOpacity(0.9),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            _formatNumber(value),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
