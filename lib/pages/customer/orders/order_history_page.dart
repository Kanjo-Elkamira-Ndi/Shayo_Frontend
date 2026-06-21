import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'order_tracking_page.dart';
import '../reviews/write_review_page.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<_OrderData> _orders = [
    _OrderData(
      restaurantName: 'Rose Garden Restaurant',
      imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=200',
      items: '2 items: Cheeseburger, Fries',
      price: 4500,
      status: OrderStatus.ongoing,
    ),
    _OrderData(
      restaurantName: 'La Terrasse',
      imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=200',
      items: '3 items: Pizza, Pasta, Salad',
      price: 8500,
      status: OrderStatus.ongoing,
    ),
    _OrderData(
      restaurantName: 'Ocean Breeze',
      imageUrl: 'https://images.unsplash.com/photo-1550966871-3ed3cdb51f3a?w=200',
      items: '1 item: Grilled Salmon',
      price: 6500,
      status: OrderStatus.completed,
    ),
    _OrderData(
      restaurantName: 'Spice Kitchen',
      imageUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=200',
      items: '4 items: Biryani, Naan, Curry, Raita',
      price: 7200,
      status: OrderStatus.completed,
    ),
    _OrderData(
      restaurantName: 'Tokyo Ramen',
      imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=200',
      items: '2 items: Ramen, Gyoza',
      price: 3800,
      status: OrderStatus.cancelled,
    ),
    _OrderData(
      restaurantName: 'Pizza Roma',
      imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=200',
      items: '1 item: Margherita Pizza',
      price: 3500,
      status: OrderStatus.cancelled,
    ),
  ];

  List<_OrderData> get _filteredOrders {
    switch (_tabController.index) {
      case 0:
        return _orders.where((o) => o.status == OrderStatus.ongoing).toList();
      case 1:
        return _orders.where((o) => o.status == OrderStatus.completed).toList();
      case 2:
        return _orders.where((o) => o.status == OrderStatus.cancelled).toList();
      default:
        return _orders;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildOrderList(),
                  _buildOrderList(),
                  _buildOrderList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          Text(
            'My Orders',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppColors.white,
          unselectedLabelColor: const Color(0xFF646982),
          labelStyle: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(text: 'Ongoing'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList() {
    final orders = _filteredOrders;
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long_outlined, size: 64, color: AppColors.grey400),
            const SizedBox(height: 16),
            Text(
              'No orders found',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: AppColors.grey500,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      itemCount: orders.length,
      itemBuilder: (context, index) => _OrderCard(
        order: orders[index],
        onTrack: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const OrderTrackingPage(),
            ),
          );
        },
        onReorder: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Order placed again!')),
          );
        },
        onRate: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const WriteReviewPage()),
          );
        },
      ),
    );
  }
}

enum OrderStatus { ongoing, completed, cancelled }

class _OrderData {
  final String restaurantName;
  final String imageUrl;
  final String items;
  final int price;
  final OrderStatus status;

  const _OrderData({
    required this.restaurantName,
    required this.imageUrl,
    required this.items,
    required this.price,
    required this.status,
  });
}

class _OrderCard extends StatelessWidget {
  final _OrderData order;
  final VoidCallback onTrack;
  final VoidCallback onReorder;
  final VoidCallback onRate;

  const _OrderCard({
    required this.order,
    required this.onTrack,
    required this.onReorder,
    required this.onRate,
  });

  Color _statusColor() {
    switch (order.status) {
      case OrderStatus.ongoing:
        return AppColors.warning;
      case OrderStatus.completed:
        return AppColors.success;
      case OrderStatus.cancelled:
        return AppColors.error;
    }
  }

  String _statusLabel() {
    switch (order.status) {
      case OrderStatus.ongoing:
        return 'Ongoing';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  order.imageUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 70,
                    height: 70,
                    color: AppColors.grey300,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.restaurantName,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: const Color(0xFF181C2E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order.items,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: const Color(0xFF646982),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${order.price} FCFA',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _statusColor().withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _statusLabel(),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _statusColor(),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: Color(0xFFF0F0F0)),
          Row(
            children: [
              if (order.status == OrderStatus.ongoing)
                _ActionButton(
                  label: 'Track order',
                  icon: Icons.navigation,
                  onTap: onTrack,
                ),
              if (order.status == OrderStatus.completed)
                _ActionButton(
                  label: 'Order again',
                  icon: Icons.refresh,
                  onTap: onReorder,
                ),
              if (order.status == OrderStatus.completed)
                const SizedBox(width: 8),
              if (order.status == OrderStatus.completed)
                _ActionButton(
                  label: 'Rate',
                  icon: Icons.star_outline,
                  onTap: onRate,
                ),
              if (order.status == OrderStatus.cancelled)
                _ActionButton(
                  label: 'Order again',
                  icon: Icons.refresh,
                  onTap: onReorder,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
