import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'transaction_history_page.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final List<Map<String, dynamic>> _transactions = [
    {
      'type': 'Top Up',
      'icon': Icons.arrow_downward,
      'iconColor': AppColors.success,
      'title': 'Wallet Top Up',
      'date': 'Today, 10:30 AM',
      'amount': '+ 10,000 FCFA',
      'isCredit': true,
    },
    {
      'type': 'Payment',
      'icon': Icons.arrow_upward,
      'iconColor': AppColors.error,
      'title': 'Rose Garden Restaurant',
      'date': 'Today, 12:15 PM',
      'amount': '- 4,500 FCFA',
      'isCredit': false,
    },
    {
      'type': 'Top Up',
      'icon': Icons.arrow_downward,
      'iconColor': AppColors.success,
      'title': 'Wallet Top Up',
      'date': 'Yesterday, 9:00 AM',
      'amount': '+ 5,000 FCFA',
      'isCredit': true,
    },
    {
      'type': 'Payment',
      'icon': Icons.arrow_upward,
      'iconColor': AppColors.error,
      'title': 'La Terrasse Pizza',
      'date': 'Yesterday, 7:45 PM',
      'amount': '- 3,200 FCFA',
      'isCredit': false,
    },
    {
      'type': 'Withdrawal',
      'icon': Icons.arrow_upward,
      'iconColor': AppColors.warning,
      'title': 'Bank Transfer',
      'date': 'Jun 18, 2:30 PM',
      'amount': '- 15,000 FCFA',
      'isCredit': false,
    },
    {
      'type': 'Payment',
      'icon': Icons.arrow_upward,
      'iconColor': AppColors.error,
      'title': 'Ocean Breeze Sushi',
      'date': 'Jun 17, 8:00 PM',
      'amount': '- 6,500 FCFA',
      'isCredit': false,
    },
    {
      'type': 'Top Up',
      'icon': Icons.arrow_downward,
      'iconColor': AppColors.success,
      'title': 'Wallet Top Up',
      'date': 'Jun 15, 11:20 AM',
      'amount': '+ 20,000 FCFA',
      'isCredit': true,
    },
    {
      'type': 'Payment',
      'icon': Icons.arrow_upward,
      'iconColor': AppColors.error,
      'title': 'Spice Kitchen Biryani',
      'date': 'Jun 14, 1:00 PM',
      'amount': '- 2,800 FCFA',
      'isCredit': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF181C2E),
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 8),
            _buildQuickActions(),
            const SizedBox(height: 8),
            _buildRecentTransactions(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.surface,
              const Color(0xFF2D2D44),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Balance',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.grey400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '25,000 FCFA',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        'Top Up',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.white, width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        'Withdraw',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
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

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.add_circle_outline, 'label': 'Top Up'},
      {'icon': Icons.send_rounded, 'label': 'Send'},
      {'icon': Icons.receipt_long, 'label': 'Request'},
      {'icon': Icons.download_rounded, 'label': 'Withdraw'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: actions.map((action) {
          return Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  action['icon'] as IconData,
                  color: AppColors.surface,
                  size: 24,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                action['label'] as String,
                style: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF646982),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: AppTextStyles.titleLarge.copyWith(
                  color: const Color(0xFF181C2E),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TransactionHistoryPage(),
                    ),
                  );
                },
                child: Text(
                  'See All',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: _transactions.length,
          itemBuilder: (context, index) {
            final tx = _transactions[index];
            return _TransactionTile(
              icon: tx['icon'] as IconData,
              iconColor: tx['iconColor'] as Color,
              title: tx['title'] as String,
              date: tx['date'] as String,
              amount: tx['amount'] as String,
              isCredit: tx['isCredit'] as bool,
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String date;
  final String amount;
  final bool isCredit;

  const _TransactionTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.date,
    required this.amount,
    required this.isCredit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: const Color(0xFF181C2E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF646982),
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: AppTextStyles.labelLarge.copyWith(
              color: isCredit ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
