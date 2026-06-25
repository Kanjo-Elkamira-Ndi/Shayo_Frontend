import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<RunningOrder> _runningOrders = [
    RunningOrder(
      name: 'Rose Garden Restaurant',
      items: '2 Items - Burger, Fries',
      price: '\$24.00',
      status: 'Preparing',
      statusColor: const Color(0xFFFB6D3A),
      imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=200',
    ),
    RunningOrder(
      name: 'La Terrasse',
      items: '3 Items - Pizza, Pasta, Salad',
      price: '\$36.50',
      status: 'On the way',
      statusColor: AppColors.success,
      imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=200',
    ),
    RunningOrder(
      name: 'Ocean Breeze',
      items: '1 Item - Grilled Fish',
      price: '\$18.00',
      status: 'Pending',
      statusColor: AppColors.warning,
      imageUrl: 'https://images.unsplash.com/photo-1550966871-3ed3cdb51f3a?w=200',
    ),
  ];

  final List<PopularItem> _popularItems = [
    PopularItem(
      name: 'Classic Burger',
      price: '\$12.00',
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200',
    ),
    PopularItem(
      name: 'Pepperoni Pizza',
      price: '\$16.00',
      imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=200',
    ),
    PopularItem(
      name: 'Caesar Salad',
      price: '\$10.00',
      imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=200',
    ),
    PopularItem(
      name: 'Chicken Wings',
      price: '\$14.00',
      imageUrl: 'https://images.unsplash.com/photo-1608039755401-742074717957?w=200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              _buildRevenueCard(),
              const SizedBox(height: 16),
              _buildOrderRequests(),
              const SizedBox(height: 24),
              _buildSectionTitle('Running Orders', onSeeAll: () {}),
              const SizedBox(height: 12),
              _buildRunningOrders(),
              const SizedBox(height: 24),
              _buildSectionTitle('Popular Items This Week', onSeeAll: () {}),
              const SizedBox(height: 12),
              _buildPopularItems(),
              const SizedBox(height: 24),
              _buildReviewsSummary(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DELIVER TO',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentLight,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    'Halal Lab office',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: AppColors.textDark,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_outlined,
              color: AppColors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Revenue',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See Details',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '\$2,241',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildMiniBar(40, AppColors.primary),
              const SizedBox(width: 6),
              _buildMiniBar(60, AppColors.accent),
              const SizedBox(width: 6),
              _buildMiniBar(30, const Color(0xFF98A8B8)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStatItem(Icons.shopping_bag_outlined, 'Orders', '128'),
              const SizedBox(width: 40),
              _buildStatItem(Icons.monetization_on_outlined, 'Earnings', '\$450'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniBar(double height, Color color) {
    return Container(
      width: 40,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: AppColors.accent),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderRequests() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'Order Requests',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF31343D),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '05',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'See All',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: const Color(0xFF333333),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {VoidCallback? onSeeAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF31343D),
            ),
          ),
          if (onSeeAll != null)
            GestureDetector(
              onTap: onSeeAll,
              child: Row(
                children: [
                  Text(
                    'See All',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: const Color(0xFF333333),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRunningOrders() {
    return Column(
      children: _runningOrders.map((order) {
        return _RunningOrderCard(order: order);
      }).toList(),
    );
  }

  Widget _buildPopularItems() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _popularItems.length,
        itemBuilder: (context, index) {
          return _PopularItemCard(item: _popularItems[index]);
        },
      ),
    );
  }

  Widget _buildReviewsSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Color(0xFFFFBD69), size: 24),
                  SizedBox(height: 2),
                  Icon(Icons.star, color: Color(0xFFFFBD69), size: 24),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '4.9',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.star, color: const Color(0xFFFFBD69), size: 24),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Total 20 Reviews',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RunningOrderCard extends StatelessWidget {
  final RunningOrder order;

  const _RunningOrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFC4C4C4),
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              order.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: const Color(0xFFC4C4C4));
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.name,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  order.items,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  order.price,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: order.statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              order.status,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: order.statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopularItemCard extends StatelessWidget {
  final PopularItem item;

  const _PopularItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xFFC4C4C4),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: const Color(0xFFC4C4C4));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item.price,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RunningOrder {
  final String name;
  final String items;
  final String price;
  final String status;
  final Color statusColor;
  final String imageUrl;

  RunningOrder({
    required this.name,
    required this.items,
    required this.price,
    required this.status,
    required this.statusColor,
    required this.imageUrl,
  });
}

class PopularItem {
  final String name;
  final String price;
  final String imageUrl;

  PopularItem({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
