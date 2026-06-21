import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'restaurant_detail_page.dart';
import '../cart/cart_page.dart';

class _AddOn {
  final String name;
  final int price;

  const _AddOn({required this.name, required this.price});
}

class MenuItemDetailPage extends StatefulWidget {
  final MenuItemData itemData;

  const MenuItemDetailPage({super.key, required this.itemData});

  @override
  State<MenuItemDetailPage> createState() => _MenuItemDetailPageState();
}

class _MenuItemDetailPageState extends State<MenuItemDetailPage> {
  int quantity = 1;
  int selectedSize = 0;

  final List<String> sizes = ['Regular', 'Large', 'Extra Large'];

  final List<_AddOn> addOns = const [
    _AddOn(name: 'Extra Cheese', price: 200),
    _AddOn(name: 'Extra Sauce', price: 150),
    _AddOn(name: 'Vegetables', price: 300),
  ];

  final Set<int> selectedAddOns = {};

  int get totalPrice {
    int base = widget.itemData.price * quantity;
    for (final index in selectedAddOns) {
      base += addOns[index].price;
    }
    return base;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Image.network(
                          widget.itemData.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: AppColors.grey300,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 48,
                        left: 16,
                        child: GestureDetector(
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
                      ),
                    ],
                  ),
                  Transform.translate(
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
                              widget.itemData.name,
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF181C2E),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                            child: Text(
                              widget.itemData.description,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: const Color(0xFF646982),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                            child: Row(
                              children: [
                                Text(
                                  '${widget.itemData.price} FCFA',
                                  style: GoogleFonts.inter(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const Spacer(),
                                _buildQuantitySelector(),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(height: 32, color: Color(0xFFF0F0F0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Choose Size',
                              style: AppTextStyles.titleMedium.copyWith(
                                color: const Color(0xFF31343D),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: List.generate(sizes.length, (index) {
                                final isSelected = selectedSize == index;
                                return GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedSize = index),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected
                                            ? AppColors.primary
                                            : const Color(0xFFE0E0E0),
                                        width: 1.5,
                                      ),
                                      color: isSelected
                                          ? AppColors.primary.withValues(alpha: 0.05)
                                          : Colors.transparent,
                                    ),
                                    child: Text(
                                      sizes[index],
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        color: isSelected
                                            ? AppColors.primary
                                            : const Color(0xFF646982),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(height: 1, color: Color(0xFFF0F0F0)),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Add-ons',
                              style: AppTextStyles.titleMedium.copyWith(
                                color: const Color(0xFF31343D),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...List.generate(addOns.length, (index) {
                            final addOn = addOns[index];
                            final isChecked = selectedAddOns.contains(index);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isChecked) {
                                          selectedAddOns.remove(index);
                                        } else {
                                          selectedAddOns.add(index);
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isChecked
                                              ? AppColors.primary
                                              : const Color(0xFFBDBDBD),
                                          width: 2,
                                        ),
                                        color: isChecked
                                            ? AppColors.primary
                                            : Colors.transparent,
                                      ),
                                      child: isChecked
                                          ? const Icon(Icons.check,
                                              size: 14, color: AppColors.white)
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      addOn.name,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: const Color(0xFF181C2E),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '+${addOn.price} FCFA',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF646982),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xFF646982),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$totalPrice FCFA',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF181C2E),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const CartPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 1) {
                setState(() => quantity--);
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: quantity == 1
                    ? const Color(0xFFF5F5F5)
                    : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Icon(
                Icons.remove,
                size: 18,
                color: quantity == 1
                    ? const Color(0xFFBDBDBD)
                    : const Color(0xFF181C2E),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              '$quantity',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF181C2E),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => quantity++),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 18,
                color: Color(0xFF181C2E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
