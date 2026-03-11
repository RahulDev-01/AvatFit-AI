import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class MuscleInteractionScreen extends StatelessWidget {
  const MuscleInteractionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color neonGreen = Color(0xFF39FF14);

    return Scaffold(
      backgroundColor: const Color(0xFF101722), // background-dark
      
      // Header
      appBar: AppBar(
        backgroundColor: const Color(0xFF101722).withOpacity(0.8),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        title: Text('Muscle Interaction', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
            style: IconButton.styleFrom(backgroundColor: const Color(0xFF1E293B)), // hover/bg slate-800
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.5 - 150,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 100, spreadRadius: 40)],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.5 - 100,
            child: Container(
              width: 200, height: 400,
              decoration: BoxDecoration(
                color: neonGreen.withOpacity(0.1),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: neonGreen.withOpacity(0.1), blurRadius: 80, spreadRadius: 20)],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text('FITMORPH AVATAR', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 2.0)),
                
                // Avatar Area
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Avatar Image
                      Image.asset(
                        'assets/images/Muscle Interaction - c43c91dfda074beba4687a4e662a2ac3.png', // Placeholder
                        fit: BoxFit.contain,
                      ),
                      
                      // Leg Highlights
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.15, // Approximation mapping
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 150, height: 200,
                              decoration: BoxDecoration(
                                color: neonGreen.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [BoxShadow(color: neonGreen.withOpacity(0.2), blurRadius: 30, spreadRadius: 10)],
                              ),
                            ),
                            Container(
                              width: 120, height: 180,
                              decoration: BoxDecoration(
                                border: Border.all(color: neonGreen.withOpacity(0.4), width: 2),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [BoxShadow(color: neonGreen.withOpacity(0.4), blurRadius: 30)],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom Info Card
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 100.0), // Padding for navbar
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A).withOpacity(0.4), // slate-900/40
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: const Color(0xFF334155).withOpacity(0.5)), // slate-700/50
                        ),
                        child: Stack(
                          children: [
                            // Neon green side accent
                            Positioned(
                              top: -24, bottom: -24, left: -24,
                              child: Container(
                                width: 4,
                                decoration: BoxDecoration(
                                  color: neonGreen,
                                  boxShadow: [BoxShadow(color: neonGreen.withOpacity(0.8), blurRadius: 15)],
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(text: 'Legs: 420 kcal ', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                                                TextSpan(text: 'burned this week', style: AppTextStyles.labelSmall.copyWith(color: neonGreen, fontWeight: FontWeight.normal)),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(Icons.adjust, color: Color(0xFFCBD5E1), size: 14), // slate-300
                                              const SizedBox(width: 4),
                                              Text('Primary Target: Quads & Glutes', style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFFCBD5E1))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      decoration: BoxDecoration(
                                        color: neonGreen.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4.0),
                                        border: Border.all(color: neonGreen.withOpacity(0.3)),
                                      ),
                                      child: Text('ACTIVE AREA', style: AppTextStyles.labelSmall.copyWith(color: neonGreen, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.0)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text('SUGGESTED EXERCISES', style: AppTextStyles.labelSmall.copyWith(color: const Color(0xFF94A3B8), fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.0)), // slate-400
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8.0, runSpacing: 8.0,
                                  children: [
                                    _buildTag('Squats'),
                                    _buildTag('Lunges'),
                                    _buildTag('Leg Press'),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(double.infinity, 48),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                    elevation: 8,
                                    shadowColor: AppColors.primary.withOpacity(0.2),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('View Workout History', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold)),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward, size: 18),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Nav bar inside the screen layout overlaying bottom section
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.translate(
        offset: const Offset(0, -10),
        child: Container(
          width: 56, height: 56,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 20, spreadRadius: 2)],
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF101722).withOpacity(0.8),
              border: const Border(top: BorderSide(color: Color(0xFF1E293B))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.home, label: 'Home', isSelected: false),
                _buildNavItem(icon: Icons.accessibility_new, label: 'Avatar', isSelected: true),
                const SizedBox(width: 40), // Space for FAB
                _buildNavItem(icon: Icons.fitness_center, label: 'Workouts', isSelected: false),
                _buildNavItem(icon: Icons.person, label: 'Profile', isSelected: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Text(text, style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF93C5FD))), // primary-light approximation
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isSelected ? AppColors.primary : const Color(0xFF64748B), size: 24), // slate-500
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            color: isSelected ? AppColors.primary : const Color(0xFF64748B),
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

