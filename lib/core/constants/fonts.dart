import 'package:flutter/material.dart';

class AppFonts {
  static AchievementsAppFonts achievements = const AchievementsAppFonts();

  const AppFonts._();
}

class AchievementsAppFonts {
  const AchievementsAppFonts();
  FontWeight get achievedCompletedFontWeight => FontWeight.bold;
  FontWeight get achievedNotCompletedFontWeight => FontWeight.w600;
}
