import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import 'food_detail_page.dart';

class MenuManagementPage extends StatefulWidget {
  const MenuManagementPage({super.key});

  @override
  State<MenuManagementPage> createState() => _MenuManagementPageState();
}

class _MenuManagementPageState extends State<MenuManagementPage> {
  int _selectedCategory = 0;

  final List<String> _categories = ['All', 'Breakfast', 'Lunch', 'Dinner'];

  final List<_FoodItem> _items = [
    _FoodItem(
      name: 'Chicken Thai Biriyani',
      price: 60,
      category: 'Lunch',
      imageUrl: 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=200',
    ),
    _FoodItem(
      name: 'Chicken Bhuna',
      price: 30,
      category: 'Dinner',
      imageUrl: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=200',
    ),
    _FoodItem(
      name: 'Mazalichiken Halim',
      price: 25,
      category: 'Breakfast',
      imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=200',
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
            _buildCategoryTabs(),
            _buildItemCount(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return _FoodItemCard(
                    item: _items[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FoodDetailPage()),
                      );
                    },
                    onMoreTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('More options coming soon'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
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
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: AppColors.grey100,
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
          Text(
            'My Food List',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
          const Spacer(),
          const SizedBox(width: 42),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final isSelected = _selectedCategory == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedCategory = index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _categories[index],
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? AppColors.white : const Color(0xFF646982),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemCount() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Total 0${_items.length} items',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: const Color(0xFF646982),
          ),
        ),
      ),
    );
  }
}

class _FoodItem {
  final String name;
  final int price;
  final String category;
  final String imageUrl;

  const _FoodItem({
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
  });
}

class _FoodItemCard extends StatelessWidget {
  final _FoodItem item;
  final VoidCallback onTap;
  final VoidCallback onMoreTap;

  const _FoodItemCard({
    required this.item,
    required this.onTap,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF0F0F0)),
        ),
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
                  color: const Color(0xFFC4C4C4),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFB6D3A),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Pick UP',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
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
                    '\$${item.price}',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onMoreTap,
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.more_vert,
                  color: Color(0xFF181C2E),
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
