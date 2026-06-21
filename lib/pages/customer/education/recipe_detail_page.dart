import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final List<String> _ingredients = [
    '2 cups all-purpose flour',
    '3 large eggs',
    '1 tbsp olive oil',
    '1 tsp salt',
    '2 cups tomato sauce',
    'Fresh basil leaves',
    'Parmesan cheese',
  ];

  final List<_InstructionStep> _steps = [
    _InstructionStep(
      number: 1,
      title: 'Make the Dough',
      description: 'On a clean surface, mound the flour and create a well in the center. Crack the eggs into the well and add olive oil and salt. Gradually incorporate the flour into the eggs using a fork.',
      image: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400',
    ),
    _InstructionStep(
      number: 2,
      title: 'Knead the Dough',
      description: 'Knead the dough for about 8-10 minutes until smooth and elastic. Wrap in plastic and let rest for 30 minutes at room temperature.',
      image: 'https://images.unsplash.com/photo-1556761223-4c4282c73f77?w=400',
    ),
    _InstructionStep(
      number: 3,
      title: 'Roll and Cut',
      description: 'Divide the dough into portions and roll out thinly on a floured surface. Cut into your desired pasta shape using a knife or pasta cutter.',
      image: 'https://images.unsplash.com/photo-1590794056226-79ef3a8147e1?w=400',
    ),
    _InstructionStep(
      number: 4,
      title: 'Cook and Serve',
      description: 'Boil the pasta in salted water for 2-3 minutes until al dente. Drain and toss with warm tomato sauce. Garnish with fresh basil and Parmesan.',
      image: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400',
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
                    _buildHeroImage(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How to Make the Perfect Pasta',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF181C2E),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.person_outline, size: 16, color: Color(0xFF646982)),
                              const SizedBox(width: 4),
                              Text('By Chef John',
                                  style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF646982))),
                              const SizedBox(width: 12),
                              const Icon(Icons.access_time, size: 16, color: Color(0xFF646982)),
                              const SizedBox(width: 4),
                              Text('20 min',
                                  style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF646982))),
                              const SizedBox(width: 12),
                              const Icon(Icons.auto_awesome, size: 16, color: Color(0xFF646982)),
                              const SizedBox(width: 4),
                              Text('Medium',
                                  style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF646982))),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text('Ingredients',
                              style: AppTextStyles.titleLarge.copyWith(color: const Color(0xFF181C2E))),
                          const SizedBox(height: 12),
                          ..._ingredients.map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('\u2022  ',
                                        style: TextStyle(color: AppColors.primary, fontSize: 16)),
                                    Expanded(
                                      child: Text(item,
                                          style: AppTextStyles.bodyMedium
                                              .copyWith(color: const Color(0xFF181C2E))),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 24),
                          Text('Instructions',
                              style: AppTextStyles.titleLarge.copyWith(color: const Color(0xFF181C2E))),
                          const SizedBox(height: 16),
                          ..._steps.map(_buildStep),
                        ],
                      ),
                    ),
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
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(42),
              ),
              child: const Icon(Icons.arrow_back, color: Color(0xFF181C2E)),
            ),
          ),
          const Spacer(),
          Text(
            'Recipe',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(42),
              ),
              child: const Icon(Icons.bookmark_border, color: Color(0xFF181C2E)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Image.network(
      'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=600',
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        height: 250,
        color: const Color(0xFFC4C4C4),
      ),
    );
  }

  Widget _buildStep(_InstructionStep step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${step.number}',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
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
                  step.title,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF181C2E),
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    step.image,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 120,
                      color: const Color(0xFFC4C4C4),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  step.description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: const Color(0xFF646982),
                    height: 1.5,
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

class _InstructionStep {
  final int number;
  final String title;
  final String description;
  final String image;

  const _InstructionStep({
    required this.number,
    required this.title,
    required this.description,
    required this.image,
  });
}
