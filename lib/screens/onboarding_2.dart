import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

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
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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

                // Illustration Area
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        // Decorative Background Blob
                        Container(
                          width: 280,
                          height: 280,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withOpacity(0.1),
                          ),
                        ),
                        
                        // Main Illustration Card
                        SizedBox(
                          width: 240,
                          height: 240,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E293B).withOpacity(0.8),
                              border: Border.all(color: const Color(0xFF334155).withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Simulated Workout Plan UI
                                Container(
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.fitness_center, color: AppColors.primary, size: 24),
                                          const SizedBox(width: 8),
                                          Container(
                                            height: 10, width: 80,
                                            decoration: BoxDecoration(
                                              color: AppColors.primary.withOpacity(0.4),
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      _buildSkeletonLine(double.infinity),
                                      const SizedBox(height: 8),
                                      _buildSkeletonLine(140),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                
                                // Simulated Muscle Focus UI
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                                            const SizedBox(width: 6),
                                            Expanded(child: Container(height: 6, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.3), borderRadius: BorderRadius.circular(3.0)))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.03),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF94A3B8), shape: BoxShape.circle)),
                                            const SizedBox(width: 6),
                                            Expanded(child: Container(height: 6, decoration: BoxDecoration(color: const Color(0xFF64748B).withOpacity(0.2), borderRadius: BorderRadius.circular(3.0)))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        // Floating Badge
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 10),
                              ],
                            ),
                            child: const Icon(Icons.psychology, color: Colors.white, size: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),
                
                // Content Section
                Column(
                  children: [
                    Text(
                      'Personalized Workouts',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Get AI-generated routines tailored specifically to your body type, equipment, and fitness goals.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textMuted,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 48),

                // Footer Section
                Column(
                  children: [
                    // Page Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(true), // Current Page
                        const SizedBox(width: 12),
                        _buildDot(false),
                      ],
                    ),
                    const SizedBox(height: 32),
                    
                    // Next Button
                    ElevatedButton(
                      onPressed: () => context.go(AppRoutes.onboarding3),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 8,
                        shadowColor: AppColors.primary.withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Continue', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
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

  Widget _buildSkeletonLine(double width) {
    return Container(
      height: 8,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xFF64748B).withOpacity(0.2), // slate-500/20
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 32 : 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : const Color(0xFF334155), // slate-700
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}


