import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/player.dart';

class AchievementsCard extends StatelessWidget {
  const AchievementsCard({
    Key key,
    @required this.achieve,
  }) : super(key: key);

  final Achievement achieve;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.margins.all8,
      shadowColor: AppColors.achievements.cardShadowColor,
      elevation: AppWidgetsConfig.achievements.cardWidgetElevation,
      shape: AppStyles.achievements.cardWidgetShapeBorder,
      child: Padding(
        padding: AppStyles.paddings.all12,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _achieveName(),
              AppWidgets.sizedBox.height8,
              _achieveInfo(),
              AppWidgets.sizedBox.height16,
              _achieveStars(),
              AppWidgets.sizedBox.height6,
              _achieved(),
              AppWidgets.sizedBox.height6,
              _target(),
            ],
          ),
        ),
      ),
    );
  }

  Center _target() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppTexts.ui.targetCol,
            style: AppStyles.achievements.cardWidgetTargetColTextStyle,
          ),
          Text(
            achieve.target.toString(),
            style: AppStyles.achievements.cardWidgetTargetValueTextStyle,
          ),
        ],
      ),
    );
  }

  Center _achieved() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: AppTexts.ui.achievedCol,
          style: AppStyles.achievements.cardWidgetAchievedColTextStyle,
          children: [
            TextSpan(
              text: achieve.value.toString(),
              style: AppStyles.achievements.cardWidgetAchievedValueTextStyle
                  .copyWith(
                color: (achieve.value < achieve.target)
                    ? AppColors.achievements.achievedNotCompletedColor
                    : AppColors.achievements.achievedCompletedColor,
                fontWeight: (achieve.value < achieve.target)
                    ? AppFonts.achievements.achievedNotCompletedFontWeight
                    : AppFonts.achievements.achievedCompletedFontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _achieveStars() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppTexts.ui.starsCol,
            style: AppStyles.achievements.cardWidgetAchievedStarsColTextStyle,
          ),
          if (achieve.stars == 0)
            Text(
              AppTexts.ui.notYet,
              style:
                  AppStyles.achievements.cardWidgetAchievedStarsValueTextStyle,
            ),
          for (var index = 0; index < (achieve.stars ?? 0); index++)
            Image.asset(AppAssets.paths.starLevel, width: 16, height: 16),
        ],
      ),
    );
  }

  Center _achieveInfo() {
    return Center(
      child: Text(
        achieve.info,
        textAlign: TextAlign.center,
        style: AppStyles.achievements.cardWidgetAchievedInfoTextStyle,
      ),
    );
  }

  Container _achieveName() {
    return Container(
      child: Center(
        child: Text(
          achieve.name,
          textAlign: TextAlign.center,
          style: AppStyles.achievements.cardWidgetAchievedNameTextStyle,
        ),
      ),
    );
  }
}
