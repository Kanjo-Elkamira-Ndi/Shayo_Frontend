import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Navigate to home screen after delay
  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      // TO-DO: Replace with your actual navigation logic
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top left decorative rays
          Positioned(
            top: -50,
            left: -50,
            child: CustomPaint(
              size: const Size(250, 250),
              painter: TopLeftRaysPainter(),
            ),
          ),

          // Bottom right decorative rays
          Positioned(
            bottom: -50,
            right: -50,
            child: CustomPaint(
              size: const Size(250, 250),
              painter: BottomRightRaysPainter(),
            ),
          ),

          // Center logo
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFD32048),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopLeftRaysPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF0F0F0)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.8;

    // Draw rays from center, covering bottom-right quadrant
    const rayCount = 30;
    const startAngle = 0.0;
    const endAngle = math.pi / 2;
    const angleStep = endAngle / rayCount;

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

class BottomRightRaysPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF9B57)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.8;

    // Draw rays from center, covering top-left quadrant
    const rayCount = 30;
    const startAngle = math.pi;
    const endAngle = math.pi * 1.5;
    const angleStep = (endAngle - startAngle) / rayCount;

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
