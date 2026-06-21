import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  final List<Map<String, dynamic>> _rewards = [
    {'title': '500 FCFA Off', 'points': 200, 'icon': Icons.monetization_on_outlined, 'iconColor': const Color(0xFFF59E0B)},
    {'title': 'Free Delivery', 'points': 150, 'icon': Icons.delivery_dining, 'iconColor': AppColors.primary},
    {'title': 'Free Drink', 'points': 300, 'icon': Icons.local_drink_outlined, 'iconColor': const Color(0xFF3B82F6)},
    {'title': '20% Off Entire Order', 'points': 500, 'icon': Icons.percent, 'iconColor': const Color(0xFF10B981)},
  ];

  final List<Map<String, dynamic>> _recentRewards = [
    {'title': 'Free Delivery', 'date': 'Redeemed Jun 18', 'points': '-150 pts'},
    {'title': '500 FCFA Off', 'date': 'Redeemed Jun 10', 'points': '-200 pts'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Rewards',
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
            _buildPointsCard(),
            const SizedBox(height: 24),
            _buildAvailableRewards(),
            const SizedBox(height: 24),
            _buildRecentRewards(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsCard() {
    final double progress = 750 / 1000;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Points',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '1,250 pts',
              style: GoogleFonts.inter(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white.withValues(alpha: 0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '750 / 1,000 pts to next reward',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailableRewards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Available Rewards',
            style: AppTextStyles.titleLarge.copyWith(
              color: const Color(0xFF181C2E),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _rewards.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.82,
            ),
            itemBuilder: (context, index) {
              final reward = _rewards[index];
              return _RewardCard(
                title: reward['title'] as String,
                points: reward['points'] as int,
                icon: reward['icon'] as IconData,
                iconColor: reward['iconColor'] as Color,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecentRewards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Recent Rewards',
            style: AppTextStyles.titleLarge.copyWith(
              color: const Color(0xFF181C2E),
            ),
          ),
        ),
        const SizedBox(height: 12),
        ..._recentRewards.map((reward) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.card_giftcard,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reward['title'] as String,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: const Color(0xFF181C2E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        reward['date'] as String,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: const Color(0xFF646982),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  reward['points'] as String,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}

class _RewardCard extends StatelessWidget {
  final String title;
  final int points;
  final IconData icon;
  final Color iconColor;

  const _RewardCard({
    required this.title,
    required this.points,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: const Color(0xFF181C2E),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$points pts',
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Redeem',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
