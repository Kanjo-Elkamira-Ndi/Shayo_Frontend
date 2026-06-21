import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'edit_profile_page.dart';
import 'address_management_page.dart';
import '../settings/settings_page.dart';
import '../settings/notification_preferences_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final List<_ProfileMenuItem> _menuItems;

  @override
  void initState() {
    super.initState();
    _menuItems = [
      _ProfileMenuItem(icon: Icons.person, label: 'Personal Info', onTap: _navigateToEditProfile),
      _ProfileMenuItem(icon: Icons.location_on, label: 'Addresses', onTap: _navigateToAddresses),
      _ProfileMenuItem(icon: Icons.credit_card, label: 'Payment Method', onTap: () {}),
      _ProfileMenuItem(icon: Icons.favorite, label: 'Favourite', onTap: () {}),
      _ProfileMenuItem(icon: Icons.notifications, label: 'Notifications', onTap: _navigateToNotifications),
      _ProfileMenuItem(icon: Icons.settings, label: 'Settings', onTap: _navigateToSettings),
      _ProfileMenuItem(icon: Icons.help, label: 'FAQ', onTap: () {}),
      _ProfileMenuItem(icon: Icons.rate_review, label: 'User Review', onTap: () {}),
    ];
  }

  void _navigateToEditProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfilePage()));
  }

  void _navigateToAddresses() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const AddressManagementPage()));
  }

  void _navigateToNotifications() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationPreferencesPage()));
  }

  void _navigateToSettings() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Profile', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E))),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          _buildProfileSection(),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _menuItems.length + 1,
              separatorBuilder: (_, __) => const Divider(height: 1, color: Color(0xFFF0F0F0)),
              itemBuilder: (context, index) {
                if (index == _menuItems.length) {
                  return _buildLogoutItem();
                }
                return _buildMenuItem(_menuItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFE0E0E0),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, size: 40, color: Color(0xFF9E9E9E)),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vishal Khadok',
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E)),
              ),
              const SizedBox(height: 4),
              Text(
                'I love fast food',
                style: AppTextStyles.bodyMedium.copyWith(color: const Color(0xFF646982)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(_ProfileMenuItem item) {
    return InkWell(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF0F0F0),
                shape: BoxShape.circle,
              ),
              child: Icon(item.icon, size: 20, color: const Color(0xFF181C2E)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                item.label,
                style: AppTextStyles.bodyMedium.copyWith(color: const Color(0xFF181C2E)),
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFBDBDBD)),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutItem() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF0F0F0),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.logout, size: 20, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Text(
              'Log Out',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileMenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}
