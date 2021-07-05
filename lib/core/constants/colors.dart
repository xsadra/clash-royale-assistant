import 'package:flutter/material.dart';

class AppColors {
  static MainAppColor main = const MainAppColor();
  static PlayerAppColor player = const PlayerAppColor();
  static SplashAppColor splash = const SplashAppColor();
  static BottomNavBarAppColor bottomNavBar = const BottomNavBarAppColor();
  static AchievementsAppColor achievements = const AchievementsAppColor();

  AppColors._();
}

class MainAppColor {
  const MainAppColor();

  Color get primaryColor => Color(0xFF190F2A);
}

class PlayerAppColor {
  const PlayerAppColor();

  Color get tabBarIndicatorColor => Colors.teal;

  Color get tabBarLabelColor => Colors.teal;

  Color get tabBarUnselectedLabelColor => Colors.black54;
}

class SplashAppColor {
  const SplashAppColor();

  Color get backgroundColor => Colors.white70;
}

class BottomNavBarAppColor {
  const BottomNavBarAppColor();

  Color get backgroundColor => Color(0xFF190F2A);
}

class AchievementsAppColor {
  const AchievementsAppColor();

  Color get cardShadowColor => Colors.black54;
  Color get achievedCompletedColor => Colors.green;
  Color get achievedNotCompletedColor => Colors.red;
}
