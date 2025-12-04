import 'package:flutter/material.dart';

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
      // to-do: will be replaced with the actual logic, here is a code snippet
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
      body: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            color: Color(0xFFD32048),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset('assets/images/logo.png', width: 80, height: 80),
          ),
        ),
      ),
    );
  }
}
