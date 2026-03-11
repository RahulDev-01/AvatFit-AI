import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class WorkoutHistoryScreen extends StatelessWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101722), // background-dark

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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
            style: IconButton.styleFrom(backgroundColor: const Color(0xFF1E293B)), // slate-800
          ),
        ),
        title: Text('Workout History', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.calendar_month, color: Colors.white),
              onPressed: () {},
              style: IconButton.styleFrom(backgroundColor: const Color(0xFF1E293B)), // hover/bg slate-800
            ),
          ),
        ],
      ),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            _FilterChips(),
            _WeeklySummaryCard(),
            _TimelineSection(),
            SizedBox(height: 100), // padding for bottom nav
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF101722).withOpacity(0.95), // background-dark
          border: const Border(top: BorderSide(color: Color(0xFF1E293B))), // slate-800
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BottomNavItem(icon: Icons.home, label: 'Home', isSelected: false),
                _BottomNavItem(icon: Icons.history, label: 'History', isSelected: true),
                _BottomNavItem(icon: Icons.fitness_center, label: 'Workouts', isSelected: false),
                _BottomNavItem(icon: Icons.person, label: 'Profile', isSelected: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          _buildChip('All Activities', true, Icons.keyboard_arrow_down, false),
          const SizedBox(width: 12),
          _buildChip('Last 7 Days', false, Icons.expand_more, true),
          const SizedBox(width: 12),
          _buildChip('Last 30 Days', false, Icons.expand_more, true),
        ],
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected, IconData endIcon, bool showIcon) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : const Color(0xFF1E293B), // slate-800
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.labelLarge.copyWith(
              color: isSelected ? Colors.white : const Color(0xFFCBD5E1), // slate-300
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          if (showIcon) ...[
            const SizedBox(width: 4),
            Icon(endIcon, color: const Color(0xFFCBD5E1), size: 16),
          ],
        ],
      ),
    );
  }
}

class _WeeklySummaryCard extends StatelessWidget {
  const _WeeklySummaryCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -24, right: -24,
                  child: Container(
                    width: 128, height: 128,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 40, spreadRadius: 10)],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('WEEKLY SUMMARY', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, letterSpacing: 1.0, fontSize: 10)),
                    const SizedBox(height: 4),
                    Text('1,240 kcal', style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 8),
                    Text("You're 15% more active than last week. Keep it up!", style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted)),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                          elevation: 8,
                          shadowColor: AppColors.primary.withOpacity(0.3),
                        ),
                        child: Text('View Insights', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TimelineSection extends StatelessWidget {
  const _TimelineSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        children: [
          // Timeline Line
          Positioned(
            left: 20, top: 16, bottom: 16,
            child: Container(
              width: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primary, AppColors.primary.withOpacity(0.1)],
                ),
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          
          Column(
            children: [
              _buildTimelineEntry(
                icon: Icons.bolt,
                iconColor: Colors.white,
                iconBgColor: AppColors.primary,
                hasGlow: true,
                title: 'Full Body Power',
                tagText: 'Strength',
                tagColor: AppColors.primary,
                date: 'June 12, 2024',
                duration: '45m',
                calories: '320 kcal',
              ),
              const SizedBox(height: 24),
              _buildTimelineEntry(
                icon: Icons.light_mode,
                iconColor: AppColors.primary,
                iconBgColor: const Color(0xFF1E293B), // slate-800
                hasGlow: false,
                title: 'Morning Yoga Flow',
                tagText: 'Mobility',
                tagColor: const Color(0xFF34D399), // emerald-400
                date: 'June 10, 2024',
                duration: '30m',
                calories: '150 kcal',
              ),
              const SizedBox(height: 24),
              _buildTimelineEntry(
                icon: Icons.fitness_center,
                iconColor: AppColors.primary,
                iconBgColor: const Color(0xFF1E293B), // slate-800
                hasGlow: false,
                title: 'HIIT Cardio Blast',
                tagText: 'Cardio',
                tagColor: const Color(0xFFFB923C), // orange-400
                date: 'June 08, 2024',
                duration: '25m',
                calories: '410 kcal',
              ),
              const SizedBox(height: 24),
              _buildTimelineEmptyState(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineEntry({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required bool hasGlow,
    required String title,
    required String tagText,
    required Color tagColor,
    required String date,
    required String duration,
    required String calories,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          width: 40, height: 40,
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
            border: hasGlow ? null : Border.all(color: AppColors.primary.withOpacity(0.3)),
            boxShadow: hasGlow ? [BoxShadow(color: AppColors.primary.withOpacity(0.5), blurRadius: 15)] : null,
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        
        // Card
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(title, style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white, height: 1.2)),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: tagColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(tagText.toUpperCase(), style: AppTextStyles.labelSmall.copyWith(color: tagColor, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.0)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(date, style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule, color: AppColors.primary, size: 14),
                            const SizedBox(width: 4),
                            Text(duration, style: AppTextStyles.labelMedium.copyWith(color: const Color(0xFFCBD5E1), fontWeight: FontWeight.w500)), // slate-300
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            const Icon(Icons.local_fire_department, color: AppColors.primary, size: 14),
                            const SizedBox(width: 4),
                            Text(calories, style: AppTextStyles.labelMedium.copyWith(color: const Color(0xFFCBD5E1), fontWeight: FontWeight.w500)), // slate-300
                          ],
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
    );
  }

  Widget _buildTimelineEmptyState() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon
        Container(
          width: 40, height: 40,
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B), // slate-800
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF334155)), // slate-700
          ),
          child: const Icon(Icons.history, color: Color(0xFF64748B), size: 20), // slate-500
        ),
        
        // Card
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.01),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.white.withOpacity(0.05), style: BorderStyle.solid), // dashed isn't native, closest approximation
                ),
                child: Text('View older activities', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF64748B))), // slate-500
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _BottomNavItem({required this.icon, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
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
