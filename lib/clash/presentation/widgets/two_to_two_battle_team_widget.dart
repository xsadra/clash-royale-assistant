import 'package:clash_royale_assistant/core/constants/consts.dart';
import 'package:flutter/material.dart' hide Card;

import '../../../core/enums/enums_with_extensions.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class TwoToTwoBattleTeam extends StatelessWidget {
  const TwoToTwoBattleTeam({
    Key? key,
    required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TeamMemberWidget(
              team: battle.team1,
              teamType: TeamMemberType.Team,
              showTrophies: battle.hasTrophies,
            ),
            VerticalDividerWidget(
                height: 170.0, thickness: 2.0, color: Colors.black38),
            TeamMemberWidget(
              team: battle.opponent1,
              teamType: TeamMemberType.Opponent,
              showTrophies: battle.hasTrophies,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white54 // red as border color
                ),
          ),
          child: Text(
            AppTexts.ui.vsCap,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        AppStyles.sizedBox.height4,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TeamMemberWidget(
              team: battle.team2!,
              teamType: TeamMemberType.Team,
              showTrophies: battle.hasTrophies2v2,
            ),
            VerticalDividerWidget(
                height: 170.0, thickness: 2.0, color: Colors.black38),
            TeamMemberWidget(
              team: battle.opponent2!,
              teamType: TeamMemberType.Opponent,
              showTrophies: battle.hasTrophies2v2,
            ),
          ],
        ),
      ],
    );
  }
}
