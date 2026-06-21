import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ScheduleDeliveryPage extends StatefulWidget {
  const ScheduleDeliveryPage({super.key});

  @override
  State<ScheduleDeliveryPage> createState() => _ScheduleDeliveryPageState();
}

class _ScheduleDeliveryPageState extends State<ScheduleDeliveryPage> {
  int _selectedDate = 0;
  int _selectedTime = 0;

  final List<String> _dates = ['Today', 'Tomorrow', 'Mon 22', 'Tue 23', 'Wed 24', 'Thu 25', 'Fri 26'];
  final List<String> _times = ['10:00-11:00', '11:00-12:00', '12:00-13:00', '13:00-14:00', '14:00-15:00', '15:00-16:00', '16:00-17:00', '17:00-18:00'];
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
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
        title: Text('Schedule Delivery', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF181C2E))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Date', style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
            const SizedBox(height: 12),
            SizedBox(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _dates.length,
                itemBuilder: (context, index) {
                  final selected = _selectedDate == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDate = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : AppColors.grey100,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _dates[index],
                        style: AppTextStyles.labelLarge.copyWith(
                          color: selected ? AppColors.white : const Color(0xFF646982),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text('Select Time', style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(_times.length, (index) {
                final selected = _selectedTime == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTime = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.white,
                      border: Border.all(
                        color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
                        width: selected ? 1.5 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _times[index],
                      style: AppTextStyles.labelLarge.copyWith(
                        color: selected ? AppColors.primary : const Color(0xFF646982),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Text('Delivery Notes', style: AppTextStyles.titleMedium.copyWith(color: const Color(0xFF181C2E))),
            const SizedBox(height: 12),
            TextField(
              controller: _notesController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Add delivery instructions...',
                hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey400),
                filled: true,
                fillColor: AppColors.grey100,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
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
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Delivery scheduled!'),
                    backgroundColor: Color(0xFFC2033A),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: Text('Confirm Schedule', style: AppTextStyles.labelLarge.copyWith(color: AppColors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
