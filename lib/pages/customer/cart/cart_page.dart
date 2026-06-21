import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../checkout/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<_CartItem> _items = [
    _CartItem(name: 'Buffalo Pizza', description: 'Cafenio Coffee Club', price: 2500, qty: 1, image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=200'),
    _CartItem(name: 'Smokin\' Burger', description: 'Cafenio Restaurant', price: 1800, qty: 2, image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200'),
    _CartItem(name: 'Pasta Carbonara', description: 'La Terrasse', price: 2200, qty: 1, image: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=200'),
    _CartItem(name: 'Caesar Salad', description: 'Rose Garden', price: 1500, qty: 1, image: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=200'),
  ];

  int get _total => _items.fold(0, (sum, item) => sum + item.price * item.qty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('My Cart', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E))),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF181C2E)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              itemCount: _items.length,
              separatorBuilder: (_, __) => const Divider(height: 24),
              itemBuilder: (context, index) {
                return _CartItemTile(
                  item: _items[index],
                  onIncrement: () {
                    setState(() => _items[index].qty++);
                  },
                  onDecrement: () {
                    setState(() {
                      if (_items[index].qty > 1) _items[index].qty--;
                    });
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFFF0F0F0), width: 1)),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Total', style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
                      const Spacer(),
                      Text('$_total FCFA', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CheckoutPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                      child: Text('Checkout', style: AppTextStyles.labelLarge.copyWith(color: AppColors.white)),
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
}

class _CartItem {
  String name;
  String description;
  int price;
  int qty;
  String image;

  _CartItem({required this.name, required this.description, required this.price, required this.qty, required this.image});
}

class _CartItemTile extends StatelessWidget {
  final _CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _CartItemTile({required this.item, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(item.image, width: 80, height: 80, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(width: 80, height: 80, color: const Color(0xFFC4C4C4)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name, style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
              const SizedBox(height: 4),
              Text(item.description, style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF646982))),
              const SizedBox(height: 6),
              Text('${item.price} FCFA', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onDecrement,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.remove, size: 18, color: Color(0xFF181C2E)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('${item.qty}', style: AppTextStyles.labelLarge.copyWith(color: const Color(0xFF181C2E))),
              ),
              GestureDetector(
                onTap: onIncrement,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.add, size: 18, color: Color(0xFF181C2E)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
