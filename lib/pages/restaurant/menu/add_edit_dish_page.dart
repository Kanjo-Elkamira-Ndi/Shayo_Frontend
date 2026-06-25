import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';

class AddEditDishPage extends StatefulWidget {
  const AddEditDishPage({super.key});

  @override
  State<AddEditDishPage> createState() => _AddEditDishPageState();
}

class _AddEditDishPageState extends State<AddEditDishPage> {
  final _itemNameController = TextEditingController(text: 'Mazalichiken Halim');
  final _priceController = TextEditingController(text: '25');
  final _discountPriceController = TextEditingController();
  final _detailsController = TextEditingController();

  final List<String> _fruitIngredients = ['Apple', 'Banana', 'Orange', 'Grapes'];
  final List<String> _basicIngredients = ['Salt', 'Sugar', 'Oil', 'Rice', 'Flour'];
  final List<String> _selectedIngredients = ['Salt', 'Sugar'];

  @override
  void dispose() {
    _itemNameController.dispose();
    _priceController.dispose();
    _discountPriceController.dispose();
    _detailsController.dispose();
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionLabel('item name'),
                    const SizedBox(height: 8),
                    _buildTextField(controller: _itemNameController, hint: 'Enter item name'),
                    const SizedBox(height: 24),
                    _buildSectionLabel('Price'),
                    const SizedBox(height: 8),
                    _buildPriceRow(),
                    const SizedBox(height: 24),
                    _buildSectionLabel('Upload photo/video'),
                    const SizedBox(height: 8),
                    _buildUploadArea(),
                    const SizedBox(height: 24),
                    _buildSectionLabel('Ingridents'),
                    const SizedBox(height: 12),
                    _buildIngredientSection('Fruit', _fruitIngredients),
                    const SizedBox(height: 16),
                    _buildIngredientSection('Basic', _basicIngredients),
                    const SizedBox(height: 24),
                    _buildSectionLabel('Details'),
                    const SizedBox(height: 8),
                    _buildDetailsField(),
                    const SizedBox(height: 32),
                    _buildAddButton(),
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
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: AppColors.grey100,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Color(0xFF181C2E)),
            ),
          ),
          const Spacer(),
          Text(
            'Add New Items',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              _itemNameController.clear();
              _priceController.clear();
              _discountPriceController.clear();
              _detailsController.clear();
            },
            child: Text(
              'Reset',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1A1A1A),
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String hint, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF5F5F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  Widget _buildPriceRow() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Price',
              hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
              prefixText: '\$ ',
              prefixStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF181C2E),
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: _discountPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Discount',
              hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
              prefixText: '\$ ',
              prefixStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF181C2E),
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadArea() {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_upload_outlined, size: 36, color: AppColors.grey400),
          const SizedBox(height: 8),
          Text(
            'Upload photo/video',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF9E9E9E),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Browse',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF181C2E),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items.map((item) {
            final isSelected = _selectedIngredients.contains(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedIngredients.remove(item);
                  } else {
                    _selectedIngredients.add(item);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.accent : const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.white : const Color(0xFF32343E),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDetailsField() {
    return TextFormField(
      controller: _detailsController,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Enter item details...',
        hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF5F5F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Item added successfully!'), duration: Duration(seconds: 1)),
          );
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: const Text(
          'ADD ITEM',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),
    );
  }
}
