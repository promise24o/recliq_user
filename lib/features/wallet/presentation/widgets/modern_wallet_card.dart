import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ModernWalletCard extends StatelessWidget {
  final double balance;
  final double totalEarnings;
  final double todayEarnings;
  final String accountNumber;
  final String accountName;

  const ModernWalletCard({
    super.key,
    required this.balance,
    required this.totalEarnings,
    required this.todayEarnings,
    required this.accountNumber,
    required this.accountName,
  });

  // Helper method to format number with commas
  String _formatNumber(double number) {
    final parts = number.toStringAsFixed(0).split('.');
    final integerPart = parts[0];
    final buffer = StringBuffer();

    for (int i = 0; i < integerPart.length; i++) {
      if (i > 0 && (integerPart.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(integerPart[i]);
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
          // Decorative Pattern
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Background Icons
          Positioned(
            right: 20,
            top: 20,
            child: Icon(
              FontAwesomeIcons.wallet,
              size: 40,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Positioned(
            right: 60,
            bottom: 20,
            child: Icon(
              FontAwesomeIcons.chartLine,
              size: 30,
              color: Colors.white.withOpacity(0.15),
            ),
          ),

          // Card Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Account Info with Icon
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        FontAwesomeIcons.userCircle,
                        size: 13,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            accountName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.creditCard,
                                size: 9,
                                color: Colors.white.withOpacity(0.7),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '****${accountNumber.substring(accountNumber.length - 4)}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 11,
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

                // Balance Section with Icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Balance',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          FontAwesomeIcons.nairaSign,
                          size: 18,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        const SizedBox(width: 3),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: _formatNumber(balance),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -1,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '.${balance.toStringAsFixed(2).split('.')[1]}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Stats Row with Icons - Better Aligned
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatWithIcon(
                        icon: FontAwesomeIcons.chartLine,
                        label: 'Total Earnings',
                        value: totalEarnings,
                      ),
                      Container(
                        width: 1,
                        height: 28,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      _buildStatWithIcon(
                        icon: FontAwesomeIcons.calendarDay,
                        label: "Today's",
                        value: todayEarnings,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatWithIcon({
    required IconData icon,
    required String label,
    required double value,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.nairaSign,
              size: 10,
              color: Colors.white.withOpacity(0.9),
            ),
            Text(
              _formatNumber(value),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
