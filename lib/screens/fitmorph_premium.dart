import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class FitmorphPremiumScreen extends StatefulWidget {
  const FitmorphPremiumScreen({super.key});

  @override
  State<FitmorphPremiumScreen> createState() => _FitmorphPremiumScreenState();
}

class _FitmorphPremiumScreenState extends State<FitmorphPremiumScreen> {
  int _selectedPlanIndex = 0; // 0 for Monthly, 1 for Annual

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101722), // background-dark

      appBar: AppBar(
        backgroundColor: const Color(0xFF101722).withOpacity(0.8),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text('FitMorph Premium', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Restore', style: AppTextStyles.labelMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          children: [
            // Hero Section
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 32.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * (9 / 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B), // slate-800
                      borderRadius: BorderRadius.circular(16.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/FitMorph Premium - 65edde06c93a43f794e31ef68634f2b9.png'), // Placeholder
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
                              colors: [const Color(0xFF101722), Colors.transparent], // dark to trans
                              stops: const [0.0, 0.5],
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        Positioned(
                          bottom: 16, left: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text('PRO ACCESS', style: AppTextStyles.labelSmall.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text('Unlock Your Peak Performance', style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text('Take your training to the next level with advanced AI and 3D insights', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted), textAlign: TextAlign.center),
                ],
              ),
            ),

            // Features List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  _buildFeature(
                    icon: Icons.psychology,
                    title: 'AI-Powered Workout Generator',
                    desc: 'Personalized routines that evolve with you',
                  ),
                  const SizedBox(height: 16),
                  _buildFeature(
                    icon: Icons.monitoring,
                    title: 'Advanced Avatar Analytics',
                    desc: 'Visualize progress through your 3D digital twin',
                  ),
                  const SizedBox(height: 16),
                  _buildFeature(
                    icon: Icons.local_fire_department, // body_fat approximation
                    title: '3D Muscle Fatigue Tracking',
                    desc: 'Prevent injury with precision recovery data',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Pricing Plans
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  _buildPlan(
                    index: 0,
                    title: 'MONTHLY PLAN',
                    price: '\$14.99',
                    period: '/mo',
                  ),
                  const SizedBox(height: 16),
                  _buildPlan(
                    index: 1,
                    title: 'ANNUAL PLAN',
                    price: '\$99.99',
                    period: '/yr',
                    saveText: 'Save 45% (\$8.33/mo)',
                    isBestValue: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // Footer CTA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                      elevation: 8,
                      shadowColor: AppColors.primary.withOpacity(0.4),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, Color(0xFF60A5FA)], // blue-400
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Upgrade to Premium', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                            const SizedBox(width: 8),
                            const Icon(Icons.bolt, color: Colors.white, size: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'By subscribing, you agree to our Terms of Service and Privacy Policy. Subscriptions will automatically renew unless canceled 24 hours before the end of the current period.',
                    style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontSize: 10, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature({required IconData icon, required String title, required String desc}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.03),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.labelLarge.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 2),
                    Text(desc, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlan({
    required int index,
    required String title,
    required String price,
    required String period,
    String? saveText,
    bool isBestValue = false,
  }) {
    final isSelected = _selectedPlanIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedPlanIndex = index),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withOpacity(0.05) : Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: isSelected ? AppColors.primary : const Color(0xFF334155)), // slate-700
            ),
            child: Stack(
              children: [
                if (isBestValue)
                  Positioned(
                    top: -20, right: -20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                      ),
                      child: Text('BEST VALUE', style: AppTextStyles.labelSmall.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.0)),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(price, style: AppTextStyles.headlineSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                            const SizedBox(width: 4),
                            Text(period, style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF64748B))), // slate-500
                          ],
                        ),
                        if (saveText != null) ...[
                          const SizedBox(height: 4),
                          Text(saveText, style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 10)),
                        ],
                      ],
                    ),
                    Container(
                      width: 24, height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: isSelected ? AppColors.primary : const Color(0xFF475569), width: 2), // slate-600
                      ),
                      // Inner circle logic
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 12, height: 12,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : null,
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
