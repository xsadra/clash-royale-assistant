import 'package:flutter/material.dart';

const kPaddingVertical_8 = const EdgeInsets.symmetric(vertical: 8.0);
const kPaddingAll_8 = const EdgeInsets.all(8.0);
const kStyleClubValue = const TextStyle(color: Colors.black87);
const kStyleClubCountry =
    const TextStyle(fontSize: 10.0, color: Colors.black54);
const kStyleClubName = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black87);
const kStyleDetailText = const TextStyle(color: Colors.black);
const kStyleMessageDisplay = const TextStyle(fontSize: 25.0);
const kStyleClubCountryText = const TextStyle(
    color: Colors.white70, fontSize: 22, fontWeight: FontWeight.bold);
const kStyleClubNameText = const TextStyle(fontWeight: FontWeight.bold);

class AppStyle {
  static Paddings paddings = const Paddings();
  static Margins margins = const Margins();
  static AchievementsAppStyle achievements = const AchievementsAppStyle();

  const AppStyle._();
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

class Margins {
  const Margins();

  EdgeInsetsGeometry get all8 => const EdgeInsets.all(8.0);
}

class Paddings {
  const Paddings();

  EdgeInsetsGeometry get all8 => const EdgeInsets.all(8.0);

  EdgeInsetsGeometry get all12 => const EdgeInsets.all(12.0);
}
