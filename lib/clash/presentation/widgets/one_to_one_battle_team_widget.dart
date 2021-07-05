import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/enums/enums_with_extensions.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class OneToOneBattleTeam extends StatelessWidget {
  const OneToOneBattleTeam({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TeamMemberWidget(
          team: battle.team1,
          teamType: TeamMemberType.Team,
          showTrophies: battle.hasTrophies,
        ),
        OneToOneBattleVerticalDivider(
          color: Colors.black38,
          height: 52.0,
          thickness: 2.0,
          text: AppTexts.ui.vsCap,
        ),
        TeamMemberWidget(
          team: battle.opponent1,
          teamType: TeamMemberType.opponent,
          showTrophies: battle.hasTrophies,
        ),
      ],
    );
  }
}
