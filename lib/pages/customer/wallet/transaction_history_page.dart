import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  int _selectedFilter = 0;

  final List<String> _filters = ['All', 'Top Up', 'Payment', 'Withdrawal'];

  final List<Map<String, dynamic>> _allTransactions = [
    {'date': 'Today', 'items': [
      {'title': 'Wallet Top Up', 'date': '10:30 AM', 'amount': '+ 10,000 FCFA', 'isCredit': true, 'icon': Icons.arrow_downward, 'iconColor': AppColors.success},
      {'title': 'Rose Garden Restaurant', 'date': '12:15 PM', 'amount': '- 4,500 FCFA', 'isCredit': false, 'icon': Icons.arrow_upward, 'iconColor': AppColors.error},
    ]},
    {'date': 'Yesterday', 'items': [
      {'title': 'Wallet Top Up', 'date': '9:00 AM', 'amount': '+ 5,000 FCFA', 'isCredit': true, 'icon': Icons.arrow_downward, 'iconColor': AppColors.success},
      {'title': 'La Terrasse Pizza', 'date': '7:45 PM', 'amount': '- 3,200 FCFA', 'isCredit': false, 'icon': Icons.arrow_upward, 'iconColor': AppColors.error},
    ]},
    {'date': 'Jun 18', 'items': [
      {'title': 'Bank Transfer', 'date': '2:30 PM', 'amount': '- 15,000 FCFA', 'isCredit': false, 'icon': Icons.arrow_upward, 'iconColor': AppColors.warning},
    ]},
    {'date': 'Jun 17', 'items': [
      {'title': 'Ocean Breeze Sushi', 'date': '8:00 PM', 'amount': '- 6,500 FCFA', 'isCredit': false, 'icon': Icons.arrow_upward, 'iconColor': AppColors.error},
      {'title': 'Wallet Top Up', 'date': '3:15 PM', 'amount': '+ 8,000 FCFA', 'isCredit': true, 'icon': Icons.arrow_downward, 'iconColor': AppColors.success},
    ]},
    {'date': 'Jun 15', 'items': [
      {'title': 'Wallet Top Up', 'date': '11:20 AM', 'amount': '+ 20,000 FCFA', 'isCredit': true, 'icon': Icons.arrow_downward, 'iconColor': AppColors.success},
    ]},
    {'date': 'Jun 14', 'items': [
      {'title': 'Spice Kitchen Biryani', 'date': '1:00 PM', 'amount': '- 2,800 FCFA', 'isCredit': false, 'icon': Icons.arrow_upward, 'iconColor': AppColors.error},
      {'title': 'Payment Refund', 'date': '11:00 AM', 'amount': '+ 4,500 FCFA', 'isCredit': true, 'icon': Icons.arrow_downward, 'iconColor': AppColors.success},
    ]},
    {'date': 'Jun 12', 'items': [
      {'title': 'Withdrawal to Bank', 'date': '5:00 PM', 'amount': '- 25,000 FCFA', 'isCredit': false, 'icon': Icons.arrow_upward, 'iconColor': AppColors.warning},
      {'title': 'The Harbour Grill', 'date': '1:30 PM', 'amount': '- 5,200 FCFA', 'isCredit': false, 'icon': Icons.arrow_upward, 'iconColor': AppColors.error},
      {'title': 'Wallet Top Up', 'date': '9:00 AM', 'amount': '+ 15,000 FCFA', 'isCredit': true, 'icon': Icons.arrow_downward, 'iconColor': AppColors.success},
    ]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181C2E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Transaction History',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF181C2E),
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          _buildFilterChips(),
          const Divider(height: 1, color: AppColors.grey200),
          Expanded(child: _buildTransactionList()),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 56,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedFilter == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = index),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.grey100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  _filters[index],
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isSelected ? AppColors.white : const Color(0xFF646982),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      itemCount: _allTransactions.length,
      itemBuilder: (context, sectionIndex) {
        final section = _allTransactions[sectionIndex];
        final items = section['items'] as List<Map<String, dynamic>>;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section['date'] as String,
              style: AppTextStyles.titleMedium.copyWith(
                color: const Color(0xFF181C2E),
              ),
            ),
            const SizedBox(height: 12),
            ...items.map((tx) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: (tx['iconColor'] as Color).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(tx['icon'] as IconData, color: tx['iconColor'] as Color, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx['title'] as String,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: const Color(0xFF181C2E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          tx['date'] as String,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: const Color(0xFF646982),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    tx['amount'] as String,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: (tx['isCredit'] as bool) ? AppColors.success : AppColors.error,
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}
