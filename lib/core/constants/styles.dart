import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static _Paddings padding = const _Paddings();
  static _Margins margins = const _Margins();
  static _SizedBoxesAppWidgets sizedBox = const _SizedBoxesAppWidgets();
  static _AchievementsAppStyle achievements = const _AchievementsAppStyle();
  static _BattlesAppStyle battles = const _BattlesAppStyle();
  static _UpdateNotificationAppStyle notification =
      const _UpdateNotificationAppStyle();

  const AppStyles._();
}

class _AchievementsAppStyle {
  const _AchievementsAppStyle();

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

class _BattlesAppStyle {
  const _BattlesAppStyle();

  double get tileHeaderCrownIconSize => 24;

  double get tileStatusBattleResultIconSize => 18;

  double get tileStatusBattleTimeIconSize => 18;

  double get tileBattleTeamClanIconSize => 18;

  double get tileBattleTeamClanTrophiesIconSize => 18;

  IconData get tileStatusBattleResultWinIconData => Icons.thumb_up;

  IconData get tileStatusBattleResultDefeatIconData => Icons.thumb_down;

  IconData get tileStatusBattleTimeIconData => Icons.timer_sharp;

  TextStyle get tileHeaderTitleTextStyle => const TextStyle(
        fontSize: 21,
        color: Colors.black87,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.9,
      );

  TextStyle get tileHeaderCrownTextStyle => const TextStyle(
        fontSize: 18.0,
        color: Color(0x8A000000),
        fontWeight: FontWeight.w500,
      );

  TextStyle get tileHeaderTournamentTagTextStyle => const TextStyle(
        fontSize: 14.0,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      );

  TextStyle get tileHeaderTournamentTagValueTextStyle => const TextStyle(
        fontSize: 14.0,
        color: Color(0xFF66BB6A),
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
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );

  TextStyle get tileStatusBattleTimeTextStyle => const TextStyle(
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
        color: Colors.blueAccent,
      );

  TextStyle get tileBattleTeamNameTextStyle => const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      );

  TextStyle get tileBattleTeamHasNoClanNameTextStyle => const TextStyle(
        fontSize: 14.0,
        color: Colors.black54,
        fontStyle: FontStyle.italic,
      );

  TextStyle get tileBattleTeamClanNameTextStyle => const TextStyle(
        fontSize: 14.0,
        color: Colors.black54,
        fontStyle: FontStyle.italic,
      );

  TextStyle get tileBattleTeamClanStartingTrophiesTextStyle => const TextStyle(
        fontSize: 14.0,
        color: Colors.black87,
      );

  TextStyle get tileBattleTeamCardNameTextStyle => const TextStyle(
        fontSize: 9,
        color: Colors.black54,
      );

  BoxDecoration get resultBoxDecoration => const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      );
}

class _UpdateNotificationAppStyle {
  const _UpdateNotificationAppStyle();

  BoxDecoration get updateNotificationBoxDecoration => const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x809e9e9e),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xfffbe9e7),
            Color(0xfffff9c4),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      );

  BoxDecoration get updateNotificationButtonBoxDecoration =>
      const BoxDecoration(
        color: Color(0xff81c784),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      );

  EdgeInsetsGeometry get updateNotificationMargin => const EdgeInsets.only(
        top: 8,
        right: 5,
        left: 5,
        bottom: 16,
      );

  EdgeInsetsGeometry get updateNotificationPadding => _Paddings().all12;

  TextStyle get updateNotificationTitleTextStyle => TextStyle(
        fontSize: 15.0,
        fontFamily: GoogleFonts.alfaSlabOne().fontFamily,
        color: Color(0xff1b5e20),
        letterSpacing: 1.5,
      );

  TextStyle get updateNotificationNewVersionTitleTextStyle => TextStyle(
        fontSize: 14,
        fontFamily: GoogleFonts.rajdhani().fontFamily,
      );

  TextStyle get updateNotificationMessageTextStyle => TextStyle(
        letterSpacing: 0.6,
        fontSize: 16,
        fontFamily: GoogleFonts.yanoneKaffeesatz().fontFamily,
        fontWeight: FontWeight.bold,
      );

  TextStyle get updateNotificationFeatureTextStyle => TextStyle(
        fontSize: 14,
        fontFamily: GoogleFonts.yanoneKaffeesatz().fontFamily,
      );

  TextStyle get updateNotificationButtonTextStyle => const TextStyle(
        color: Color(0xffffffff),
        fontSize: 14,
        letterSpacing: 1.5,
      );
}

class _Margins {
  const _Margins();

  EdgeInsetsGeometry get all1 => const EdgeInsets.all(1.0);

  EdgeInsetsGeometry get all2 => const EdgeInsets.all(2.0);

  EdgeInsetsGeometry get all3 => const EdgeInsets.all(3.0);

  EdgeInsetsGeometry get all4 => const EdgeInsets.all(4.0);

  EdgeInsetsGeometry get all5 => const EdgeInsets.all(5.0);

  EdgeInsetsGeometry get all6 => const EdgeInsets.all(6.0);

  EdgeInsetsGeometry get all8 => const EdgeInsets.all(8.0);
}

class _Paddings {
  const _Paddings();

  EdgeInsetsGeometry get all2 => const EdgeInsets.all(2.0);

  EdgeInsetsGeometry get all4 => const EdgeInsets.all(4.0);

  EdgeInsetsGeometry get all6 => const EdgeInsets.all(6.0);

  EdgeInsetsGeometry get all7 => const EdgeInsets.all(7.0);

  EdgeInsetsGeometry get all8 => const EdgeInsets.all(8.0);

  EdgeInsetsGeometry get all10 => const EdgeInsets.all(10.0);

  EdgeInsetsGeometry get all12 => const EdgeInsets.all(12.0);

  EdgeInsetsGeometry get symmetricV4 =>
      const EdgeInsets.symmetric(vertical: 4.0);

  EdgeInsetsGeometry get symmetricV8 => const EdgeInsets.symmetric(vertical: 8);

  EdgeInsetsGeometry get symmetricH4 =>
      const EdgeInsets.symmetric(horizontal: 4.0);

  EdgeInsetsGeometry get symmetricH10 =>
      const EdgeInsets.symmetric(horizontal: 10.0);
}

class _SizedBoxesAppWidgets {
  const _SizedBoxesAppWidgets();

  SizedBox height(double height) => SizedBox(height: height);

  SizedBox width(double width) => SizedBox(width: width);

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

  SizedBox get width25 => const SizedBox(width: 25);

  SizedBox get width30 => const SizedBox(width: 30);

  SizedBox get width35 => const SizedBox(width: 35);

  SizedBox get width40 => const SizedBox(width: 40);

  SizedBox get width50 => const SizedBox(width: 50);
}
