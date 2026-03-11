import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Placeholder imports for screens that will be created
import '../screens/splash_screen_1.dart';
import '../screens/splash_screen_2.dart';
import '../screens/splash_screen_3.dart';
import '../screens/onboarding_1.dart';
import '../screens/onboarding_2.dart';
import '../screens/onboarding_3.dart';
import '../screens/sign_up_login.dart';
import '../screens/profile_setup_step_1.dart';
import '../screens/profile_setup_level_prefs.dart';
import '../screens/profile_setup_body_goals.dart';
import '../screens/main_dashboard.dart';
import '../screens/dashboard_v2.dart';
import '../screens/workout_plan.dart';
import '../screens/active_workout_session.dart';
import '../screens/workout_session_v2.dart';
import '../screens/muscle_interaction.dart';
import '../screens/avatar_generation.dart';
import '../screens/workout_history.dart';
import '../screens/achievements_level.dart';
import '../screens/fitmorph_premium.dart';
// import '../screens/settings.dart';

class AppRoutes {
  static const String splash1 = '/';
  static const String splash2 = '/splash2';
  static const String splash3 = '/splash3';
  static const String onboarding1 = '/onboarding1';
  static const String onboarding2 = '/onboarding2';
  static const String onboarding3 = '/onboarding3';
  static const String signUpLogin = '/auth';
  
  static const String profileSetup1 = '/setup/1';
  static const String profileSetupLevelPrefs = '/setup/2';
  static const String profileSetupBodyGoals = '/setup/3';
  
  static const String dashboard = '/dashboard';
  static const String dashboardV2 = '/dashboard/v2';
  
  static const String workoutPlan = '/workout/plan';
  static const String workoutSessionV2 = '/workout/session';
  static const String activeWorkout = '/workout/active';
  static const String muscleInteraction = '/workout/muscle';
  
  static const String avatarGeneration = '/avatar';
  static const String workoutHistory = '/history';
  static const String achievementsLevel = '/achievements';
  static const String premium = '/premium';
  static const String settings = '/settings';
  static const String notifications = '/notifications';

  static final router = GoRouter(
    initialLocation: splash1,
    routes: [
      GoRoute(
        path: splash1,
        builder: (context, state) => const SplashScreen1(),
      ),
      GoRoute(
        path: dashboard,
        builder: (context, state) => const MainDashboardScreen(),
      ),
      GoRoute(
        path: dashboardV2,
        builder: (context, state) => const DashboardV2Screen(),
      ),
      GoRoute(
        path: workoutPlan,
        builder: (context, state) => const WorkoutPlanScreen(),
      ),
      GoRoute(
        path: activeWorkoutSession,
        builder: (context, state) => const ActiveWorkoutSessionScreen(),
      ),
      GoRoute(
        path: workoutSessionV2,
        builder: (context, state) => const WorkoutSessionV2Screen(),
      ),
      GoRoute(
        path: muscleInteraction,
        builder: (context, state) => const MuscleInteractionScreen(),
      ),
      GoRoute(
        path: avatarGeneration,
        builder: (context, state) => const AvatarGenerationScreen(),
      ),
      GoRoute(
        path: workoutHistory,
        builder: (context, state) => const WorkoutHistoryScreen(),
      ),
      GoRoute(
        path: achievementsLevel,
        builder: (context, state) => const AchievementsLevelScreen(),
      ),
      GoRoute(
        path: fitmorphPremium,
        builder: (context, state) => const FitmorphPremiumScreen(),
      ),
      GoRoute(path: splash2, builder: (context, state) => const SplashScreen2()),
      GoRoute(path: splash3, builder: (context, state) => const SplashScreen3()),
      GoRoute(path: onboarding1, builder: (context, state) => const OnboardingScreen1()),
      GoRoute(path: onboarding2, builder: (context, state) => const OnboardingScreen2()),
      GoRoute(path: onboarding3, builder: (context, state) => const OnboardingScreen3()),
      GoRoute(path: signUpLogin, builder: (context, state) => const SignUpLoginScreen()),
      GoRoute(path: profileSetup1, builder: (context, state) => const ProfileSetupStep1Screen()),
      GoRoute(path: profileSetupLevelPrefs, builder: (context, state) => const ProfileSetupLevelPrefsScreen()),
      GoRoute(path: profileSetupBodyGoals, builder: (context, state) => const ProfileSetupBodyGoalsScreen()),
      // Add more routes here as screens are implemented
    ],
  );
}
