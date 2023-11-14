import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';

class BoatBattleHeader extends StatelessWidget {
  final Battle battle;

  const BoatBattleHeader({
    Key? key,
    required this.battle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          battle.gameModeNameFormatted,
          style: AppStyles.battles.tileHeaderTitleTextStyle,
        ),
      ],
    );
  }
}

class BoatBattleStatus extends StatelessWidget {
  const BoatBattleStatus({
    Key? key,
    required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.padding.symmetricH10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            battle.didBoatWin
                ? AppStyles.battles.tileStatusBattleResultWinIconData
                : AppStyles.battles.tileStatusBattleResultDefeatIconData,
            size: AppStyles.battles.tileStatusBattleResultIconSize,
            color: battle.boatResultStatsColor,
          ),
          AppStyles.sizedBox.width2,
          Text(
            battle.boatBattleResultTitle,
            style:
                AppStyles.battles.tileStatusBattleResultTitleTextStyle.copyWith(
              color: battle.boatResultStatsColor,
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
