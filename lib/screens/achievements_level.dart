import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AchievementsLevelScreen extends StatelessWidget {
  const AchievementsLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101722), // background-dark

      appBar: AppBar(
        backgroundColor: const Color(0xFF101722).withOpacity(0.8),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text('Achievements', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100.0), // Padding for bottom nav
        child: Column(
          children: [
            // Profile & Level Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 128, height: 128,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [AppColors.primary, Color(0xFF22D3EE)], // cyan-400
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/images/Achievements Level - d1a7b1c08b7149cab5a4a5215334eac4.png'), // Placeholder
                            backgroundColor: Color(0xFF1E293B),
                          ),
                        ),
                        Positioned(
                          bottom: 0, right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(color: const Color(0xFF101722), width: 2), // background-dark
                            ),
                            child: Text('LVL 12', style: AppTextStyles.labelSmall.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Athlete', style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.w900, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text('Ranked #42 in Local Region', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 32),

                  // Progress Bar Card
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B).withOpacity(0.5), // slate-800/50
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: const Color(0xFF1E293B)), // slate-800
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('LEVEL PROGRESS', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600, letterSpacing: 1.0, fontSize: 10)),
                                const SizedBox(height: 4),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: '7,550 ', style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                                      TextSpan(text: '/ 10,000 XP', style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF64748B))), // slate-500
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text('2,450 XP to Level 13', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500, fontSize: 10)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 12,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF334155), // slate-700
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.755,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            '"The pain you feel today is the strength you feel tomorrow."',
                            style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Recent Achievements
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Achievements', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                      Text('View All', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBadge(
                        icon: Icons.local_fire_department,
                        color: const Color(0xFF22C55E), // green-500
                        title: '7 Day Streak',
                        subtitle: 'Consistency King',
                      ),
                      _buildBadge(
                        icon: Icons.fitness_center,
                        color: AppColors.primary,
                        title: '30 Workouts',
                        subtitle: 'Force of Nature',
                      ),
                      _buildBadge(
                        icon: Icons.rocket_launch,
                        color: const Color(0xFFF97316), // orange-500
                        title: 'Genesis',
                        subtitle: 'First Workout',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Locked Challenges
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Locked Challenges', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 24),
                  _buildLockedChallenge(
                    title: 'Iron Marathon',
                    xp: '500 XP',
                    desc: 'Complete 100 workouts total',
                    progress: 0.3,
                  ),
                  const SizedBox(height: 16),
                  _buildLockedChallenge(
                    title: 'Sunrise Warrior',
                    xp: '250 XP',
                    desc: '10 workouts before 7:00 AM',
                    progress: 0.6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF101722), // background-dark
          border: Border(top: BorderSide(color: Color(0xFF1E293B))), // slate-800
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.home, label: 'Home', isSelected: false),
            _buildNavItem(icon: Icons.fitness_center, label: 'Workouts', isSelected: false),
            _buildNavItem(icon: Icons.monitoring, label: 'Progress', isSelected: false),
            _buildNavItem(icon: Icons.emoji_events, label: 'Awards', isSelected: true),
            _buildNavItem(icon: Icons.person, label: 'Profile', isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge({required IconData icon, required Color color, required String title, required String subtitle}) {
    return Column(
      children: [
        Container(
          width: 80, height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(color: color.withOpacity(0.3)),
            boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 15)],
          ),
          child: Icon(icon, color: color, size: 40),
        ),
        const SizedBox(height: 12),
        Text(title, style: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
        const SizedBox(height: 4),
        Text(subtitle, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontSize: 8)),
      ],
    );
  }

  Widget _buildLockedChallenge({required String title, required String xp, required String desc, required double progress}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.3), // slate-800/30
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFF1E293B)), // slate-800
      ),
      child: Opacity(
        opacity: 0.6,
        child: Row(
          children: [
            Container(
              width: 56, height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF334155), // slate-700
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Icon(Icons.lock, color: Color(0xFF94A3B8)), // slate-400
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF334155), // slate-700
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(xp, style: AppTextStyles.labelSmall.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(desc, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontSize: 10)),
                  const SizedBox(height: 8),
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF334155), // slate-700
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF94A3B8), // slate-400
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isSelected ? AppColors.primary : const Color(0xFF94A3B8), size: 24), // slate-400
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            color: isSelected ? AppColors.primary : const Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
