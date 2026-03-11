import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Use Lexend as primary font
  static final TextStyle headlineLarge = GoogleFonts.lexend(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textHighEmphasis,
    letterSpacing: -0.5,
  );
  
  static final TextStyle headlineMedium = GoogleFonts.lexend(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textHighEmphasis,
    letterSpacing: -0.5,
  );
  
  static final TextStyle headlineSmall = GoogleFonts.lexend(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textHighEmphasis,
  );
  
  static final TextStyle titleLarge = GoogleFonts.lexend(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textHighEmphasis,
  );
  
  static final TextStyle bodyLarge = GoogleFonts.lexend(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textBody,
  );
  
  static final TextStyle bodyMedium = GoogleFonts.lexend(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textBody,
  );
  
  static final TextStyle bodySmall = GoogleFonts.lexend(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textMuted,
  );
  
  static final TextStyle labelLarge = GoogleFonts.lexend(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textHighEmphasis,
  );
  
  static final TextStyle labelSmall = GoogleFonts.lexend(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
    letterSpacing: 0.5,
  );
}
