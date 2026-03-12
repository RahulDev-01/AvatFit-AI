import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SignUpLoginScreen extends StatefulWidget {
  const SignUpLoginScreen({super.key});

  @override
  State<SignUpLoginScreen> createState() => _SignUpLoginScreenState();
}

class _SignUpLoginScreenState extends State<SignUpLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Stack(
            children: [
              // Background Decorations
              Positioned(
                top: MediaQuery.of(context).size.height * -0.1,
                right: MediaQuery.of(context).size.width * -0.1,
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 120),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: MediaQuery.of(context).size.width * -0.1,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 100),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  // App Bar / Header
                  SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              if (context.canPop()) {
                                context.pop();
                              }
                            },
                          ),
                          Text(
                            'AvatFit AI',
                            style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 48), // Balance for back button
                        ],
                      ),
                    ),
                  ),

                  // Hero Image Area
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0), // Rounded for screen sizes > 480px, but looks good universally
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Sign Up Login - 344685e9a46d48bba4fcc9436b399b4d.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                AppColors.background.withOpacity(1.0),
                                AppColors.background.withOpacity(0.0),
                              ],
                              stops: const [0.0, 0.5],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Main Content Form (Glassmorphism)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
                      child: Transform.translate(
                        offset: const Offset(0, -32), // Pulls panel up over image
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.03),
                                border: Border.all(color: Colors.white.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Join the Evolution',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.headlineMedium.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Your fitness transformation starts here.',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                  const SizedBox(height: 32),

                                  // Email Input
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                                    child: Text('Email Address', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textMuted)),
                                  ),
                                  TextField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'name@example.com',
                                      hintStyle: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.5)),
                                      filled: true,
                                      fillColor: AppColors.surface,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.5), width: 2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Password Input
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                                    child: Text('Password', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textMuted)),
                                  ),
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Min. 8 characters',
                                      hintStyle: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.5)),
                                      filled: true,
                                      fillColor: AppColors.surface,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.5), width: 2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Create Account Button
                                  ElevatedButton(
                                    onPressed: () {
                                      context.go(AppRoutes.profileSetup1);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      elevation: 8,
                                      shadowColor: AppColors.primary.withOpacity(0.5),
                                    ),
                                    child: Text('Create Account', style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
                                  ),

                                  // Divider
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                                    child: Row(
                                      children: [
                                        Expanded(child: Container(height: 1, color: Colors.white.withOpacity(0.1))),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Text('OR CONTINUE WITH', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted)),
                                        ),
                                        Expanded(child: Container(height: 1, color: Colors.white.withOpacity(0.1))),
                                      ],
                                    ),
                                  ),

                                  // Social Logins
                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(Icons.g_mobiledata, size: 28), // Placeholder for Google icon
                                          label: const Text('Google'),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                                            side: BorderSide(color: Colors.white.withOpacity(0.1)),
                                            backgroundColor: AppColors.surface,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: OutlinedButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(Icons.apple, size: 24), // Placeholder for Apple icon
                                          label: const Text('Apple'),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                                            side: BorderSide(color: Colors.white.withOpacity(0.1)),
                                            backgroundColor: AppColors.surface,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  const Spacer(),
                                  
                                  // Footer Links
                                  Center(
                                    child: RichText(
                                      text: TextSpan(
                                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted),
                                        children: [
                                          const TextSpan(text: 'Already have an account? '),
                                          TextSpan(
                                            text: 'Log in',
                                            style: AppTextStyles.bodySmall.copyWith(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                context.go(AppRoutes.dashboard);
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Center(
                                    child: Text(
                                      'By signing up, you agree to our Terms of Service and Privacy Policy.',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}


