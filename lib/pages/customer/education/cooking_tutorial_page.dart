import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class CookingTutorialPage extends StatefulWidget {
  final String title;
  const CookingTutorialPage({super.key, this.title = 'Pasta Tutorial'});

  @override
  State<CookingTutorialPage> createState() => _CookingTutorialPageState();
}

class _CookingTutorialPageState extends State<CookingTutorialPage> {
  final Set<int> _completedSteps = {};

  final List<_TutorialStep> _steps = [
    _TutorialStep(
      number: 1,
      title: 'Prepare Ingredients',
      description: 'Wash and chop all vegetables. Measure out the spices and keep everything within reach before you start cooking.',
    ),
    _TutorialStep(
      number: 2,
      title: 'Heat the Pan',
      description: 'Place a large non-stick pan over medium-high heat and add two tablespoons of olive oil. Wait until the oil shimmers.',
      image: 'https://images.unsplash.com/photo-1590794056226-79ef3a8147e1?w=400',
    ),
    _TutorialStep(
      number: 3,
      title: 'Sauté Aromatics',
      description: 'Add minced garlic and diced onion to the hot oil. Stir frequently until golden brown and fragrant, about 2-3 minutes.',
      image: 'https://images.unsplash.com/photo-1556761223-4c4282c73f77?w=400',
    ),
    _TutorialStep(
      number: 4,
      title: 'Cook Main Ingredients',
      description: 'Add your main ingredients to the pan. Season with salt, pepper, and herbs. Cook until the meat is browned and vegetables are tender.',
      image: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400',
    ),
    _TutorialStep(
      number: 5,
      title: 'Finish and Serve',
      description: 'Taste and adjust seasoning. Garnish with fresh herbs, drizzle with olive oil, and serve immediately while hot.',
    ),
  ];

  final List<String> _ingredients = [
    'Olive Oil',
    'Garlic',
    'Onions',
    'Fresh Herbs',
    'Salt',
    'Black Pepper',
    'Tomatoes',
    'Pasta',
    'Parmesan',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildVideoPlaceholder(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                      child: Text('Steps',
                          style: AppTextStyles.titleLarge
                              .copyWith(color: const Color(0xFF31343D))),
                    ),
                    const SizedBox(height: 16),
                    ..._steps.map(_buildStepCard),
                    _buildIngredientsSection(),
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
          const SizedBox(width: 16),
          Text(
            widget.title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlaceholder() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D2E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              size: 38,
              color: Color(0xFF1A1D2E),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(_TutorialStep step) {
    final isCompleted = _completedSteps.contains(step.number);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isCompleted) {
            _completedSteps.remove(step.number);
          } else {
            _completedSteps.add(step.number);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isCompleted ? const Color(0xFFF0FFF4) : const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(12),
          border: isCompleted ? Border.all(color: AppColors.success, width: 1.5) : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isCompleted ? AppColors.success : AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, color: AppColors.white, size: 18)
                    : Text(
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
                  if (step.image != null) ...[
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        step.image!,
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 100,
                          color: const Color(0xFFC4C4C4),
                        ),
                      ),
                    ),
                  ],
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
      ),
    );
  }

  Widget _buildIngredientsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ingredients',
              style: AppTextStyles.titleLarge.copyWith(color: const Color(0xFF31343D))),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _ingredients.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item,
                  style: GoogleFonts.inter(
                    fontSize: 13,
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
}

class _TutorialStep {
  final int number;
  final String title;
  final String description;
  final String? image;

  const _TutorialStep({
    required this.number,
    required this.title,
    required this.description,
    this.image,
  });
}
