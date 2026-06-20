import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_export.dart';

// custom_error_widget.dart

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails? errorDetails;
  final String? errorMessage;

  const CustomErrorWidget({super.key, this.errorDetails, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/sad_face.svg',
                  height: 42,
                  width: 42,
                ),
                const SizedBox(height: 8),
                Text(
                  "Something went wrong",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF262626),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  child: const Text(
                    'We encountered an unexpected error while processing your request.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF525252), // neutral-600
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    bool canBeBack = context.canPop();
                    if (canBeBack) {
                      context.pop();
                    } else {
                      context.goNamed(AppRoutes.initial);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text('Back'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
