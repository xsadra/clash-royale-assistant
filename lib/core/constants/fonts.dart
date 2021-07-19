import 'package:flutter/material.dart';

class AppFonts {
  static const String alfaSlabOne = 'AlfaSlabOne';
  static const String monoton = 'Monoton';
  static const String pacifico = 'Pacifico';
  static const String openSansCondensed = 'OpenSansCondensed';
  static const String rajdhani = 'Rajdhani';
  static const String roboto = 'Roboto';
  static const String staatliches = 'Staatliches';
  static const String teko = 'Teko';
  static const String yanoneKaffeesatz = 'YanoneKaffeesatz';
  static const String zillaSlab = 'ZillaSlab';

  static AchievementsAppFonts achievements = const AchievementsAppFonts();

  const AppFonts._();
}

class AchievementsAppFonts {
  const AchievementsAppFonts();

  FontWeight get achievedCompletedFontWeight => FontWeight.bold;

  FontWeight get achievedNotCompletedFontWeight => FontWeight.w600;
}
