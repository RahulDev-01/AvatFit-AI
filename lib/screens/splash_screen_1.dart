import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    _progressAnimation = Tween<double>(begin: 0.0, end: 0.78).animate(
      CurvedAnimation(
        parent: _progressController,
        curve: Curves.easeOutCubic,
      ),
    );

    _progressController.forward().then((_) {
      // Navigate to the next screen after the animation
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          // Navigate to next splash screen
          context.go(AppRoutes.splash2);
        }
      });
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient Mesh
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.6, -0.4),
                  radius: 0.5,
                  colors: [
                    Color(0x263C83F6), // primary/15 
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.6, 0.4),
                  radius: 0.5,
                  colors: [
                    Color(0x194ADE80), // accent-green/10
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          // Decorative Corner Gradients
          Positioned(
            top: -96,
            left: -96,
            child: Container(
              width: 256,
              height: 256,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.1),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 100,
                    spreadRadius: 50,
                  )
                ]
              ),
            ),
          ),
          Positioned(
            bottom: -96,
            right: -96,
            child: Container(
              width: 256,
              height: 256,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accentGreen.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentGreen.withOpacity(0.05),
                    blurRadius: 100,
                    spreadRadius: 50,
                  )
                ]
              ),
            ),
          ),
          
          // Main Content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 40),
                    
                    // Branding & Avatar
                    Column(
                      children: [
                        // Avatar Silhouette
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary.withOpacity(0.1),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.2),
                                    blurRadius: 60,
                                    spreadRadius: 20,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF0F172A).withOpacity(0.4),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.3),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.fitness_center,
                                  size: 100,
                                  color: AppColors.primary.withOpacity(0.8),
                                  shadows: [
                                    Shadow(
                                      color: AppColors.primary.withOpacity(0.8),
                                      blurRadius: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 48),
                        
                        // Logo
                        RichText(
                          text: TextSpan(
                            style: AppTextStyles.headlineLarge.copyWith(
                              fontSize: 48,
                              letterSpacing: -1.5,
                            ),
                            children: const [
                              TextSpan(text: 'AvatFit '),
                              TextSpan(
                                text: 'AI',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Tagline
                        Text(
                          'Transform Your Body,\nOne Workout at a Time',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    
                    // Progress Indicator
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'INITIALIZING ENGINE',
                                style: AppTextStyles.labelSmall.copyWith(
                                  letterSpacing: 1.5,
                                ),
                              ),
                              AnimatedBuilder(
                                animation: _progressAnimation,
                                builder: (context, child) {
                                  return Text(
                                    '${(_progressAnimation.value * 100).toInt()}%',
                                    style: AppTextStyles.labelLarge.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 8,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B), // slate-800
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: AnimatedBuilder(
                            animation: _progressAnimation,
                            builder: (context, child) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: FractionallySizedBox(
                                  widthFactor: _progressAnimation.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [AppColors.primary, AppColors.accentGreen],
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primary.withOpacity(0.5),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildDot(0.4),
                            const SizedBox(width: 8),
                            _buildDot(0.6),
                            const SizedBox(width: 8),
                            _buildDot(1.0),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(double opacity) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}


