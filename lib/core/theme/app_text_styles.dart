import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get displayLarge =>
      GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w700);

  static TextStyle get headlineMedium =>
      GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600);

  static TextStyle get titleLarge =>
      GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600);

  static TextStyle get titleMedium =>
      GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle get bodyLarge =>
      GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle get bodyMedium =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle get bodySmall =>
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400);

  static TextStyle get labelLarge =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle get labelSmall =>
      GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500);
}
