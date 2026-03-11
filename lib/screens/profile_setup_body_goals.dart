import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ProfileSetupBodyGoalsScreen extends StatefulWidget {
  const ProfileSetupBodyGoalsScreen({super.key});

  @override
  State<ProfileSetupBodyGoalsScreen> createState() => _ProfileSetupBodyGoalsScreenState();
}

class _ProfileSetupBodyGoalsScreenState extends State<ProfileSetupBodyGoalsScreen> {
  double _height = 175;
  double _weight = 72;
  int _selectedGoal = 0; // 0: Lose Weight, 1: Build Muscle, 2: Stay Fit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40, height: 40,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            if (context.canPop()) {
                              context.pop();
                            }
                          },
                        ),
                      ),
                      Text(
                        'STEP 2 OF 3',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(width: 40), // Balance
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Physical Details', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        '66%',
                        style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B), // slate-800
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.66,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Physical Details Sliders
                      const SizedBox(height: 8),
                      Text('What\'s your current stats?', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 24),

                      // Height Card
                      _buildSliderCard(
                        label: 'Height',
                        value: _height,
                        unit: 'cm',
                        min: 100,
                        max: 250,
                        onChanged: (val) {
                          setState(() {
                            _height = val;
                          });
                        },
                      ),
                      const SizedBox(height: 24),

                      // Weight Card
                      _buildSliderCard(
                        label: 'Weight',
                        value: _weight,
                        unit: 'kg',
                        min: 30,
                        max: 200,
                        onChanged: (val) {
                          setState(() {
                            _weight = val;
                          });
                        },
                      ),

                      // Fitness Goals Section
                      const SizedBox(height: 32),
                      Text('Fitness Goals', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Text('Choose the primary objective for your journey.', style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted)),
                      const SizedBox(height: 16),

                      // Goal Options
                      _buildGoalCard(
                        index: 0,
                        icon: Icons.fitness_center,
                        title: 'Lose Weight',
                        desc: 'Burn fat and get leaner',
                      ),
                      const SizedBox(height: 16),
                      _buildGoalCard(
                        index: 1,
                        icon: Icons.sync, // using sync as exercise alternative
                        title: 'Build Muscle',
                        desc: 'Gain strength and mass',
                      ),
                      const SizedBox(height: 16),
                      _buildGoalCard(
                        index: 2,
                        icon: Icons.monitor_heart,
                        title: 'Stay Fit',
                        desc: 'Maintain health and energy',
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),

            // Fixed Footer
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(top: BorderSide(color: Color(0xFF1E293B))), // slate-800
              ),
              child: ElevatedButton(
                onPressed: () {
                  // context.go(AppRoutes.dashboard);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 8,
                  shadowColor: AppColors.primary.withOpacity(0.3),
                ),
                child: Text('Complete Profile', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderCard({
    required String label,
    required double value,
    required String unit,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withOpacity(0.5), // slate-900/50
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xFF1E293B)), // slate-800
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    value.toStringAsFixed(0),
                    style: AppTextStyles.headlineMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  Text(unit, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: const Color(0xFF1E293B), // slate-800
              trackHeight: 6.0,
              thumbColor: Colors.white,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
              overlayColor: AppColors.primary.withOpacity(0.2),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
            ),
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalCard({
    required int index,
    required IconData icon,
    required String title,
    required String desc,
  }) {
    final bool isSelected = _selectedGoal == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGoal = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.05) : const Color(0xFF0F172A).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48, height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(desc, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted)),
                ],
              ),
            ),
            Container(
              width: 20, height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : const Color(0xFF334155), // slate-700
                  width: 2.0,
                ),
              ),
              child: Center(
                child: isSelected
                  ? Container(
                      width: 10, height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    )
                  : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
