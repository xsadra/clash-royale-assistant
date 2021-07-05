import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/battle.dart';

@Deprecated('Use [BattleTileHeader] instead')
List<Widget> generateBattleItemHeader({@required Battle battle}) {
  return [
    Text(
      battle.gameModeNameFormatted,
      style: AppStyles.battles.tileHeaderTitleTextStyle,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.paths.crownBlue,
          height: AppStyles.battles.tileHeaderCrownIconSize,
          width: AppStyles.battles.tileHeaderCrownIconSize,
        ),
        AppStyles.sizedBox.width6,
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: battle.teamCrowns.toString(),
              style: AppStyles.battles.tileHeaderCrownTextStyle,
            ),
            TextSpan(
              text: AppTexts.ui.spcHyphenSps,
              style: AppStyles.battles.tileHeaderCrownTextStyle,
            ),
            TextSpan(
              text: battle.opponentCrowns.toString(),
              style: AppStyles.battles.tileHeaderCrownTextStyle,
            ),
          ],
        )),
        AppStyles.sizedBox.width6,
        Image.asset(
          AppAssets.paths.crownRed,
          height: AppStyles.battles.tileHeaderCrownIconSize,
          width: AppStyles.battles.tileHeaderCrownIconSize,
        ),
      ],
    ),
    if (battle.isDisplayTeamWin) TeamWinCounterDisplayWidget(battle: battle),
  ];
}

class BattleStatus extends StatelessWidget {
  const BattleStatus({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.paddings.symmetricH10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            battle.didTeamWin
                ? AppStyles.battles.tileStatusBattleResultDefeatIconData
                : AppStyles.battles.tileStatusBattleResultWinIconData,
            size: AppStyles.battles.tileStatusBattleResultIconSize,
            color: battle.resultStatsColor,
          ),
          AppStyles.sizedBox.width2,
          Text(
            battle.battleResultTitle,
            style:
                AppStyles.battles.tileStatusBattleResultTitleTextStyle.copyWith(
              color: battle.resultStatsColor,
            ),
          ),
          AppStyles.sizedBox.width10,
          Icon(
            AppStyles.battles.tileStatusBattleTimeIconData,
            size: AppStyles.battles.tileStatusBattleTimeIconSize,
            color: AppColors.battles.tileStatusBattleTimeIconColor,
          ),
          AppStyles.sizedBox.width2,
          Text(
            battle.timeAgo,
            style: AppStyles.battles.tileStatusBattleTimeTextStyle,
          ),
        ],
      ),
    );
  }
}

class TeamWinCounterDisplayWidget extends StatelessWidget {
  const TeamWinCounterDisplayWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return (battle.isDisplayTeamWinText)
        ? RichText(
            text: TextSpan(
              children: [
                if (battle.isDisplayPreviousTeamWinNumber)
                  TextSpan(
                    text: battle.winCount,
                    style: AppStyles
                        .battles.tileHeaderTeamWinCounterTitleTextStyle,
                  ),
                if (battle.didTeamWin)
                  TextSpan(
                    text: AppTexts.ui.spcPlusOne,
                    style: AppStyles
                        .battles.tileHeaderTeamWinCounterTitleTextStyle,
                  ),
                TextSpan(
                  text: battle.winCountText,
                  style:
                      AppStyles.battles.tileHeaderTeamWinCounterTitleTextStyle,
                ),
              ],
            ),
          )
        : Container();
  }
}

class BattleHeader extends StatelessWidget {
  final Battle battle;

  const BattleHeader({Key key, @required this.battle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          battle.gameModeNameFormatted,
          style: AppStyles.battles.tileHeaderTitleTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.paths.crownBlue,
              height: AppStyles.battles.tileHeaderCrownIconSize,
              width: AppStyles.battles.tileHeaderCrownIconSize,
            ),
            AppStyles.sizedBox.width6,
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: battle.teamCrowns.toString(),
                  style: AppStyles.battles.tileHeaderCrownTextStyle,
                ),
                TextSpan(
                  text: AppTexts.ui.spcHyphenSps,
                  style: AppStyles.battles.tileHeaderCrownTextStyle,
                ),
                TextSpan(
                  text: battle.opponentCrowns.toString(),
                  style: AppStyles.battles.tileHeaderCrownTextStyle,
                ),
              ],
            )),
            AppStyles.sizedBox.width6,
            Image.asset(
              AppAssets.paths.crownRed,
              height: AppStyles.battles.tileHeaderCrownIconSize,
              width: AppStyles.battles.tileHeaderCrownIconSize,
            ),
          ],
        ),
        if (battle.isDisplayTeamWin)
          TeamWinCounterDisplayWidget(battle: battle),
      ],
    );
  }
}
