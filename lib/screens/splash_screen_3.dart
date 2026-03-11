import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> with SingleTickerProviderStateMixin {
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
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          context.go(AppRoutes.onboarding1);
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
    const dawnDeep = Color(0xFF050214);
    const dawnOrange = Color(0xFFFF6B35);
    const dawnMagenta = Color(0xFFE0115F);
    const warriorGold = Color(0xFFFDBB2D);

    return Scaffold(
      backgroundColor: dawnDeep,
      body: Stack(
        children: [
          // Background Mesh
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.0, 1.0),
                  radius: 0.8,
                  colors: [
                    Color(0x40E0115F), // dawn-magenta/25
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0x1AFF6B35), // dawn-orange/10
                    Colors.transparent,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          
          // Outer Soft Glows
          Positioned(
            top: 0, right: 0,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dawnMagenta.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(color: dawnMagenta.withOpacity(0.05), blurRadius: 120),
                ]
              ),
            ),
          ),
          Positioned(
            bottom: 0, left: 0,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dawnOrange.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(color: dawnOrange.withOpacity(0.05), blurRadius: 120),
                ]
              ),
            ),
          ),
          
          // Sunrise Streaks
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: -MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 2,
            child: Transform.rotate(
              angle: -15 * math.pi / 180,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.transparent, dawnOrange, Colors.transparent],
                    ),
                    boxShadow: [BoxShadow(color: dawnOrange.withOpacity(0.5), blurRadius: 2)],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: -MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 1.5,
            child: Transform.rotate(
              angle: -15 * math.pi / 180,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.transparent, dawnMagenta, Colors.transparent],
                    ),
                    boxShadow: [BoxShadow(color: dawnMagenta.withOpacity(0.5), blurRadius: 2)],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: -MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 2,
            child: Transform.rotate(
              angle: -15 * math.pi / 180,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.transparent, dawnOrange, Colors.transparent],
                    ),
                    boxShadow: [BoxShadow(color: dawnOrange.withOpacity(0.5), blurRadius: 2)],
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 40),
                    
                    // Center Avatar and Text
                    Column(
                      children: [
                        // Avatar area
                        SizedBox(
                          width: 288,
                          height: 288,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // SVG Power Meter background
                              SizedBox(
                                width: 288, height: 288,
                                child: Transform.rotate(
                                  angle: -math.pi / 2, // -90 deg
                                  child: CustomPaint(
                                    painter: PowerMeterPainter(
                                      progress: _progressAnimation.value,
                                      baseColor: Colors.white.withOpacity(0.05),
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Inner Glowing Avatar
                              SizedBox(
                                width: 224, height: 224,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: dawnMagenta.withOpacity(0.2),
                                        boxShadow: [
                                          BoxShadow(color: dawnMagenta.withOpacity(0.2), blurRadius: 60, spreadRadius: 30),
                                        ]
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: dawnOrange.withOpacity(0.1),
                                        boxShadow: [
                                          BoxShadow(color: dawnOrange.withOpacity(0.1), blurRadius: 40, spreadRadius: 10),
                                        ]
                                      ),
                                    ),
                                    
                                    // Main Avatar Icon
                                    Icon(
                                      Icons.sports_martial_arts,
                                      color: Colors.white.withOpacity(0.95),
                                      size: 160,
                                      shadows: [
                                        Shadow(color: warriorGold.withOpacity(0.6), blurRadius: 15),
                                        Shadow(color: dawnMagenta.withOpacity(0.4), blurRadius: 30),
                                      ],
                                    ),
                                    
                                    // Bottom reflection
                                    Positioned(
                                      bottom: 16,
                                      child: Container(
                                        width: 160, height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [dawnOrange.withOpacity(0.3), Colors.transparent],
                                          ),
                                          boxShadow: [
                                            BoxShadow(color: dawnOrange.withOpacity(0.3), blurRadius: 20),
                                          ]
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              // Energy Badge
                              Positioned(
                                bottom: -16,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: dawnDeep.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: dawnOrange.withOpacity(0.3)),
                                  ),
                                  child: AnimatedBuilder(
                                    animation: _progressAnimation,
                                    builder: (context, child) {
                                      return Text(
                                        'ENERGY ${(_progressAnimation.value * 100).toInt()}%',
                                        style: AppTextStyles.labelSmall.copyWith(
                                          color: dawnOrange,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.0,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 64),
                        
                        // Text section
                        RichText(
                          text: TextSpan(
                            style: AppTextStyles.headlineLarge.copyWith(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              letterSpacing: -1.5,
                            ),
                            children: const [
                              TextSpan(text: 'AVATFIT '),
                              TextSpan(
                                text: 'AI',
                                style: TextStyle(color: dawnMagenta),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        Column(
                          children: [
                            Text(
                              'TRANSFORM YOUR BODY',
                              style: AppTextStyles.labelLarge.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 4.0,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32, height: 1,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.transparent, dawnOrange]),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'THE WARRIOR WITHIN',
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: dawnOrange,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  width: 32, height: 1,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [dawnOrange, Colors.transparent]),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    // Bottom Section
                    Column(
                      children: [
                        Text(
                          'AWAITING COMMAND',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 4, height: 4, decoration: BoxDecoration(color: dawnMagenta.withOpacity(0.3), shape: BoxShape.circle)),
                            const SizedBox(width: 12),
                            TweenAnimationBuilder(
                              tween: Tween<double>(begin: 0.4, end: 1.0),
                              duration: const Duration(seconds: 1),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: Container(
                                    width: 4, height: 4,
                                    decoration: const BoxDecoration(color: dawnMagenta, shape: BoxShape.circle),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 12),
                            Container(width: 4, height: 4, decoration: BoxDecoration(color: dawnMagenta.withOpacity(0.3), shape: BoxShape.circle)),
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
}

class PowerMeterPainter extends CustomPainter {
  final double progress;
  final Color baseColor;

  PowerMeterPainter({required this.progress, required this.baseColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.46; // Matches r="46" when viewBox is 100x100

    // Base circle
    final basePaint = Paint()
      ..color = baseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02;
    canvas.drawCircle(center, radius, basePaint);

    // Progress arc with gradient
    final gradient = const LinearGradient(
      colors: [Color(0xFFE0115F), Color(0xFFFF6B35)],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    final progressPaint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03
      ..strokeCap = StrokeCap.round;

    // SVG dasharray="289" implies 289 is the full circumference.
    // SVG dashoffset="60" means approx (289-60)/289 ~ 0.79 is filled.
    // Instead of computing all that precisely, we'll draw a proportion of an arc based on `progress`
    const double startAngle = 0; // Starts from mathematical 0, but SVG rotated -90
    final double sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant PowerMeterPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}


