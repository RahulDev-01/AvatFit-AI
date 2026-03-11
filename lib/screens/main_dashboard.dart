import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color accentGreen = Color(0xFF0BDA5E);
    const Color accentBlue = Color(0xFF00F2FF);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header Section
            SliverAppBar(
              backgroundColor: AppColors.background.withOpacity(0.8),
              floating: true,
              pinned: true,
              elevation: 0,
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(color: Colors.transparent),
                ),
              ),
              title: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary.withOpacity(0.5), width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Main Dashboard - 9b1f3a66cc6746bebb4b2117f01f8997.png'), // Placeholder
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 12, height: 12,
                          decoration: BoxDecoration(
                            color: accentGreen,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.background, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WELCOME BACK',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                          fontSize: 10,
                        ),
                      ),
                      Text('Good Morning, Rahul', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.03),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.notifications, color: Color(0xFFCBD5E1)), // slate-300
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            // Main Content Area
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Daily Summary Grid
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.5,
                      children: [
                        _buildSummaryCard(
                          icon: Icons.local_fire_department,
                          iconColor: AppColors.primary,
                          badgeText: '+12%',
                          badgeColor: accentGreen,
                          value: '850',
                          label: 'Calories burned',
                        ),
                        _buildSummaryCard(
                          icon: Icons.bolt,
                          iconColor: Colors.orange,
                          badgeText: 'MAX',
                          badgeColor: const Color(0xFF64748B), // slate-500
                          value: '12',
                          label: 'Day streak',
                        ),
                        _buildSummaryCard(
                          icon: Icons.schedule,
                          iconColor: accentBlue,
                          badgeText: 'PM',
                          badgeColor: accentBlue,
                          value: '45',
                          label: 'Mins today',
                        ),
                        _buildSummaryCard(
                          icon: Icons.footprint,
                          iconColor: accentGreen,
                          badgeText: '-5%',
                          badgeColor: Colors.redAccent,
                          value: '8,432',
                          label: 'Daily steps',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // 3D Avatar Muscle Focus Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Body Focus', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Text(
                            'UPPER BODY',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background Glow
                          Container(
                            width: 250, height: 250,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 80, spreadRadius: 40),
                              ],
                            ),
                          ),
                          // Avatar placeholder
                          Opacity(
                            opacity: 0.8,
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.matrix([
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0,      0,      0,      1, 0,
                              ]), // Grayscale
                              child: Image.asset(
                                'assets/images/Main Dashboard - 9b1f3a66cc6746bebb4b2117f01f8997.png', // Temporary placeholder
                                fit: BoxFit.contain,
                                height: 350,
                              ),
                            ),
                          ),
                          
                          // Hotspots
                          Positioned(
                            top: 120, left: MediaQuery.of(context).size.width * 0.45 - 24, // Approximation
                            child: Container(
                              width: 16, height: 16,
                              decoration: BoxDecoration(
                                color: accentBlue.withOpacity(0.4),
                                shape: BoxShape.circle,
                                border: Border.all(color: accentBlue),
                              ),
                              child: Center(
                                child: Container(width: 4, height: 4, decoration: const BoxDecoration(color: accentBlue, shape: BoxShape.circle)),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 180, left: MediaQuery.of(context).size.width * 0.35 - 24,
                            child: Container(
                              width: 16, height: 16,
                              decoration: BoxDecoration(
                                color: accentGreen.withOpacity(0.4),
                                shape: BoxShape.circle,
                                border: Border.all(color: accentGreen),
                              ),
                              child: Center(
                                child: Container(width: 4, height: 4, decoration: const BoxDecoration(color: accentGreen, shape: BoxShape.circle)),
                              ),
                            ),
                          ),

                          // Tooltip
                          Positioned(
                            top: 110, right: 30,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: accentBlue.withOpacity(0.5)),
                                filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('PECTORALS', style: AppTextStyles.labelSmall.copyWith(color: accentBlue, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: -0.5)),
                                  Text('High fatigue', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontSize: 8)),
                                ],
                              ),
                            ),
                          ),

                          // Bottom Stats
                          Positioned(
                            bottom: 24, left: 24, right: 24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('STRENGTH', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5)),
                                    Text('84%', style: AppTextStyles.titleMedium.copyWith(color: accentBlue, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('RECOVERY', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5)),
                                    Text('62%', style: AppTextStyles.titleMedium.copyWith(color: accentGreen, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Workout Plan Card
                    Text('Today\'s Protocol', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.primary.withOpacity(0.2),
                            accentBlue.withOpacity(0.1),
                          ],
                        ),
                        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -20, right: -20,
                            child: Icon(Icons.fitness_center, size: 120, color: Colors.white.withOpacity(0.05)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.timer, color: AppColors.primary, size: 16),
                                  const SizedBox(width: 8),
                                  Text('Chest & Triceps Mastery', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('Hypertrophy Session', style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(width: 8, height: 8, decoration: const BoxDecoration(color: accentGreen, shape: BoxShape.circle)),
                                  const SizedBox(width: 12),
                                  Text('Bench Press: 4 sets x 10 reps', style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFFCBD5E1))), // slate-300
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(width: 8, height: 8, decoration: const BoxDecoration(color: accentGreen, shape: BoxShape.circle)),
                                  const SizedBox(width: 12),
                                  Text('Incline Dumbbell Fly: 3 sets x 12 reps', style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFFCBD5E1))),
                                ],
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {
                                  // context.push(AppRoutes.workoutSessionV2);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 56),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  elevation: 8,
                                  shadowColor: AppColors.primary.withOpacity(0.4),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.play_arrow),
                                    const SizedBox(width: 8),
                                    Text('START WORKOUT', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: AppColors.background.withOpacity(0.95),
              border: const Border(top: BorderSide(color: Color(0xFF1E293B))), // slate-800
            ),
            padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.home, label: 'Home', isSelected: true),
                _buildNavItem(icon: Icons.fitness_center, label: 'Workouts', isSelected: false),
                _buildNavItem(icon: Icons.local_dining, label: 'Nutrition', isSelected: false),
                _buildNavItem(icon: Icons.person, label: 'Profile', isSelected: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required IconData icon,
    required Color iconColor,
    required String badgeText,
    required Color badgeColor,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: 24),
              Text(
                badgeText,
                style: AppTextStyles.labelSmall.copyWith(color: badgeColor, fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold, letterSpacing: -0.5)),
              Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? AppColors.primary : const Color(0xFF64748B), size: 28), // slate-500
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: AppTextStyles.labelSmall.copyWith(
            color: isSelected ? AppColors.primary : const Color(0xFF64748B),
            fontWeight: FontWeight.bold,
            fontSize: 10,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
