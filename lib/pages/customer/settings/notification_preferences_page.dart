import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class NotificationPreferencesPage extends StatefulWidget {
  const NotificationPreferencesPage({super.key});

  @override
  State<NotificationPreferencesPage> createState() => _NotificationPreferencesPageState();
}

class _NotificationPreferencesPageState extends State<NotificationPreferencesPage> {
  bool _push = true;
  bool _sms = false;
  bool _email = true;
  bool _orderUpdates = true;
  bool _promotions = true;
  bool _newRestaurants = false;
  bool _paymentConfirm = true;

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
        title: Text('Notifications', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E))),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 8),
          _buildSectionTitle('Channels'),
          _buildToggle('Push Notifications', 'Receive push notifications', _push, (v) => setState(() => _push = v)),
          _buildToggle('SMS Notifications', 'Receive SMS updates', _sms, (v) => setState(() => _sms = v)),
          _buildToggle('Email Notifications', 'Receive email updates', _email, (v) => setState(() => _email = v)),
          const Divider(height: 32),
          _buildSectionTitle('Updates'),
          _buildToggle('Order Updates', 'Status changes, delivery tracking', _orderUpdates, (v) => setState(() => _orderUpdates = v)),
          _buildToggle('Promotions & Offers', 'Discounts, special deals', _promotions, (v) => setState(() => _promotions = v)),
          _buildToggle('New Restaurant Alerts', 'When new restaurants open', _newRestaurants, (v) => setState(() => _newRestaurants = v)),
          _buildToggle('Payment Confirmation', 'Payment success & receipts', _paymentConfirm, (v) => setState(() => _paymentConfirm = v)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Text(title, style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
    );
  }

  Widget _buildToggle(String label, String description, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.bodyMedium.copyWith(color: const Color(0xFF181C2E))),
                const SizedBox(height: 2),
                Text(description, style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey500)),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary.withValues(alpha: 0.4),
            activeThumbColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
