import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../cart/cart_page.dart';
import '../orders/order_history_page.dart';
import '../restaurant_detail/restaurant_detail_page.dart';
import '../search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 0;

  final List<FoodCategory> _categories = [
    FoodCategory(name: 'All', chipBg: const Color(0xFF98A8B8)),
    FoodCategory(name: 'Hot Dog', chipBg: const Color(0xFF98A8B8)),
    FoodCategory(name: 'Burger', chipBg: const Color(0xFF98A8B8)),
    FoodCategory(name: 'Pizza', chipBg: const Color(0xFFF6F6F6)),
    FoodCategory(name: 'Sushi', chipBg: const Color(0xFF98A8B8)),
    FoodCategory(name: 'Pasta', chipBg: const Color(0xFF98A8B8)),
  ];

  final List<Restaurant> _restaurants = [
    Restaurant(
      name: 'Rose Garden Restaurant',
      categories: ['Burger', 'Chiken', 'Riche', 'Wings'],
      rating: 4.7,
      deliveryType: 'Free',
      deliveryTime: '20 min',
      imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400',
    ),
    Restaurant(
      name: 'La Terrasse',
      categories: ['Pizza', 'Pasta', 'Italian', 'Wine'],
      rating: 4.5,
      deliveryType: 'Free',
      deliveryTime: '25 min',
      imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=400',
    ),
    Restaurant(
      name: 'Ocean Breeze',
      categories: ['Seafood', 'Fish', 'Grilled', 'Fresh'],
      rating: 4.8,
      deliveryType: 'Free',
      deliveryTime: '30 min',
      imageUrl: 'https://images.unsplash.com/photo-1550966871-3ed3cdb51f3a?w=400',
    ),
    Restaurant(
      name: 'Spice Kitchen',
      categories: ['Indian', 'Curry', 'Biryani', 'Naan'],
      rating: 4.6,
      deliveryType: 'Free',
      deliveryTime: '22 min',
      imageUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGreeting(),
                    _buildSearchBar(),
                    _buildAllCategories(),
                    _buildOpenRestaurants(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderHistoryPage()),
              );
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: AppColors.grey200,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.menu_rounded,
                color: AppColors.surface,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Location selection coming soon')),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DELIVER TO',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFC6E2A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        'Halal Lab office',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: const Color(0xFF676767),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                        color: const Color(0xFF181C2E),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                const Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Text(
        'Hey Halal, Good Afternoon!',
        style: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1E1D1D),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SearchPage()),
          );
        },
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.grey100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Icon(Icons.search, color: AppColors.grey500, size: 22),
              const SizedBox(width: 12),
              Text(
                'Search dishes, restaurants',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: const Color(0xFF676767),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllCategories() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Categories',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF31343D),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SearchPage()),
                    );
                  },
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
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 68,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return _CategoryChip(
                  name: _categories[index].name,
                  iconBg: _categories[index].chipBg,
                  isSelected: _selectedCategory == index,
                  onTap: () {
                    setState(() {
                      _selectedCategory = index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpenRestaurants() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Open Restaurants',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF31343D),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SearchPage()),
                    );
                  },
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
          ),
          const SizedBox(height: 14),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _restaurants.length,
            itemBuilder: (context, index) {
              return _RestaurantCard(
                restaurant: _restaurants[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RestaurantDetailPage()),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String name;
  final Color iconBg;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.name,
    required this.iconBg,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFD27C) : AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.restaurant, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF32343E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback? onTap;

  const _RestaurantCard({required this.restaurant, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: const Color(0xFFC4C4C4),
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              restaurant.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: const Color(0xFFC4C4C4));
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            restaurant.name,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            restaurant.categories.join(' - '),
            style: AppTextStyles.bodyMedium.copyWith(
              color: const Color(0xFFA0A5BA),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFFFFBD69), size: 20),
              const SizedBox(width: 4),
              Text(
                restaurant.rating.toString(),
                style: AppTextStyles.labelLarge.copyWith(
                  color: const Color(0xFF181C2E),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.delivery_dining, color: AppColors.primary, size: 20),
              const SizedBox(width: 4),
              Text(
                restaurant.deliveryType,
                style: AppTextStyles.labelLarge.copyWith(
                  color: const Color(0xFF181C2E),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.access_time, color: AppColors.primary, size: 20),
              const SizedBox(width: 4),
              Text(
                restaurant.deliveryTime,
                style: AppTextStyles.labelLarge.copyWith(
                  color: const Color(0xFF181C2E),
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

class FoodCategory {
  final String name;
  final Color chipBg;

  FoodCategory({required this.name, required this.chipBg});
}

class Restaurant {
  final String name;
  final List<String> categories;
  final double rating;
  final String deliveryType;
  final String deliveryTime;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.categories,
    required this.rating,
    required this.deliveryType,
    required this.deliveryTime,
    required this.imageUrl,
  });
}
