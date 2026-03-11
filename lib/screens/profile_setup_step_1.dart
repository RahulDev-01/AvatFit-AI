import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ProfileSetupStep1Screen extends StatefulWidget {
  const ProfileSetupStep1Screen({super.key});

  @override
  State<ProfileSetupStep1Screen> createState() => _ProfileSetupStep1ScreenState();
}

class _ProfileSetupStep1ScreenState extends State<ProfileSetupStep1Screen> {
  int _selectedGender = 0; // 0: Male, 1: Female, 2: Other

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

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
                    width: 48, height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0), // Setting to transparent but keeping size
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
                  const SizedBox(width: 48), // spacer for right alignment
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
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Personal Details',
                                style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Step 1 of 4',
                                style: AppTextStyles.labelLarge.copyWith(
                                  color: AppColors.textMuted,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 8,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E293B), // slate-800
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.25,
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

                    // Hero Content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tell us about yourself",
                            style: AppTextStyles.headlineLarge.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "This helps us customize your fitness plan and calculate your daily requirements.",
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted, height: 1.5),
                          ),
                        ],
                      ),
                    ),

                    // Form Inputs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name Input
                          _buildTextField(
                            label: 'Full Name',
                            hint: 'Enter your name',
                            icon: Icons.person,
                            controller: _nameController,
                          ),
                          const SizedBox(height: 24),
                          
                          // Age Input
                          _buildTextField(
                            label: 'Age',
                            hint: 'How old are you?',
                            icon: Icons.calendar_today,
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 24),

                          // Gender Selection
                          Text(
                            'Gender',
                            style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: _buildGenderCard(
                                  index: 0,
                                  icon: Icons.male,
                                  label: 'Male',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildGenderCard(
                                  index: 1,
                                  icon: Icons.female,
                                  label: 'Female',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildGenderCard(
                                  index: 2,
                                  icon: Icons.block,
                                  label: 'Other',
                                ),
                              ),
                            ],
                          ),
                          
                          // Image/Decoration Placeholder
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/Profile Setup Step 1 - e054b4d40a3344918b99349661da8e24.png'), // Will need correct asset later
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    AppColors.background,
                                    AppColors.background.withOpacity(0.0),
                                    AppColors.background.withOpacity(0.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Fixed Footer Action
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: () {
                  // context.push(AppRoutes.profileSetupLevelPrefs);
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
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
          child: Text(
            label,
            style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textMuted.withOpacity(0.5)),
            prefixIcon: Icon(icon, color: const Color(0xFF94A3B8)), // slate-400
            filled: true,
            fillColor: const Color(0xFF0F172A).withOpacity(0.5), // slate-900/50
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Color(0xFF1E293B)), // slate-800
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Color(0xFF1E293B)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderCard({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = _selectedGender == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : const Color(0xFF0F172A).withOpacity(0.5), // slate-900/50
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFF1E293B), // slate-800
            width: 2.0,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : const Color(0xFF64748B), // slate-500
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.primary : const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
