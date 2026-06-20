import 'package:flutter/material.dart';
import 'dart:math' as math;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSendCode() {
    if (_formKey.currentState!.validate()) {
      // TO-DO: Implement send code logic
      print('Send code to: ${_emailController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D2E),
      body: Stack(
        children: [
          // Top left decorative rays
          Positioned(
            top: -50,
            left: -50,
            child: Opacity(
              opacity: 0.2,
              child: CustomPaint(
                size: const Size(200, 200),
                painter: RaysPainter(isTopLeft: true),
              ),
            ),
          ),

          // Top right decorative rays
          Positioned(
            top: -50,
            right: -50,
            child: Opacity(
              opacity: 0.2,
              child: CustomPaint(
                size: const Size(200, 200),
                painter: RaysPainter(isTopLeft: false),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top section with dark background
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Back button
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFF1A1D2E),
                              size: 18,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Title
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Subtitle
                      const Text(
                        'Please sign in to your existing account',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),

                // Form container - fills remaining space
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Email field
                            const Text(
                              'EMAIL',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                                hintStyle: const TextStyle(
                                  color: Color(0xFFBDBDBD),
                                  fontSize: 14,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF5F5F7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 32),

                            // Send code button
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: _handleSendCode,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD32048),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Text(
                                  'SEND CODE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RaysPainter extends CustomPainter {
  final bool isTopLeft;

  RaysPainter({required this.isTopLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.8;

    const rayCount = 24;
    final startAngle = isTopLeft ? math.pi : 0.0;
    const sweepAngle = math.pi / 2;
    const angleStep = sweepAngle / rayCount;

    for (int i = 0; i < rayCount; i++) {
      if (i % 2 == 0) {
        final angle1 = startAngle + (i * angleStep);
        final angle2 = startAngle + ((i + 1) * angleStep);

        final path = Path()
          ..moveTo(center.dx, center.dy)
          ..lineTo(
            center.dx + radius * math.cos(angle1),
            center.dy + radius * math.sin(angle1),
          )
          ..lineTo(
            center.dx + radius * math.cos(angle2),
            center.dy + radius * math.sin(angle2),
          )
          ..close();

        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
