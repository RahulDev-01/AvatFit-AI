import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class DashboardV2Screen extends StatelessWidget {
  const DashboardV2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color accentGreen = Color(0xFF22C55E);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0F16), // background-dark from HTML
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Top Navigation / Greeting
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 48, height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.primary, width: 2),
                                ),
                                padding: const EdgeInsets.all(2.0),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/Dashboard V2 - 1b7053a25fe84d6cbf7ca05696df081b.png', // Placeholder
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0, right: 0,
                                child: Container(
                                  width: 12, height: 12,
                                  decoration: BoxDecoration(
                                    color: accentGreen,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color(0xFF0A0F16), width: 2),
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
                                style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w600, letterSpacing: 1.0, fontSize: 10),
                              ),
                              Text('Good Morning, Rahul', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.white.withOpacity(0.08)),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.notifications, color: Color(0xFFCBD5E1)), // slate-300
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                // Stats Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.local_fire_department,
                          iconColor: AppColors.primary,
                          label: 'CALORIES',
                          value: '850',
                          badgeText: '+15%',
                          borderColor: AppColors.primary.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.bolt,
                          iconColor: accentGreen,
                          label: 'STREAK',
                          value: '12 Days',
                          badgeText: '+2',
                          borderColor: accentGreen.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.directions_walk,
                          iconColor: AppColors.primary,
                          label: 'STEPS',
                          value: '8,432',
                          badgeText: '+8%',
                          borderColor: AppColors.primary.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),

                // Central Interactive Avatar Section
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background gradient
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primary.withOpacity(0.05),
                              Colors.transparent,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      // Muscle Focus Labels
                      Positioned(
                        top: 20, left: 40,
                        child: _buildFocusLabel('Chest: Rested', accentGreen),
                      ),
                      Positioned(
                        top: 100, right: 30,
                        child: _buildFocusLabel('Back: High Fatigue', AppColors.primary),
                      ),

                      // Avatar Area
                      Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              AppColors.primary.withOpacity(0.15),
                              Colors.transparent,
                            ],
                            radius: 0.7,
                          ),
                        ),
                        child: Center(
                          child: Opacity(
                            opacity: 0.8,
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.matrix([
                                -1, 0, 0, 0, 255, // Invert red
                                0, -1, 0, 0, 255, // Invert green
                                0, 0, -1, 0, 255, // Invert blue
                                0, 0, 0, 1, 0,
                              ]),
                              // Since we can't easily do grayscale invert brightness 150 accurately with color matrix quickly,
                              // just approximating the look with the placeholder.
                              child: Image.asset(
                                'assets/images/Dashboard V2 - 1b7053a25fe84d6cbf7ca05696df081b.png', // Temporary placeholder
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Highlight pulse
                      Positioned(
                        top: 150, left: MediaQuery.of(context).size.width * 0.55 - 40,
                        child: Container(
                          width: 80, height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.2),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 40, spreadRadius: 10),
                            ]
                          ),
                        ),
                      ),

                      // Body Focus Badge
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(color: Colors.white.withOpacity(0.08)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('FOCUS ZONE:', style: AppTextStyles.labelSmall.copyWith(color: const Color(0xFFCBD5E1), fontWeight: FontWeight.bold, letterSpacing: 1.0, fontSize: 10)),
                              const SizedBox(width: 12),
                              Text('UPPER POSTERIOR', style: AppTextStyles.titleSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900, fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom Protocol Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 100.0), // Padding bottom for nav bar overlap
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: Colors.white.withOpacity(0.08)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('TODAY\'S PROTOCOL', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 10)),
                                const SizedBox(height: 4),
                                Text('Hypertrophy Session', style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text('65 Min', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Row(
                              children: [
                                _buildEquipBadge('DB'),
                                _buildEquipBadge('BB'),
                                _buildEquipBadge('C'),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text('Dumbbells, Barbells, Cable Focus', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted))),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
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
                  ),
                ),
              ],
            ),

            // Navigation Bar
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A0F16).withOpacity(0.8),
                      border: const Border(top: BorderSide(color: Color(0xFF1E293B))), // slate-800
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildNavItem(icon: Icons.grid_view, label: 'Home', isSelected: true),
                        _buildNavItem(icon: Icons.fitness_center, label: 'Plan', isSelected: false),
                        
                        // Center Add Button
                        Transform.translate(
                          offset: const Offset(0, -20),
                          child: Container(
                            width: 56, height: 56,
                            decoration: BoxDecoration(
                              color: accentGreen,
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFF0A0F16), width: 4),
                              boxShadow: [
                                BoxShadow(color: accentGreen.withOpacity(0.4), blurRadius: 15, spreadRadius: 2),
                              ]
                            ),
                            child: const Icon(Icons.add, color: Color(0xFF0A0F16), size: 32),
                          ),
                        ),
                        
                        _buildNavItem(icon: Icons.insights, label: 'Stats', isSelected: false),
                        _buildNavItem(icon: Icons.person, label: 'Profile', isSelected: false),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required String badgeText,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16.0),
        border: Border(bottom: BorderSide(color: borderColor, width: 2.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 8),
          Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontSize: 10, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(badgeText, style: AppTextStyles.labelSmall.copyWith(color: const Color(0xFF22C55E), fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildFocusLabel(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8, height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 10)],
            ),
          ),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildEquipBadge(String text) {
    return Container(
      width: 24, height: 24,
      margin: const EdgeInsets.only(right: 4.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // slate-800
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF0A0F16)),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
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
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

