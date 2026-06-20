import 'package:flutter/material.dart';
// import 'core/constants/splash_screen.dart';
// import 'core/constants/onboarding_screen.dart';
// import 'pages/auth/login_screen.dart';
// import 'pages/auth/forgot_password_screen.dart';
// import 'pages/auth/verification_screen.dart';
// import 'pages/auth/signup_screen.dart';
// import 'pages/auth/location_access_screen.dart';
// import 'pages/home/home_screen.dart';
// import 'pages/restaurants/food_screen.dart';
// import 'pages/restaurants/food_details_screen.dart';
// import 'pages/restaurants/restaurant_menu_screen.dart';
// import 'pages/cart/cart_screen.dart';
import 'pages/cart/edit_cart.dart';

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
      // home: const SignUpScreen(),
      // home: const LocationAccessScreen(),
      // home: const HomeScreen(),
      // home: const FoodScreen(),
      // home: const RestaurantMenuScreen(),
      // home: const CartScreen(),
      home: const EditCartScreen(),
    );
  }
}
