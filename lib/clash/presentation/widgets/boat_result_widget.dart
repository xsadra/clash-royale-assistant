import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/enums/enums_with_extensions.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class BoatResultWidget extends StatelessWidget {
  const BoatResultWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    bool showClan =
        battle.isAttacker ? battle.team1.hasClan : battle.opponent1.hasClan;
    TeamMemberType teamType =
        battle.isAttacker ? TeamMemberType.Opponent : TeamMemberType.Team;
    TeamMember team = battle.isAttacker ? battle.opponent1 : battle.team1;

    return Container(
      // color: Colors.red.shade200,
      padding: AppStyles.padding.all12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: teamType == TeamMemberType.Team
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            team.name,
            style: AppStyles.battles.tileBattleTeamNameTextStyle,
          ),
          if (!team.hasClan)
            Text(
              AppTexts.ui.hasNoClan,
              style: AppStyles.battles.tileBattleTeamHasNoClanNameTextStyle,
            ),
          if (showClan) DisplayClanName(teamType: teamType, team: team),
          AppStyles.sizedBox.height8,
          Container(
            height: 170,
            // color: Colors.blue.shade100,
            child: Column(
              children: [
                AppStyles.sizedBox.height6,
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoatShieldResultWidget(
                      text: 'Towers at\nStart',
                      shieldColor: Colors.brown,
                      shieldTextValue:
                          (3 - battle.prevTowersDestroyed).toString(),
                    ),
                    AppStyles.sizedBox.width8,
                    BoatShieldResultWidget(
                      text: 'Towers\nDestroyed',
                      shieldColor: Colors.red.shade900,
                      shieldTextValue: battle.newTowersDestroyed.toString(),
                    ),
                  ],
                ),
                AppStyles.sizedBox.height10,
                Text(
                  'Remaining Towers',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                AppStyles.sizedBox.height4,
                Text(
                  battle.remainingTowers.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoatShieldResultWidget extends StatelessWidget {
  const BoatShieldResultWidget({
    Key key,
    @required this.text,
    @required this.shieldColor,
    @required this.shieldTextValue,
  }) : super(key: key);

  final String text;
  final Color shieldColor;
  final String shieldTextValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.shield,
              color: shieldColor,
              size: 52.0,
            ),
            Text(
              shieldTextValue,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
