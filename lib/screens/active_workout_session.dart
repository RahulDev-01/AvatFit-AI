import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ActiveWorkoutSessionScreen extends StatelessWidget {
  const ActiveWorkoutSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101722), // background-dark
      
      // Top Navigation & Progress
      appBar: AppBar(
        backgroundColor: const Color(0xFF101722).withOpacity(0.8),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Color(0xFF94A3B8)), // slate-400
                      onPressed: () => context.pop(),
                      style: IconButton.styleFrom(backgroundColor: const Color(0xFF1E293B)), // hover/bg
                    ),
                    Column(
                      children: [
                        Text('CHEST & TRICEPS DAY', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, letterSpacing: 1.0, fontSize: 10)),
                        Text('Active Session', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Color(0xFF94A3B8)),
                      onPressed: () {},
                      style: IconButton.styleFrom(backgroundColor: const Color(0xFF1E293B)),
                    ),
                  ],
                ),
              ),
              // Progress Bar Component
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Workout Progress', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500)),
                        Text('8 of 12 exercises', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
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
            ],
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: SizedBox(), // Space handled by flexibleSpace
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            // Exercise Info
            Text('Barbell Bench Press', style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text('MAIN LIFT', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 10)),
                ),
                const SizedBox(width: 8),
                Text('Target: Chest, Triceps', style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted)),
              ],
            ),
            const SizedBox(height: 24),

            // Exercise Demo Area
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B), // slate-800
                borderRadius: BorderRadius.circular(16.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Active Workout Session - 5a76003960984a78998055cad4ebc4a0.png'), // Placeholder
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Positioned(
                    bottom: 16, right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.fullscreen, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Timer & Stats
            Row(
              children: [
                Expanded(
                  child: _buildStatBox(
                    label: 'REST TIMER',
                    value: '00:45',
                    valueColor: AppColors.primary,
                    bottomWidget: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.history, color: Color(0xFF94A3B8), size: 14)], // slate-400
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatBox(
                    label: 'VOLUME',
                    value: '2,450',
                    bottomWidget: Text('lbs total', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontSize: 10)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatBox(
                    label: 'SET',
                    valueWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('3', style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('/4', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted)),
                      ],
                    ),
                    bottomWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(true), const SizedBox(width: 4),
                        _buildDot(true), const SizedBox(width: 4),
                        _buildDot(false), const SizedBox(width: 4),
                        _buildDot(false),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Sets Tracker Card
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A), // slate-900
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: const Color(0xFF1E293B)), // slate-800
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Active Set', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                        Row(
                          children: [
                            const Icon(Icons.history, color: AppColors.primary, size: 16),
                            const SizedBox(width: 4),
                            Text('History', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xFF1E293B), height: 1),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildAdjuster(label: 'WEIGHT (LBS)', value: '185'),
                        Container(width: 1, height: 48, color: const Color(0xFF1E293B)),
                        _buildAdjuster(label: 'REPS', value: '10'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Actions
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color(0xFF101722),
          border: Border(top: BorderSide(color: Color(0xFF1E293B))),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
                        backgroundColor: const Color(0xFF1E293B),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.skip_next, size: 18),
                          const SizedBox(width: 8),
                          Text('Skip', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E293B),
                        foregroundColor: Colors.redAccent,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.warning, size: 18),
                          const SizedBox(width: 8),
                          Text('Drop', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold)),
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
    );
  }

  Widget _buildStatBox({
    required String label,
    String? value,
    Widget? valueWidget,
    Color valueColor = Colors.white,
    required Widget bottomWidget,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // slate-900
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFF1E293B)), // slate-800
      ),
      child: Column(
        children: [
          Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 10)),
          const SizedBox(height: 4),
          if (value != null)
            Text(value, style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.bold, color: valueColor))
          else if (valueWidget != null)
            valueWidget,
          const SizedBox(height: 4),
          bottomWidget,
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 6, height: 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : const Color(0xFF334155), // slate-700
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildAdjuster({required String label, required String value}) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 10)),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildRoundButton(Icons.remove),
            const SizedBox(width: 16),
            Text(value, style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(width: 16),
            _buildRoundButton(Icons.add),
          ],
        ),
      ],
    );
  }

  Widget _buildRoundButton(IconData icon) {
    return Container(
      width: 32, height: 32,
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B), // slate-800
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 16),
    );
  }
}

