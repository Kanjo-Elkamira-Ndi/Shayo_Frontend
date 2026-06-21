import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../profile/edit_profile_page.dart';
import 'notification_preferences_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Settings', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF181C2E), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            _buildSectionTitle('Account'),
            _buildTile('Edit Profile', Icons.person_outline, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfilePage()))),
            _buildTile('Language', Icons.language_outlined, () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Language selection coming soon'))), trailing: 'English'),
            _buildTile('Notification Preferences', Icons.notifications_outlined, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationPreferencesPage()))),
            const Divider(height: 32),
            _buildSectionTitle('Payment'),
            _buildTile('Payment Methods', Icons.credit_card_outlined, () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment methods coming soon')))),
            _buildTile('Currency', Icons.attach_money_outlined, () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Currency selection coming soon'))), trailing: 'FCFA'),
            const Divider(height: 32),
            _buildSectionTitle('About'),
            _buildTile('Privacy Policy', Icons.privacy_tip_outlined, () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Privacy policy coming soon')))),
            _buildTile('Terms of Service', Icons.description_outlined, () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Terms of service coming soon')))),
            _buildTile('App Version', Icons.info_outline, () {}, trailing: '1.0.0'),
            const SizedBox(height: 32),
            Center(
              child: TextButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logout coming soon'))),
                child: Text('Log Out', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
    );
  }

  Widget _buildTile(String label, IconData icon, VoidCallback onTap, {String? trailing}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40, height: 40,
        decoration: BoxDecoration(color: AppColors.grey100, borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: AppColors.surface, size: 22),
      ),
      title: Text(label, style: AppTextStyles.bodyMedium.copyWith(color: const Color(0xFF181C2E))),
      trailing: trailing != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(trailing, style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey500)),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right, color: AppColors.grey400, size: 20),
              ],
            )
          : const Icon(Icons.chevron_right, color: AppColors.grey400, size: 20),
      onTap: onTap,
    );
  }
}
