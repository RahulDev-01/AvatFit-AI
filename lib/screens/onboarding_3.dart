import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                // Top App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.03),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.08)),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.chevron_left, color: Colors.white),
                          onPressed: () {
                            if (context.canPop()) {
                              context.pop();
                            }
                          },
                        ),
                      ),
                      Text(
                        'AvatFit AI',
                        style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go(AppRoutes.signUpLogin);
                        },
                        child: Text(
                          'Skip',
                          style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Page Indicators
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(false),
                      const SizedBox(width: 12),
                      _buildDot(true),
                    ],
                  ),
                ),

                // Hero Headline
                Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTextStyles.headlineLarge.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                          letterSpacing: -0.5,
                        ),
                        children: const [
                          TextSpan(text: 'See Your Body\n'),
                          TextSpan(
                            text: 'Transform',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Visualize your future self with our AI morphing technology.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Transformation Cards
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      // Before Card
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white.withOpacity(0.03),
                            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/Onboarding 3 - 0a6253832dec46ba9ed0c1f58dd63bff.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => 
                                      Icon(Icons.person_outline, size: 64, color: AppColors.textMuted.withOpacity(0.2)),
                                ),
                              ),
                              Positioned(
                                bottom: 12, left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    'BEFORE',
                                    style: AppTextStyles.labelSmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),
                      
                      // Connection icon
                      Container(
                        width: 48, height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.background, width: 4),
                        ),
                        child: const Icon(Icons.double_arrow, color: Colors.white, size: 24),
                      ),

                      const SizedBox(width: 12),
                      
                      // Goal Card
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white.withOpacity(0.05),
                            border: Border.all(color: AppColors.primary.withOpacity(0.4)),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/Onboarding 3 - 0a6253832dec46ba9ed0c1f58dd63bff.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => 
                                      Icon(Icons.person, size: 64, color: AppColors.primary.withOpacity(0.2)),
                                ),
                              ),
                              Positioned(
                                bottom: 12, left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    'GOAL',
                                    style: AppTextStyles.labelSmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.white,
                                      fontSize: 10,
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

                const SizedBox(height: 32),

                // Glassmorphism Progress Feature Card
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.03),
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40, height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Icon(Icons.analytics, color: AppColors.primary),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'AI Morph Tracking',
                            style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Our advanced AI analyzes your current physique and generates a 90-day projection of your potential results based on your selected program.',
                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted, height: 1.5),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(
                            width: 64, height: 24,
                            child: Stack(
                              children: [
                                _buildUserAvatar('JD', 0),
                                _buildUserAvatar('MK', 16),
                                _buildUserAvatar('SL', 32),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '+12k others transformed',
                            style: AppTextStyles.labelSmall.copyWith(color: const Color(0xFF64748B), fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // Footer / Action Area
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => context.go(AppRoutes.signUpLogin),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        elevation: 8,
                        shadowColor: AppColors.primary.withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Start Your Transformation', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          const Icon(Icons.trending_up),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        context.go(AppRoutes.onboarding2);
                      },
                      child: Text(
                        'Back to step 2',
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 32 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : const Color(0xFF334155),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }

  Widget _buildUserAvatar(String initials, double leftOffset) {
    return Positioned(
      left: leftOffset,
      child: Container(
        width: 24, height: 24,
        decoration: BoxDecoration(
          color: const Color(0xFF334155),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF0F172A), width: 2),
        ),
        child: Center(
          child: Text(
            initials,
            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}


