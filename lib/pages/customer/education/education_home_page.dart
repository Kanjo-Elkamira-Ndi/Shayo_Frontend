import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class EducationHomePage extends StatefulWidget {
  const EducationHomePage({super.key});

  @override
  State<EducationHomePage> createState() => _EducationHomePageState();
}

class _EducationHomePageState extends State<EducationHomePage> {
  int _selectedCategory = 0;

  final List<String> _categories = [
    'All', 'Baking', 'Grilling', 'Italian', 'Asian', 'Desserts'
  ];

  final List<_Article> _articles = [
    _Article(
      title: 'How to Knead Dough Perfectly',
      duration: '12 min read',
      image: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400',
    ),
    _Article(
      title: '5 Secrets for Juicy Grilled Chicken',
      duration: '10 min read',
      image: 'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=400',
    ),
    _Article(
      title: 'Homemade Pasta from Scratch',
      duration: '25 min read',
      image: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400',
    ),
    _Article(
      title: 'The Art of Sushi Rolling',
      duration: '18 min read',
      image: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400',
    ),
    _Article(
      title: 'Perfect Tiramisu at Home',
      duration: '15 min read',
      image: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400',
    ),
    _Article(
      title: 'Thai Green Curry Basics',
      duration: '20 min read',
      image: 'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildCategories(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFeatured(),
                    _buildRecentArticles(),
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
      child: Text(
        'Cooking Tips',
        style: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF181C2E),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 40,
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

  Widget _buildFeatured() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1551462147-ff29053bfc14?w=600',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: const Color(0xFFC4C4C4)),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xCC1A1D2E)],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to Make the Perfect Pasta',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'By Chef Marco \u2022 15 min read',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentArticles() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Articles',
            style: AppTextStyles.titleLarge.copyWith(color: const Color(0xFF31343D)),
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _articles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.78,
            ),
            itemBuilder: (context, index) {
              return _ArticleCard(article: _articles[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _Article {
  final String title;
  final String duration;
  final String image;

  const _Article({required this.title, required this.duration, required this.image});
}

class _ArticleCard extends StatelessWidget {
  final _Article article;

  const _ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            article.image,
            width: double.infinity,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 100,
              color: const Color(0xFFC4C4C4),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          article.title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF181C2E),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          article.duration,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: const Color(0xFF646982),
          ),
        ),
      ],
    );
  }
}
