import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

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
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Visual Content Area
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Avatar Image
                          ClipOval(
                            child: Opacity(
                              opacity: 0.9,
                              child: Container(
                                color: AppColors.surface, // Placeholder color
                                child: Image.asset(
                                  'assets/images/Onboarding 1 - dd4e6ed3a8a241b894fe3928dbbc4b6a.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => 
                                      Icon(Icons.person, size: 120, color: AppColors.primary.withOpacity(0.3)),
                                ),
                              ),
                            ),
                          ),
                          
                          // Floating Icons
                          _buildFloatingIcon(
                            icon: Icons.fitness_center,
                            color: AppColors.primary,
                            top: 20,
                            left: 20,
                          ),
                          _buildFloatingIcon(
                            icon: Icons.local_fire_department,
                            color: Colors.orange,
                            bottom: 30,
                            left: 10,
                          ),
                          _buildFloatingIcon(
                            icon: Icons.query_stats,
                            color: Colors.greenAccent,
                            top: 60,
                            right: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Text Content
                Column(
                  children: [
                    Text(
                      'Track Your Fitness Journey',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Visualize your progress with personalized metrics and daily activity tracking for a healthier lifestyle.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textMuted,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Glassmorphism Card Feature
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.analytics, color: AppColors.primary),
                              const SizedBox(width: 12),
                              Text(
                                'Real-time Analytics',
                                style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Monitor your heart rate, burned calories, and training intensity instantly.',
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 48),

                // Footer Actions
                Column(
                  children: [
                    // Page Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(true),
                        const SizedBox(width: 8),
                        _buildDot(false),
                        const SizedBox(width: 8),
                        _buildDot(false),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Next Button
                    ElevatedButton(
                      onPressed: () => context.go(AppRoutes.onboarding2),
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
                          Text('Next', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward),
                        ],
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

  Widget _buildFloatingIcon({
    required IconData icon,
    required Color color,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10),
            ],
          ),
          child: Icon(icon, color: color, size: 28),
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
        color: isActive ? AppColors.primary : const Color(0xFF334155), // slate-700
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}


