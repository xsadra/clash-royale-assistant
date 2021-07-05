import 'package:flutter/material.dart';

class AppStyles {
  static Paddings paddings = const Paddings();
  static Margins margins = const Margins();
  static AchievementsAppStyle achievements = const AchievementsAppStyle();
  static BattlesAppStyle battles = const BattlesAppStyle();

  const AppStyles._();
}

class AchievementsAppStyle {
  const AchievementsAppStyle();

  ShapeBorder get cardWidgetShapeBorder => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      );

  TextStyle get cardWidgetTargetColTextStyle => const TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 1.5,
        fontStyle: FontStyle.italic,
      );

  TextStyle get cardWidgetTargetValueTextStyle => const TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 1.5,
        fontStyle: FontStyle.italic,
      );

  TextStyle get cardWidgetAchievedColTextStyle => const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        letterSpacing: 1.5,
        fontStyle: FontStyle.italic,
      );

  TextStyle get cardWidgetAchievedValueTextStyle => const TextStyle(
        fontSize: 12,
        letterSpacing: 1.5,
        fontStyle: FontStyle.italic,
      );

  TextStyle get cardWidgetAchievedStarsColTextStyle => const TextStyle(
        color: Color(0XFF826001),
        fontWeight: FontWeight.w600,
        fontSize: 13,
        letterSpacing: 1.5,
        fontStyle: FontStyle.italic,
      );

  TextStyle get cardWidgetAchievedStarsValueTextStyle => const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 1.5,
        fontStyle: FontStyle.italic,
      );

  TextStyle get cardWidgetAchievedInfoTextStyle => const TextStyle(
        color: Color(0xFF183C45),
        fontWeight: FontWeight.w600,
        fontSize: 12,
        letterSpacing: 1.5,
        fontStyle: FontStyle.italic,
      );

  TextStyle get cardWidgetAchievedNameTextStyle => const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w900,
      );
}

class BattlesAppStyle {
  const BattlesAppStyle();

  double get tileHeaderCrownIconSize => 24;

  double get tileStatusBattleResultIconSize => 12;

  double get tileStatusBattleTimeIconSize => 12;

  IconData get tileStatusBattleResultWinIconData => Icons.thumb_up;

  IconData get tileStatusBattleResultDefeatIconData => Icons.thumb_down;

  IconData get tileStatusBattleTimeIconData => Icons.thumb_down;

  TextStyle get tileHeaderTitleTextStyle => const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.9,
      );

  TextStyle get tileHeaderCrownTextStyle => const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      );

  TextStyle get tileHeaderTeamWinCounterTitleTextStyle => const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(color: Colors.red, blurRadius: 2, offset: Offset(1, 1)),
          Shadow(color: Colors.black, blurRadius: 4, offset: Offset(1, -1)),
          Shadow(color: Colors.black, blurRadius: 2, offset: Offset(-1, 1)),
          Shadow(color: Colors.black, blurRadius: 2, offset: Offset(-1, -1)),
        ],
      );

  TextStyle get tileStatusBattleResultTitleTextStyle => const TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );

  TextStyle get tileStatusBattleTimeTextStyle => const TextStyle(
        fontSize: 10.0,
        fontStyle: FontStyle.italic,
        color: Colors.blueAccent,
      );
}

class Margins {
  const Margins();

  EdgeInsetsGeometry get all8 => const EdgeInsets.all(8.0);
}

class Paddings {
  const Paddings();

  EdgeInsetsGeometry get all8 => const EdgeInsets.all(8.0);

  EdgeInsetsGeometry get all12 => const EdgeInsets.all(12.0);

  EdgeInsetsGeometry get symmetricV4 =>
      const EdgeInsets.symmetric(vertical: 4.0);

  EdgeInsetsGeometry get symmetricH10 =>
      const EdgeInsets.symmetric(horizontal: 10.0);
}
