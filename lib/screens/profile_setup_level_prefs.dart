import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ProfileSetupLevelPrefsScreen extends StatefulWidget {
  const ProfileSetupLevelPrefsScreen({super.key});

  @override
  State<ProfileSetupLevelPrefsScreen> createState() => _ProfileSetupLevelPrefsScreenState();
}

class _ProfileSetupLevelPrefsScreenState extends State<ProfileSetupLevelPrefsScreen> {
  int _selectedLevel = 1; // 0: Beginner, 1: Intermediate, 2: Advanced
  int _selectedTrainEnvironment = 1; // 0: Gym, 1: Home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      shape: BoxShape.circle,
                    ),
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
                    'Profile Setup',
                    style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 40), // spacer for right alignment
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress Indicator
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fitness Experience',
                                style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '4 of 5',
                                style: AppTextStyles.labelLarge.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 10,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E293B), // slate-800
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.8,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Section Title 1
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What's your fitness level?",
                            style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "This helps us calibrate your initial workout intensity and volume.",
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ),

                    // Level Selection Cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          _buildLevelCard(
                            index: 0,
                            icon: Icons.child_care,
                            title: 'Beginner',
                            desc: 'New to fitness or returning after a 6+ month break.',
                            imagePath: 'assets/images/Profile Setup Level Prefs_beginner.png', 
                          ),
                          const SizedBox(height: 16),
                          _buildLevelCard(
                            index: 1,
                            icon: Icons.fitness_center,
                            title: 'Intermediate',
                            desc: 'Active 2-3 times a week. Familiar with core movements.',
                            imagePath: 'assets/images/Profile Setup Level Prefs_intermediate.png',
                            isRecommended: true,
                          ),
                          const SizedBox(height: 16),
                          _buildLevelCard(
                            index: 2,
                            icon: Icons.bolt,
                            title: 'Advanced',
                            desc: 'Training 5+ times a week. Seeking elite performance & peak form.',
                            imagePath: 'assets/images/Profile Setup Level Prefs_advanced.png',
                          ),
                        ],
                      ),
                    ),

                    // Section Title 2
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Where do you train?",
                            style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "We'll filter exercises based on available equipment.",
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ),

                    // Environment Selection
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildEnvCard(
                              index: 0,
                              icon: Icons.apartment,
                              title: 'Gym',
                              desc: 'Full Equipment',
                              imagePath: 'assets/images/Profile Setup Level Prefs_gym.png',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildEnvCard(
                              index: 1,
                              icon: Icons.home,
                              title: 'Home',
                              desc: 'Limited Gear',
                              imagePath: 'assets/images/Profile Setup Level Prefs_home.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Footer / Action
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.go(AppRoutes.profileSetupBodyGoals);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 8,
                      shadowColor: AppColors.primary.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Continue', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Step 4 of 5 • Almost finished',
                    style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelCard({
    required int index,
    required IconData icon,
    required String title,
    required String desc,
    required String imagePath,
    bool isRecommended = false,
  }) {
    final bool isSelected = _selectedLevel == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLevel = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A), // slate-900
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
          boxShadow: isSelected ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10)] : [],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(icon, color: AppColors.primary, size: 24),
                              const SizedBox(width: 8),
                              Text(title, style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            desc,
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Image Placeholder
                    Container(
                      width: 96, height: 96,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Profile Setup Level Prefs - 247422f90e2d4699be587dbef5218d37.png'), // fallback placeholder
                          fit: BoxFit.cover,
                          colorFilter: isSelected ? null : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : const Color(0xFF1E293B), // slate-800
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      isSelected ? 'Current Choice' : 'Select',
                      style: AppTextStyles.titleSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isRecommended)
              Positioned(
                top: -16, right: -16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(16)
                    ),
                  ),
                  child: Text(
                    'RECOMMENDED',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnvCard({
    required int index,
    required IconData icon,
    required String title,
    required String desc,
    required String imagePath,
  }) {
    final bool isSelected = _selectedTrainEnvironment == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTrainEnvironment = index;
        });
      },
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
            color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
          ),
          child: Stack(
            children: [
              // Background Image and Gradient
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Profile Setup Level Prefs - 247422f90e2d4699be587dbef5218d37.png'), // fallback placeholder
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              isSelected ? AppColors.primary.withOpacity(0.8) : Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Text Content
              Positioned(
                bottom: 16, left: 16, right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, color: Colors.white, size: 28),
                    const SizedBox(height: 4),
                    Text(title, style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(desc, style: AppTextStyles.labelSmall.copyWith(color: Colors.white.withOpacity(0.7))),
                  ],
                ),
              ),

              // Selected Icon
              if (isSelected)
                Positioned(
                  top: 12, right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: AppColors.primary, size: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


