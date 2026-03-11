import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AvatarGenerationScreen extends StatefulWidget {
  const AvatarGenerationScreen({super.key});

  @override
  State<AvatarGenerationScreen> createState() => _AvatarGenerationScreenState();
}

class _AvatarGenerationScreenState extends State<AvatarGenerationScreen> {
  String _selectedGender = 'Male';
  int _selectedSkinToneIndex = 0;
  double _shoulderWidth = 50.0;
  double _muscleDef = 75.0;
  double _waistRatio = 30.0;

  final List<Color> _skinTones = [
    const Color(0xFFFDF5E2),
    const Color(0xFFF6DABB),
    const Color(0xFFE3BBA1),
    const Color(0xFF9C7255),
    const Color(0xFF624131),
    const Color(0xFF2A1D17),
  ];

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
        title: Text('FitMorph', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0), // Padding for bottom button
        child: Column(
          children: [
            // Header Text
            Text(
              'Your digital fitness twin',
              style: AppTextStyles.headlineMedium.copyWith(
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [AppColors.primary, Color(0xFF60A5FA)], // blue-400
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text('Personalize your 3D avatar to match your physique', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted)),
            const SizedBox(height: 24),

            // Avatar Display Area
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 1.25, // roughly aspect 3/4
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF1E293B), Color(0xFF0F172A)], // slate-800 to slate-900
                ),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: -5,
                  )
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/Avatar Generation - 6af9fa200f744606873993cf1752441e.png',
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    bottom: 16,
                    child: Row(
                      children: [
                        _buildImageButton(Icons.refresh),
                        const SizedBox(width: 8),
                        _buildImageButton(Icons.zoom_in),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Controls
            // Gender Identity
            _buildSectionLabel('GENDER IDENTITY'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B).withOpacity(0.5), // slate-800/50
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Expanded(child: _buildGenderOption('Male')),
                  Expanded(child: _buildGenderOption('Female')),
                  Expanded(child: _buildGenderOption('Neutral')),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Skin Tone
            _buildSectionLabel('SKIN TONE'),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_skinTones.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedSkinToneIndex = index),
                      child: Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: _skinTones[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _selectedSkinToneIndex == index ? AppColors.primary : Colors.transparent,
                            width: 2,
                          ),
                          boxShadow: _selectedSkinToneIndex == index
                              ? [BoxShadow(color: AppColors.primary.withOpacity(0.5), blurRadius: 8, spreadRadius: 2)]
                              : null,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),

            // Body Dimensions
            _buildSectionLabel('BODY DIMENSIONS'),
            const SizedBox(height: 8),
            _buildSlider(label: 'Shoulder Width', valueLabel: 'Medium', value: _shoulderWidth, onChanged: (v) => setState(() => _shoulderWidth = v)),
            const SizedBox(height: 16),
            _buildSlider(label: 'Muscle Definition', valueLabel: 'High', value: _muscleDef, onChanged: (v) => setState(() => _muscleDef = v)),
            const SizedBox(height: 16),
            _buildSlider(label: 'Waist Ratio', valueLabel: 'Athletic', value: _waistRatio, onChanged: (v) => setState(() => _waistRatio = v)),
          ],
        ),
      ),
      
      // Bottom Button
      bottomSheet: Container(
        color: const Color(0xFF101722), // seamless background
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 8,
              shadowColor: AppColors.primary.withOpacity(0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create My Avatar', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                const Icon(Icons.auto_awesome),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Icon(icon, color: AppColors.primary, size: 20),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
    );
  }

  Widget _buildGenderOption(String label) {
    final isSelected = _selectedGender == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedGender = label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.textMuted,
          ),
        ),
      ),
    );
  }

  Widget _buildSlider({required String label, required String valueLabel, required double value, required Function(double) onChanged}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.labelSmall.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
            Text(valueLabel, style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500)),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary.withOpacity(0.2),
            inactiveTrackColor: AppColors.primary.withOpacity(0.2),
            trackHeight: 6.0,
            thumbColor: AppColors.primary,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 9.0),
            overlayColor: AppColors.primary.withOpacity(0.2),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
          ),
          child: Slider(
            value: value,
            min: 0,
            max: 100,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

