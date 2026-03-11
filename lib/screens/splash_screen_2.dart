import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _scanController;
  late Animation<double> _progressAnimation;
  late Animation<double> _scanAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    
    _progressAnimation = Tween<double>(begin: 0.0, end: 0.78).animate(
      CurvedAnimation(
        parent: _progressController,
        curve: Curves.easeOutCubic,
      ),
    );

    _scanAnimation = Tween<double>(begin: -0.2, end: 1.2).animate(
      CurvedAnimation(
        parent: _scanController,
        curve: Curves.linear,
      ),
    );

    _progressController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          context.go(AppRoutes.splash3);
        }
      });
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryCyan = Color(0xFF00F2FF);
    const cyberGreen = Color(0xFF00FF9D);

    return Scaffold(
      backgroundColor: const Color(0xFF05070A),
      body: Stack(
        children: [
          // Hologram Grid Background
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(color: primaryCyan.withOpacity(0.05)),
            ),
          ),
          
          // Background Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xCC05070A),
                    Color(0xFF05070A),
                  ],
                ),
              ),
            ),
          ),
          
          // Scan Line Animation
          AnimatedBuilder(
            animation: _scanAnimation,
            builder: (context, child) {
              return Positioned(
                top: MediaQuery.of(context).size.height * _scanAnimation.value,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        primaryCyan.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          
          // Top Left System indicator
          Positioned(
            top: 48,
            left: 24,
            child: Opacity(
              opacity: 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 32, height: 1, color: primaryCyan),
                  const SizedBox(height: 4),
                  Container(width: 16, height: 1, color: primaryCyan),
                  const SizedBox(height: 8),
                  Text(
                    'SYS_ACTIVE_01',
                    style: GoogleFonts.robotoMono(
                      color: primaryCyan,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Right Side Sync Progress
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: primaryCyan.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              'SYNC_INIT',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: primaryCyan.withOpacity(0.4),
                                fontSize: 10,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: 2,
                            height: 128,
                            color: const Color(0xFF1E293B),
                            alignment: Alignment.topCenter,
                            child: AnimatedBuilder(
                              animation: _progressAnimation,
                              builder: (context, child) {
                                return FractionallySizedBox(
                                  heightFactor: _progressAnimation.value,
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primaryCyan,
                                      boxShadow: [
                                        BoxShadow(
                                          color: primaryCyan.withOpacity(0.5),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      
                      Column(
                        children: [
                          // Pulse dot
                          TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0.4, end: 1.0),
                            duration: const Duration(seconds: 1),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: Container(
                                  width: 4, height: 4,
                                  decoration: const BoxDecoration(
                                    color: primaryCyan,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 4),
                          Container(width: 4, height: 4, decoration: BoxDecoration(color: primaryCyan.withOpacity(0.4), shape: BoxShape.circle)),
                          const SizedBox(height: 4),
                          Container(width: 4, height: 4, decoration: BoxDecoration(color: primaryCyan.withOpacity(0.2), shape: BoxShape.circle)),
                        ],
                      ),
                      
                      AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          return Text(
                            '${(_progressAnimation.value * 100).toInt()}%',
                            style: GoogleFonts.robotoMono(
                              color: primaryCyan,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 128.0), // Padding for the bottom bar
              child: Center(
                child: SizedBox(
                  width: 288,
                  height: 288,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Blurs
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryCyan.withOpacity(0.1),
                          boxShadow: [
                            BoxShadow(color: primaryCyan.withOpacity(0.1), blurRadius: 100, spreadRadius: 30)
                          ]
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.05),
                          boxShadow: [
                            BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 60)
                          ]
                        ),
                      ),
                      
                      // Geometric SVG Representation
                      Opacity(
                        opacity: 0.2,
                        child: CustomPaint(
                          size: const Size(288, 288),
                          painter: HexagonLinesPainter(color: primaryCyan),
                        ),
                      ),
                      
                      // Accessibility Icon Layering
                      Icon(Icons.accessibility_new, size: 240, color: primaryCyan.withOpacity(0.1)),
                      const Icon(Icons.accessibility_new, size: 244, color: Color(0x4D00F2FF)),
                      Icon(
                        Icons.accessibility_new, 
                        size: 240, 
                        color: primaryCyan,
                        shadows: [Shadow(color: primaryCyan.withOpacity(0.8), blurRadius: 15)],
                      ),
                      
                      // Accent Icons
                      Positioned(
                        top: 72,
                        left: 72,
                        child: Opacity(
                          opacity: 0.6,
                          child: Icon(Icons.polyline, size: 20, color: cyberGreen),
                        ),
                      ),
                      Positioned(
                        bottom: 96,
                        right: 72,
                        child: Opacity(
                          opacity: 0.6,
                          child: Icon(Icons.hub, size: 16, color: primaryCyan),
                        ),
                      ),
                      
                      // Outer Rings
                      Container(
                        width: 320,
                        height: 320,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryCyan.withOpacity(0.1), style: BorderStyle.none),
                        ),
                        child: CustomPaint(
                          painter: DashedRingPainter(color: primaryCyan.withOpacity(0.2), isDotted: false),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 360,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: cyberGreen.withOpacity(0.05), style: BorderStyle.none),
                        ),
                        child: CustomPaint(
                          painter: DashedRingPainter(color: cyberGreen.withOpacity(0.1), isDotted: true),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A).withOpacity(0.4),
                border: Border(
                  top: BorderSide(color: primaryCyan.withOpacity(0.1), width: 1),
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: AppTextStyles.headlineMedium.copyWith(
                                fontSize: 28,
                                letterSpacing: -1.0,
                              ),
                              children: const [
                                TextSpan(text: 'AVATFIT '),
                                TextSpan(
                                  text: 'AI',
                                  style: TextStyle(color: primaryCyan),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ENHANCE . EVOLVE . TRANSCEND',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.textMuted,
                              letterSpacing: 2.5,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      
                      // Only show on larger screens in real app, but showing here for completion
                      Text(
                        '// "Transform Your Body, One Workout at a Time"',
                        style: GoogleFonts.robotoMono(
                          color: primaryCyan.withOpacity(0.6),
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painters for the geometric background and rings
class GridPainter extends CustomPainter {
  final Color color;

  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const double step = 30.0;
    
    // Draw vertical lines
    for (double i = 0; i <= size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    
    // Draw horizontal lines
    for (double i = 0; i <= size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DashedRingPainter extends CustomPainter {
  final Color color;
  final bool isDotted;

  DashedRingPainter({required this.color, required this.isDotted});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final path = Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    
    // Very simplified dashed path approximation
    final dashWidth = isDotted ? 2.0 : 8.0;
    final dashSpace = isDotted ? 4.0 : 6.0;
    
    final ui.PathMetrics pathMetrics = path.computeMetrics();
    for (final ui.PathMetric pathMetric in pathMetrics) {
      double distance = 0;
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HexagonLinesPainter extends CustomPainter {
  final Color color;

  HexagonLinesPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
      
    final thinPaint = Paint()
      ..color = color
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // Draw the hexagon shapes based on the SVG coordinates in the HTML
    double w = size.width;
    double h = size.height;
    
    // First Path
    final path1 = Path()
      ..moveTo(w * 0.5, h * 0.1)
      ..lineTo(w * 0.9, h * 0.3)
      ..lineTo(w * 0.9, h * 0.7)
      ..lineTo(w * 0.5, h * 0.9)
      ..lineTo(w * 0.1, h * 0.7)
      ..lineTo(w * 0.1, h * 0.3)
      ..close();
      
    canvas.drawPath(path1, paint);
    
    // Second smaller Path
    final path2 = Path()
      ..moveTo(w * 0.5, h * 0.2)
      ..lineTo(w * 0.8, h * 0.35)
      ..lineTo(w * 0.8, h * 0.65)
      ..lineTo(w * 0.5, h * 0.8)
      ..lineTo(w * 0.2, h * 0.65)
      ..lineTo(w * 0.2, h * 0.35)
      ..close();
      
    canvas.drawPath(path2, thinPaint);
    
    // Center line
    canvas.drawLine(Offset(w * 0.5, h * 0.1), Offset(w * 0.5, h * 0.9), thinPaint);
    
    // Cross lines
    canvas.drawLine(Offset(w * 0.1, h * 0.3), Offset(w * 0.9, h * 0.7), thinPaint);
    canvas.drawLine(Offset(w * 0.9, h * 0.3), Offset(w * 0.1, h * 0.7), thinPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}



