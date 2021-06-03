import 'package:flutter/material.dart';

class AppColors {
  static MainAppColor main = const MainAppColor();
  static PlayerAppColor player = const PlayerAppColor();
  static SplashAppColor splash = const SplashAppColor();
  static BottomNavBarAppColor bottomNavBar = const BottomNavBarAppColor();

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
