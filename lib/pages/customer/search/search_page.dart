import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentKeywords = [
    'Burger',
    'Sandwich',
    'Pizza',
    'Sanwich',
    'Pasta',
    'Sushi',
  ];

  final List<Map<String, dynamic>> _suggestedRestaurants = [
    {
      'name': 'Pansi Restaurant',
      'rating': '4.7',
      'image': 'https://cdn.pixabay.com/photo/2017/08/03/21/48/drinks-2578446_640.jpg',
    },
    {
      'name': 'American Spicy Burger Shop',
      'rating': '4.3',
      'image': 'https://cdn.pixabay.com/photo/2016/11/23/18/31/breakfast-1854549_640.jpg',
    },
    {
      'name': 'Cafenio Coffee Club',
      'rating': '4.0',
      'image': 'https://cdn.pixabay.com/photo/2019/11/28/18/15/jollof-4659747_640.jpg',
    },
  ];

  final List<Map<String, dynamic>> _popularFoods = [
    {
      'name': 'European Pizza',
      'restaurant': 'Uttora Coffe House',
      'image': 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_640.jpg',
    },
    {
      'name': 'Buffalo Pizza',
      'restaurant': 'Cafenio Coffee Club',
      'image': 'https://cdn.pixabay.com/photo/2020/10/05/19/55/hamburger-5630646_640.jpg',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildRecentKeywords(),
              _buildSuggestedRestaurants(),
              _buildPopularFastFood(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(45),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Color(0xFF181C2E)),
              padding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'Search',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
          const Spacer(),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined,
                      color: Colors.white),
                  padding: EdgeInsets.zero,
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Pizza',
            hintStyle: const TextStyle(color: Color(0xFF676767)),
            prefixIcon: const Icon(Icons.search, color: AppColors.grey500),
            suffixIcon: _searchController.text.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _searchController.clear();
                      });
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color(0xFFCCCDCF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close,
                          size: 14, color: Colors.white),
                    ),
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onChanged: (_) => setState(() {}),
        ),
      ),
    );
  }

  Widget _buildRecentKeywords() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Keywords',
            style: AppTextStyles.titleLarge.copyWith(color: const Color(0xFF31343D)),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _recentKeywords.map((keyword) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7621).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  keyword,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF181C2E),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedRestaurants() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggested Restaurants',
            style: AppTextStyles.titleLarge.copyWith(color: const Color(0xFF31343D)),
          ),
          const SizedBox(height: 12),
          ..._suggestedRestaurants.map((r) => _SuggestedRestaurantTile(
                name: r['name'] as String,
                rating: r['rating'] as String,
                image: r['image'] as String,
              )),
        ],
      ),
    );
  }

  Widget _buildPopularFastFood() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Fast food',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 190,
            child: Row(
              children: _popularFoods.map((f) {
                return Expanded(
                  child: _PopularFoodCard(
                    name: f['name'] as String,
                    restaurant: f['restaurant'] as String,
                    image: f['image'] as String,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestedRestaurantTile extends StatelessWidget {
  final String name;
  final String rating;
  final String image;

  const _SuggestedRestaurantTile({
    required this.name,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 60,
                height: 50,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFFFBE6D),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF31343D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 15, color: Color(0xFFFFBD69)),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF181C2E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Divider(height: 1, color: AppColors.grey200),
        ),
      ],
    );
  }
}

class _PopularFoodCard extends StatelessWidget {
  final String name;
  final String restaurant;
  final String image;

  const _PopularFoodCard({
    required this.name,
    required this.restaurant,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 153,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: SizedBox(
                width: 153,
                height: 84,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFFFBE6D),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
              child: Text(
                name,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF31343D),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Text(
                restaurant,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: const Color(0xFF646982),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
