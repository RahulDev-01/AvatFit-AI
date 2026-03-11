import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text('Notifications', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: _buildTabs(),
        ),
      ),

      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(title: 'TODAY'),
            SizedBox(height: 12),
            _NotificationItem(
              icon: Icons.schedule,
              iconColor: AppColors.primary,
              title: 'Workout starts in 20 minutes',
              subtitle: 'Time to get ready for your Upper Body HIIT session. Your equipment is ready!',
            ),
            SizedBox(height: 12),
            _NotificationItem(
              icon: Icons.workspace_premium,
              iconColor: Color(0xFFF59E0B), // amber-500
              title: 'New achievement unlocked',
              subtitle: '"Early Bird": You\'ve completed 5 workouts before 7 AM this week!',
            ),

            SizedBox(height: 32),
            _SectionTitle(title: 'YESTERDAY'),
            SizedBox(height: 12),
            _NotificationItem(
              icon: Icons.person_add,
              iconColor: Color(0xFF10B981), // emerald-500
              title: 'Sarah followed you',
              subtitle: 'Connect with friends to stay motivated and share progress.',
              actionButtonText: 'Follow',
              isDimmed: true,
            ),
            SizedBox(height: 12),
            _NotificationItem(
              icon: Icons.favorite,
              iconColor: Color(0xFFF43F5E), // rose-500
              title: 'Workout liked',
              subtitle: 'Coach Mike liked your "Leg Day Destroyer" session. Great job!',
              isDimmed: true,
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
            _buildNavItem(icon: Icons.insights, label: 'Stats', isSelected: false),
            _buildNavItem(icon: Icons.notifications, label: 'Alerts', isSelected: true),
            _buildNavItem(icon: Icons.account_circle, label: 'Profile', isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildTab(label: 'All', isSelected: true),
          const SizedBox(width: 32),
          _buildTab(label: 'Workouts', isSelected: false),
          const SizedBox(width: 32),
          _buildTab(label: 'Social', isSelected: false),
        ],
      ),
    );
  }

  Widget _buildTab({required String label, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelMedium.copyWith(
          color: isSelected ? AppColors.primary : const Color(0xFF64748B), // slate-500
          fontWeight: FontWeight.bold,
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
          label.toUpperCase(),
          style: AppTextStyles.labelSmall.copyWith(
            color: isSelected ? AppColors.primary : const Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
            fontSize: 10,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.labelSmall.copyWith(
        color: const Color(0xFF64748B), // slate-500
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String? actionButtonText;
  final bool isDimmed;

  const _NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.actionButtonText,
    this.isDimmed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDimmed ? 0.8 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B).withOpacity(0.5), // slate-800/50
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: const Color(0xFF1E293B)), // slate-800
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48, height: 48,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted, height: 1.4)),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Align(
              alignment: Alignment.center,
              child: actionButtonText != null
                  ? ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(actionButtonText!, style: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.bold)),
                    )
                  : const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)), // slate-400
            ),
          ],
        ),
      ),
    );
  }
}

