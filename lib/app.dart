import 'package:flutter/material.dart';
import 'core/presentation/splash_screen.dart';

class ShayoApp extends StatelessWidget {
  const ShayoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shayo",
      home: const SplashScreen(),
    );
  }
}
