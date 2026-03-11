import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class WorkoutSessionV2Screen extends StatelessWidget {
  const WorkoutSessionV2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101722), // background-dark
      body: SafeArea(
        child: Column(
          children: [
            // Top Progress Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('WORKOUT PROGRESS', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600, letterSpacing: 1.0, fontSize: 10)),
                      Text('8 / 12 Exercises', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500, fontSize: 10)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B), // slate-800
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.66,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFFCBD5E1)), // slate-300
                    onPressed: () => context.pop(),
                    style: IconButton.styleFrom(backgroundColor: const Color(0xFF1E293B)),
                  ),
                  Column(
                    children: [
                      Text('Barbell Bench Press', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                      Row(
                        children: [
                          Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle)), // emerald-500
                          const SizedBox(width: 4),
                          Text('ACTIVE SESSION', style: AppTextStyles.labelSmall.copyWith(color: const Color(0xFF94A3B8), fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5)), // slate-400
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Color(0xFFCBD5E1)),
                    onPressed: () {},
                    style: IconButton.styleFrom(backgroundColor: const Color(0xFF1E293B)),
                  ),
                ],
              ),
            ),

            // Main Content Area
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    // Media Player placeholder
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B), // slate-800
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: const Color(0xFF334155)), // slate-700
                        image: const DecorationImage(
                          image: AssetImage('assets/images/Workout Session V2 - 576cc72b81ad4cb48887c8955cfed8c6.png'), // Placeholder
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          Positioned(
                            bottom: 12, right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text('HD DEMO', style: AppTextStyles.labelSmall.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: -0.5)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Stats Grid
                    Row(
                      children: [
                        Expanded(child: _buildStatCard(icon: Icons.timer, label: 'Rest', value: '00:45')),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.fitness_center,
                            label: 'Volume',
                            valueWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('2,450', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                                const SizedBox(width: 4),
                                Text('lbs', style: AppTextStyles.labelSmall.copyWith(color: Colors.white, fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.checklist,
                            label: 'Set',
                            valueWidget: Text('3 / 4', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Tracking card
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A).withOpacity(0.5), // slate-900/50
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: const Color(0xFF1E293B)), // slate-800
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: _buildTrackingAdjuster(label: 'WEIGHT (LBS)', value: '185')),
                              const SizedBox(width: 24),
                              Expanded(child: _buildTrackingAdjuster(label: 'REPS', value: '10')),
                            ],
                          ),
                          const SizedBox(height: 24),
                          
                          // Actions
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 56),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                              elevation: 8,
                              shadowColor: AppColors.primary.withOpacity(0.4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle),
                                const SizedBox(width: 8),
                                Text('Complete Set', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1E293B), // slate-800
                                    foregroundColor: const Color(0xFFCBD5E1), // slate-300
                                    minimumSize: const Size(double.infinity, 48),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                  ),
                                  child: Text('Skip Set', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1E293B), // slate-800
                                    foregroundColor: const Color(0xFFCBD5E1), // slate-300
                                    minimumSize: const Size(double.infinity, 48),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                  ),
                                  child: Text('Drop Set', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600)),
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
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF101722), // background-dark
          border: Border(top: BorderSide(color: Color(0xFF1E293B))), // slate-800
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(icon: Icons.fitness_center, isSelected: true),
            _buildNavItem(icon: Icons.monitoring, isSelected: false),
            _buildNavItem(icon: Icons.group, isSelected: false),
            _buildNavItem(icon: Icons.person, isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({required IconData icon, required String label, String? value, Widget? valueWidget}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xFF1E293B)), // slate-800
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500, fontSize: 12)),
          const SizedBox(height: 2),
          if (value != null)
            Text(value, style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white))
          else if (valueWidget != null)
            valueWidget,
        ],
      ),
    );
  }

  Widget _buildTrackingAdjuster({required String label, required String value}) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.0)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B), // slate-800
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: const Color(0xFF334155)), // slate-700
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAdjusterButton(icon: Icons.remove),
              Text(value, style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
              _buildAdjusterButton(icon: Icons.add),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdjusterButton({required IconData icon}) {
    return Container(
      width: 40, height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent, // Uses hover bg normally, we will just set transparent
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Icon(icon, color: AppColors.primary),
    );
  }

  Widget _buildNavItem({required IconData icon, required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isSelected ? AppColors.primary : const Color(0xFF94A3B8), size: 28), // slate-400
      ],
    );
  }
}
