import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'schedule_delivery_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _selectedMethod = 0;
  bool _saveCard = false;

  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardNameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _cardNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF181C2E), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Payment Method', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSavedCard(0, 'Visa', '**** **** **** 1234', '12/26'),
            _buildSavedCard(1, 'Mastercard', '**** **** **** 5678', '08/25'),
            _buildSavedCard(2, 'PayPal', 'vishal@email.com', ''),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Text('Add New Card', style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
            const SizedBox(height: 16),
            _buildTextField('Card Number', '1234 5678 9012 3456', controller: _cardNumberController),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildTextField('Expiry', 'MM/YY', controller: _expiryController)),
                const SizedBox(width: 12),
                Expanded(child: _buildTextField('CVV', '123', controller: _cvvController)),
              ],
            ),
            const SizedBox(height: 12),
            _buildTextField('Cardholder Name', 'John Doe', controller: _cardNameController),
            const SizedBox(height: 12),
            Row(
              children: [
                SizedBox(
                  height: 24, width: 24,
                  child: Checkbox(
                    value: _saveCard,
                    onChanged: (v) => setState(() => _saveCard = v ?? false),
                    activeColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(width: 8),
                Text('Save card', style: AppTextStyles.bodyMedium.copyWith(color: const Color(0xFF646982))),
              ],
            ),
            const SizedBox(height: 24),
            _buildPaymentOption('Cash on Delivery', Icons.money),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity, height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScheduleDeliveryPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: Text('Confirm Payment', style: AppTextStyles.labelLarge.copyWith(color: AppColors.white)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSavedCard(int index, String brand, String number, String expiry) {
    final selected = _selectedMethod == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: selected ? AppColors.primary : const Color(0xFFE0E0E0), width: selected ? 1.5 : 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppColors.primary : AppColors.grey400, size: 22),
            const SizedBox(width: 12),
            Icon(Icons.credit_card, color: AppColors.surface, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(number, style: AppTextStyles.bodyMedium.copyWith(color: const Color(0xFF181C2E))),
                  if (expiry.isNotEmpty)
                    Text('Expires $expiry', style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey500)),
                ],
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle, color: AppColors.primary, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String label, IconData icon) {
    final selected = _selectedMethod == 3;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = 3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: selected ? AppColors.primary : const Color(0xFFE0E0E0), width: selected ? 1.5 : 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppColors.primary : AppColors.grey400, size: 22),
            const SizedBox(width: 12),
            Icon(icon, color: AppColors.surface, size: 28),
            const SizedBox(width: 12),
            Text(label, style: AppTextStyles.bodyMedium.copyWith(color: const Color(0xFF181C2E))),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey600)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey400),
            filled: true,
            fillColor: AppColors.grey100,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}
