import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  int _remainingSeconds = 50;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _handleResend() {
    setState(() {
      _remainingSeconds = 50;
    });
    _startTimer();
    // TO-DO: Implement resend code logic
    print('Resending code to: ${widget.email}');
  }

  void _handleVerify() {
    String code = _controllers.map((c) => c.text).join();
    if (code.length == 4) {
      // TO-DO: Implement verification logic
      print('Verifying code: $code');
    }
  }

  void _onCodeChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }

    // Auto-verify if all fields are filled
    if (_controllers.every((c) => c.text.isNotEmpty)) {
      _handleVerify();
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
                            decoration: const BoxDecoration(
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
                        'Verification',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Subtitle
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF9E9E9E),
                          ),
                          children: [
                            const TextSpan(
                              text: 'We have sent a code to your email\n',
                            ),
                            TextSpan(
                              text: widget.email,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CODE label and Resend link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'CODE',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                                letterSpacing: 0.5,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _remainingSeconds == 0
                                      ? _handleResend
                                      : null,
                                  child: Text(
                                    'Resend',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _remainingSeconds == 0
                                          ? const Color(0xFFD32048)
                                          : const Color(0xFF9E9E9E),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'in ${_remainingSeconds}sec',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Code input fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4,
                            (index) => _CodeInputField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              onChanged: (value) =>
                                  _onCodeChanged(index, value),
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Verify button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _handleVerify,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD32048),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'VERIFY',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;

  const _CodeInputField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A1A1A),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: onChanged,
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
