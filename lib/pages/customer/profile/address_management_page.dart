import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AddressManagementPage extends StatefulWidget {
  const AddressManagementPage({super.key});

  @override
  State<AddressManagementPage> createState() => _AddressManagementPageState();
}

class _AddressManagementPageState extends State<AddressManagementPage> {
  final List<_Address> _addresses = [
    _Address(label: 'Home', street: '123 Main Street', city: 'Douala', isDefault: true),
    _Address(label: 'Work', street: '45 Business Avenue', city: 'Douala', isDefault: false),
    _Address(label: 'Gym', street: '78 Fitness Road', city: 'Douala', isDefault: false),
  ];

  void _showAddAddressSheet() {
    final addressCtl = TextEditingController();
    final cityCtl = TextEditingController();
    String selectedLabel = 'Home';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20, right: 20, top: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.grey300, borderRadius: BorderRadius.circular(2)))),
                  const SizedBox(height: 16),
                  Text('Add New Address', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E))),
                  const SizedBox(height: 16),
                  Text('Address Label', style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey600)),
                  const SizedBox(height: 8),
                  Row(
                    children: ['Home', 'Work', 'Other'].map((l) {
                      final sel = selectedLabel == l;
                      return GestureDetector(
                        onTap: () => setSheetState(() => selectedLabel = l),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: sel ? AppColors.primary.withValues(alpha: 0.1) : AppColors.grey100,
                            border: Border.all(color: sel ? AppColors.primary : Colors.transparent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(l, style: AppTextStyles.labelLarge.copyWith(color: sel ? AppColors.primary : AppColors.grey600)),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  TextField(controller: addressCtl, decoration: InputDecoration(hintText: 'Street address', filled: true, fillColor: AppColors.grey100, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
                  const SizedBox(height: 12),
                  TextField(controller: cityCtl, decoration: InputDecoration(hintText: 'City', filled: true, fillColor: AppColors.grey100, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity, height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => _addresses.add(_Address(label: selectedLabel, street: addressCtl.text, city: cityCtl.text, isDefault: false)));
                        Navigator.pop(ctx);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), elevation: 0),
                      child: Text('Save Address', style: AppTextStyles.labelLarge.copyWith(color: AppColors.white)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
        title: Text('Addresses', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E))),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF181C2E)),
            onPressed: _showAddAddressSheet,
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _addresses.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final addr = _addresses[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(color: AppColors.grey100, borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.location_on, color: AppColors.primary, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(addr.label, style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
                          if (addr.isDefault) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.success.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('Default', style: AppTextStyles.labelSmall.copyWith(color: AppColors.success)),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('${addr.street}, ${addr.city}', style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey500)),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.edit, size: 20, color: AppColors.grey500), onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit address coming soon')),
                  );
                }),
                IconButton(icon: const Icon(Icons.delete_outline, size: 20, color: AppColors.error), onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Address deleted')),
                  );
                }),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddAddressSheet,
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: AppColors.white),
        label: Text('Add Address', style: AppTextStyles.labelLarge.copyWith(color: AppColors.white)),
      ),
    );
  }
}

class _Address {
  final String label;
  final String street;
  final String city;
  final bool isDefault;

  _Address({required this.label, required this.street, required this.city, required this.isDefault});
}
