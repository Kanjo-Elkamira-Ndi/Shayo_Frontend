import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ReviewListPage extends StatefulWidget {
  const ReviewListPage({super.key});

  @override
  State<ReviewListPage> createState() => _ReviewListPageState();
}

class _ReviewListPageState extends State<ReviewListPage> {
  final List<Review> _reviews = [
    Review(
      name: 'Pabel Vuiya',
      title: 'Great Food and Service',
      text: 'This Food so tasty & delicious. I love the food quality and service was excellent.',
      rating: 5,
      date: '20/12/2020',
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    ),
    Review(
      name: 'Salim Smith',
      title: 'Awesome and Nice',
      text: 'Amazing experience! The restaurant exceeded my expectations.',
      rating: 5,
      date: '18/12/2020',
      avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
    ),
    Review(
      name: 'Royal Bengol',
      title: 'Delicious Food',
      text: 'The food was incredibly fresh and well prepared. Highly recommended!',
      rating: 5,
      date: '15/12/2020',
      avatarUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150',
    ),
    Review(
      name: 'Jessica Williams',
      title: 'Good Quality',
      text: 'Consistently good food and timely delivery. One of my favorite places.',
      rating: 4,
      date: '12/12/2020',
      avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
    ),
    Review(
      name: 'David Chen',
      title: 'Excellent Service',
      text: 'Fast delivery and the food was still hot when it arrived. Great service!',
      rating: 5,
      date: '10/12/2020',
      avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSummaryCard(),
                    _buildReviewList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: AppColors.grey200,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.surface,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Reviews',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF31343D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: const EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            '4.9',
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF181C2E),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Icon(Icons.star, color: Color(0xFFFFBD69), size: 22),
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            'Total 20 Reviews',
            style: AppTextStyles.bodyMedium.copyWith(
              color: const Color(0xFF676767),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      itemCount: _reviews.length,
      itemBuilder: (context, index) {
        return _ReviewCard(review: _reviews[index]);
      },
    );
  }
}

class Review {
  final String name;
  final String title;
  final String text;
  final int rating;
  final String date;
  final String avatarUrl;

  Review({
    required this.name,
    required this.title,
    required this.text,
    required this.rating,
    required this.date,
    required this.avatarUrl,
  });
}

class _ReviewCard extends StatelessWidget {
  final Review review;

  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey300,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  review.avatarUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: AppColors.grey300);
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF181C2E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: Icon(
                            index < review.rating ? Icons.star : Icons.star_border,
                            color: const Color(0xFFFFBD69),
                            size: 16,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Text(
                review.date,
                style: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF999999),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review.title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            review.text,
            style: AppTextStyles.bodyMedium.copyWith(
              color: const Color(0xFF676767),
            ),
          ),
        ],
      ),
    );
  }
}
