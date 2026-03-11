import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
        title: Text('Settings', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          children: [
            // Profile Hero
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 96, height: 96,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withOpacity(0.2),
                            border: Border.all(color: AppColors.primary, width: 2),
                          ),
                          child: const CircleAvatar(
                            radius: 44,
                            backgroundImage: AssetImage('assets/images/Settings - 1f25e372ca054f558bedbaa8eca118a2.png'), // Placeholder
                            backgroundColor: Color(0xFF1E293B), // slate-800
                          ),
                        ),
                        Positioned(
                          bottom: 0, right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFF101722), width: 2), // background-dark
                            ),
                            child: const Icon(Icons.edit, color: Colors.white, size: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Alex Johnson', style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text('PREMIUM MEMBER', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                ],
              ),
            ),

            // Settings Groups
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Account Configuration'),
                  _buildSettingsTile(
                    icon: Icons.person,
                    title: 'Edit Profile',
                    subtitle: 'Name, email, and bio',
                  ),
                  const SizedBox(height: 4),
                  _buildSettingsTile(
                    icon: Icons.language,
                    title: 'Language',
                    subtitle: 'English (US)',
                  ),

                  _buildSectionHeader('Preferences'),
                  _buildSettingsTile(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    subtitle: 'Workout alerts and news',
                  ),
                  const SizedBox(height: 4),
                  _buildSettingsTile(
                    icon: Icons.lock,
                    title: 'Privacy & Security',
                    subtitle: 'Visibility and data sharing',
                  ),

                  _buildSectionHeader('Billing'),
                  _buildSettingsTile(
                    icon: Icons.card_membership,
                    title: 'Subscription Management',
                    subtitle: 'Next billing: Oct 12, 2023',
                  ),

                  const SizedBox(height: 32),
                  // Logout
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF4444).withOpacity(0.1), // red-500/10
                      foregroundColor: const Color(0xFFEF4444),
                      elevation: 0,
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, size: 20),
                        const SizedBox(width: 8),
                        Text('Logout', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFFEF4444))),
                      ],
                    ),
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
            _buildNavItem(icon: Icons.show_chart, label: 'Stats', isSelected: false),
            _buildNavItem(icon: Icons.settings, label: 'Settings', isSelected: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 24.0),
      child: Text(
        title.toUpperCase(),
        style: AppTextStyles.labelSmall.copyWith(
          color: const Color(0xFF64748B), // slate-500
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildSettingsTile({required IconData icon, required String title, required String subtitle}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withOpacity(0.5), // slate-800/50
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.titleSmall.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)), // slate-400
            ],
          ),
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
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

