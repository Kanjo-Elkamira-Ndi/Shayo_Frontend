import 'package:flutter/material.dart';
// import 'core/presentation/splash_screen.dart';
// import 'core/presentation/onboarding_screen.dart';
// import 'features/auth/login_screen.dart';
// import 'features/auth/forgot_password_screen.dart';
// import 'features/auth/verification_screen.dart';
import 'features/auth/signup_screen.dart';

class ShayoApp extends StatelessWidget {
  const ShayoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shayo",
      // home: const SplashScreen(),
      // home: const OnboardingScreen(),
      // home: const LoginScreen(),
      // home: const ForgotPasswordScreen(),
      // home: const VerificationScreen(email: ''),
      home: const SignUpScreen(),
    );
  }
}
