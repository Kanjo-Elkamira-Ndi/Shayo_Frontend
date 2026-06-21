import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'menu_item_detail_page.dart';
import '../cart/cart_page.dart';

class MenuItemData {
  final String name;
  final String description;
  final int price;
  final String imageUrl;

  const MenuItemData({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({super.key});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  int selectedTab = 0;

  final List<String> tabs = ['Recommended', 'Burgers', 'Pizza', 'Drinks'];

  final List<MenuItemData> menuItems = [
    MenuItemData(
      name: 'Classic Cheeseburger',
      description: 'Beef patty with cheddar, lettuce, tomato',
      price: 2500,
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
    ),
    MenuItemData(
      name: 'BBQ Bacon Burger',
      description: 'Smoked bacon, BBQ sauce, onion rings',
      price: 3200,
      imageUrl: 'https://images.unsplash.com/photo-1553979459-d2229ba7433b',
    ),
    MenuItemData(
      name: 'Margherita Pizza',
      description: 'Fresh mozzarella, basil, tomato sauce',
      price: 3500,
      imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002',
    ),
    MenuItemData(
      name: 'Pepperoni Pizza',
      description: 'Double pepperoni, extra cheese',
      price: 4200,
      imageUrl: 'https://images.unsplash.com/photo-1628840042765-356cda07504e',
    ),
    MenuItemData(
      name: 'Fresh Lemonade',
      description: 'House-made lemonade with mint',
      price: 1200,
      imageUrl: 'https://images.unsplash.com/photo-1621263764928-df1444c5e859',
    ),
    MenuItemData(
      name: 'Chocolate Milkshake',
      description: 'Thick chocolate shake with whipped cream',
      price: 1800,
      imageUrl: 'https://images.unsplash.com/photo-1572490122747-3968b75cc699',
    ),
    MenuItemData(
      name: 'Spicy Chicken Burger',
      description: 'Crispy chicken, jalapeños, spicy mayo',
      price: 2800,
      imageUrl: 'https://images.unsplash.com/photo-1566753323558-f4e0952af115',
    ),
    MenuItemData(
      name: 'Hawaiian Pizza',
      description: 'Ham, pineapple, mozzarella cheese',
      price: 3800,
      imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            backgroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://cdn.pixabay.com/photo/2016/11/18/14/39/beans-1834984_640.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppColors.grey300,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xCC1A1D2E),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48,
                    left: 16,
                    right: 16,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 42,
                            height: 42,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                              color: Color(0xFF181C2E),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const CartPage()),
                            );
                          },
                          child: Container(
                            width: 42,
                            height: 42,
                            decoration: const BoxDecoration(
                              color: AppColors.surface,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 20,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                      child: Text(
                        'Rose Garden Restaurant',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF181C2E),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          _buildCategoryChip('Burger'),
                          const SizedBox(width: 8),
                          _buildCategoryChip('Chiken'),
                          const SizedBox(width: 8),
                          _buildCategoryChip('Italian'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFFFBD69), size: 18),
                          const SizedBox(width: 4),
                          Text(
                            '4.7',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF181C2E),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(200+ ratings)',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFF646982),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.delivery_dining,
                              color: AppColors.primary, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            'Free delivery',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFF646982),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '•',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFF646982),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.access_time,
                              color: Color(0xFF646982), size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '20-30 min',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFF646982),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              color: Color(0xFF646982), size: 18),
                          const SizedBox(width: 6),
                          Text(
                            '123 Main Street, City',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFF646982),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFF0F0F0)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        'Menu',
                        style: AppTextStyles.titleLarge.copyWith(
                          color: const Color(0xFF31343D),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 36,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: tabs.length,
                        itemBuilder: (context, index) {
                          final isSelected = selectedTab == index;
                          return GestureDetector(
                            onTap: () => setState(() => selectedTab = index),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                tabs[index],
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight:
                                      isSelected ? FontWeight.w600 : FontWeight.w400,
                                  color: isSelected
                                      ? AppColors.white
                                      : const Color(0xFF646982),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...menuItems.map((item) => _MenuItemCard(
                          item: item,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    MenuItemDetailPage(itemData: item),
                              ),
                            );
                          },
                        )),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: const Color(0xFF646982),
        ),
      ),
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  final MenuItemData item;
  final VoidCallback onTap;

  const _MenuItemCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 80,
                  height: 80,
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
                    item.name,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF181C2E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFF646982),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${item.price} FCFA',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} added to cart'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
