class AppWidgetsConfig {
  static AchievementsAppConfig achievements = const AchievementsAppConfig();

  AppWidgetsConfig._();
}

class AchievementsAppConfig {
  const AchievementsAppConfig();

  int get detailsDisplayColumnCount => 2;
  double get cardWidgetElevation => 9; // Fix Step : move to Styles
}
