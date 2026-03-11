import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class WorkoutPlanScreen extends StatelessWidget {
  const WorkoutPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101722), // background-dark
      
      // Header Section
      appBar: AppBar(
        backgroundColor: const Color(0xFF101722).withOpacity(0.8),
        elevation: 0,
        surfaceTintColor: Colors.transparent, // Disable material 3 tint
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today\'s Workout', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
            Text('FITMORPH PRO', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w600, letterSpacing: 1.0, fontSize: 10)),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
              onPressed: () {},
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 120.0), // Padding for floating button and nav bar
            children: [
              // Hero Summary Card
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withOpacity(0.2),
                      Colors.transparent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                ),
                child: Stack(
                  children: [
                    // Decorative background element
                    Positioned(
                      top: -30, right: -40,
                      child: Container(
                        width: 120, height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.15),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: AppColors.primary.withOpacity(0.15), blurRadius: 40, spreadRadius: 10)
                          ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Monday Upper Body', style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _buildSummaryStat(icon: Icons.timer, iconColor: AppColors.primary, text: '45 Min'),
                              const SizedBox(width: 16),
                              _buildSummaryStat(icon: Icons.local_fire_department, iconColor: AppColors.primary, text: '320 kcal'),
                              const SizedBox(width: 16),
                              _buildSummaryStat(icon: Icons.fitness_center, iconColor: AppColors.primary, text: '6 Exercises'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Exercise List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text('EXERCISE LIST', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w600, letterSpacing: 1.5, fontSize: 10)),
              ),
              const SizedBox(height: 12),

              _buildExerciseCard(
                icon: Icons.fitness_center, // "exercise" approximation
                title: 'Bench Press',
                difficultyDots: [true, true, false],
                subtitle: 'Chest • Compound',
                sets: '4 SETS',
                reps: '10 REPS',
              ),
              const SizedBox(height: 12),
              _buildExerciseCard(
                icon: Icons.line_weight,
                title: 'Incline Fly',
                difficultyDots: [true, false, false],
                subtitle: 'Chest • Isolation',
                sets: '3 SETS',
                reps: '12 REPS',
              ),
              const SizedBox(height: 12),
              _buildExerciseCard(
                icon: Icons.sports_gymnastics,
                title: 'Lat Pulldowns',
                difficultyDots: [true, true, false],
                subtitle: 'Back • Compound',
                sets: '4 SETS',
                reps: '8 REPS',
              ),
              const SizedBox(height: 12),
              _buildExerciseCard(
                icon: Icons.front_loader,
                title: 'Shoulder Press',
                difficultyDots: [true, true, true],
                subtitle: 'Shoulders • Compound',
                sets: '3 SETS',
                reps: '12 REPS',
              ),
            ],
          ),

          // Floating Action Button Area
          Positioned(
            bottom: 80, // Above bottom nav
            left: 0, right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  context.push(AppRoutes.activeWorkout);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  elevation: 8,
                  shadowColor: AppColors.primary.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.play_arrow),
                    const SizedBox(width: 8),
                    Text('Start Workout', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF0F172A), // slate-900
          border: Border(top: BorderSide(color: Color(0xFF1E293B))), // slate-800
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(icon: Icons.home, label: 'Home', isSelected: false),
            _buildNavItem(icon: Icons.fitness_center, label: 'Workout', isSelected: true),
            _buildNavItem(icon: Icons.analytics, label: 'Stats', isSelected: false),
            _buildNavItem(icon: Icons.person, label: 'Profile', isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryStat({required IconData icon, required Color iconColor, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 18),
        const SizedBox(width: 4),
        Text(text, style: AppTextStyles.labelSmall.copyWith(color: const Color(0xFFCBD5E1), fontSize: 10, fontWeight: FontWeight.normal)),
      ],
    );
  }

  Widget _buildExerciseCard({
    required IconData icon,
    required String title,
    required List<bool> difficultyDots,
    required String subtitle,
    required String sets,
    required String reps,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.4), // slate-800/40
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFF334155).withOpacity(0.5)), // slate-700/50
      ),
      child: Row(
        children: [
          Container(
            width: 56, height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A).withOpacity(0.6), // slate-900/60
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: const Color(0xFF334155).withOpacity(0.5)),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                    Row(
                      children: difficultyDots.map((isActive) {
                        return Container(
                          width: 8, height: 8,
                          margin: const EdgeInsets.only(left: 2.0),
                          decoration: BoxDecoration(
                            color: isActive ? AppColors.primary : const Color(0xFF334155),
                            shape: BoxShape.circle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontSize: 10)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTag(sets),
                    const SizedBox(width: 12),
                    _buildTag(reps),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 32, height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B), // slate-800
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.more_vert, color: Color(0xFF64748B), size: 18), // slate-500
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withOpacity(0.8), // slate-900/80
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: const Color(0xFF334155).withOpacity(0.5)),
      ),
      child: Text(text, style: AppTextStyles.labelSmall.copyWith(color: const Color(0xFFCBD5E1), fontSize: 10, fontWeight: FontWeight.bold)),
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


