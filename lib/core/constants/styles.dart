import 'package:flutter/material.dart';

class AppStyles {
  static Paddings padding = const Paddings();
  static Margins margins = const Margins();
  static SizedBoxesAppWidgets sizedBox = const SizedBoxesAppWidgets();
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

  EdgeInsetsGeometry get symmetricV8 => const EdgeInsets.symmetric(vertical: 8);

  EdgeInsetsGeometry get symmetricH4 =>
      const EdgeInsets.symmetric(horizontal: 4.0);

  EdgeInsetsGeometry get symmetricH10 =>
      const EdgeInsets.symmetric(horizontal: 10.0);
}

class SizedBoxesAppWidgets {
  const SizedBoxesAppWidgets();

  SizedBox get height1 => const SizedBox(height: 1);

  SizedBox get height2 => const SizedBox(height: 2);

  SizedBox get height3 => const SizedBox(height: 3);

  SizedBox get height4 => const SizedBox(height: 4);

  SizedBox get height5 => const SizedBox(height: 5);

  SizedBox get height6 => const SizedBox(height: 6);

  SizedBox get height7 => const SizedBox(height: 7);

  SizedBox get height8 => const SizedBox(height: 8);

  SizedBox get height9 => const SizedBox(height: 9);

  SizedBox get height10 => const SizedBox(height: 10);

  SizedBox get height11 => const SizedBox(height: 11);

  SizedBox get height12 => const SizedBox(height: 12);

  SizedBox get height13 => const SizedBox(height: 13);

  SizedBox get height14 => const SizedBox(height: 14);

  SizedBox get height15 => const SizedBox(height: 15);

  SizedBox get height16 => const SizedBox(height: 16);

  SizedBox get height18 => const SizedBox(height: 18);

  SizedBox get height20 => const SizedBox(height: 20);

  SizedBox get height24 => const SizedBox(height: 24);

  SizedBox get width1 => const SizedBox(width: 1);

  SizedBox get width2 => const SizedBox(width: 2);

  SizedBox get width3 => const SizedBox(width: 3);

  SizedBox get width4 => const SizedBox(width: 4);

  SizedBox get width5 => const SizedBox(width: 5);

  SizedBox get width6 => const SizedBox(width: 6);

  SizedBox get width7 => const SizedBox(width: 7);

  SizedBox get width8 => const SizedBox(width: 8);

  SizedBox get width9 => const SizedBox(width: 9);

  SizedBox get width10 => const SizedBox(width: 10);

  SizedBox get width11 => const SizedBox(width: 11);

  SizedBox get width12 => const SizedBox(width: 12);

  SizedBox get width13 => const SizedBox(width: 13);

  SizedBox get width14 => const SizedBox(width: 14);

  SizedBox get width15 => const SizedBox(width: 15);

  SizedBox get width16 => const SizedBox(width: 16);

  SizedBox get width18 => const SizedBox(width: 18);

  SizedBox get width20 => const SizedBox(width: 20);
}
