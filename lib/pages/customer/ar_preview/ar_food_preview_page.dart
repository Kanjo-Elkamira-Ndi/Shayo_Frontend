import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ArFoodPreviewPage extends StatefulWidget {
  const ArFoodPreviewPage({super.key});

  @override
  State<ArFoodPreviewPage> createState() => _ArFoodPreviewPageState();
}

class _ArFoodPreviewPageState extends State<ArFoodPreviewPage> {
  int _selectedFood = 0;
  double _sizeValue = 0.5;

  final List<Map<String, dynamic>> _foodItems = [
    {'name': 'Burger', 'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200'},
    {'name': 'Pizza', 'image': 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=200'},
    {'name': 'Sushi', 'image': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=200'},
    {'name': 'Pasta', 'image': 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=200'},
    {'name': 'Salad', 'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=200'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'AR Preview',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCameraPreview(),
          ),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.grey600.withValues(alpha: 0.3), width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Image.network(
                _foodItems[_selectedFood]['image'] as String,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.surfaceLight,
                    child: Icon(
                      Icons.restaurant,
                      color: AppColors.grey500,
                      size: 48,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Point your camera at a surface',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: const BoxDecoration(
        color: Color(0xFF16213E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _foodItems.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedFood == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedFood = index),
                  child: Container(
                    width: 52,
                    height: 52,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppColors.surfaceLight,
                      child: ClipOval(
                        child: Image.network(
                          _foodItems[index]['image'] as String,
                          fit: BoxFit.cover,
                          width: 48,
                          height: 48,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.restaurant, color: AppColors.grey500, size: 20);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'Place on surface',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.photo_size_select_small, color: AppColors.grey400, size: 18),
              Expanded(
                child: Slider(
                  value: _sizeValue,
                  min: 0.2,
                  max: 1.0,
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.grey600.withValues(alpha: 0.3),
                  onChanged: (value) => setState(() => _sizeValue = value),
                ),
              ),
              Icon(Icons.photo_size_select_large, color: AppColors.grey400, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
