import 'package:flutter/material.dart';

class AppColors {
  static MainAppColor main = const MainAppColor();
  static PlayerAppColor player = const PlayerAppColor();
  static SplashAppColor splash = const SplashAppColor();
  static BottomNavBarAppColor bottomNavBar = const BottomNavBarAppColor();
  static AchievementsAppColor achievements = const AchievementsAppColor();
  static BattlesAppColor battles = const BattlesAppColor();

  AppColors._();
}

class MainAppColor {
  const MainAppColor();

  Color get primaryColor => const Color(0xFF190F2A);
}

class PlayerAppColor {
  const PlayerAppColor();

  Color get tabBarIndicatorColor => const Color(0xFF009688);

  Color get tabBarLabelColor => const Color(0xFF009688);

  Color get tabBarUnselectedLabelColor => const Color(0x8A000000);
}

class SplashAppColor {
  const SplashAppColor();

  Color get backgroundColor => const Color(0xB3FFFFFF);
}

class BottomNavBarAppColor {
  const BottomNavBarAppColor();

  Color get backgroundColor => const Color(0xFF190F2A);
}

class AchievementsAppColor {
  const AchievementsAppColor();

  Color get cardShadowColor => const Color(0x8A000000);

  Color get achievedCompletedColor => const Color(0xFF4CAF50);

  Color get achievedNotCompletedColor => const Color(0xFFF44336);
}

class BattlesAppColor {
  const BattlesAppColor();

  Color get tileStatusBattleTimeIconColor => const Color(0xFF448AFF);

  Color get tileResultWinBackgroundColor => const Color(0xFFC8E6C9);

  Color get tileResultDefeatBackgroundColor => const Color(0xFFFFEBEE);

  Color get tileResultDrawBackgroundColor => const Color(0x42000000);

  Color get tileStatusWinBackgroundColor => const Color(0xFF4CAF50);

  Color get tileStatusDefeatBackgroundColor => const Color(0xFFF44336);

  Color get tileStatusDrawBackgroundColor => const Color(0xB3FFFFFF);

  Color get tileBattleTeamShareDeckIconColor => const Color(0xFF3F51B5);
}
