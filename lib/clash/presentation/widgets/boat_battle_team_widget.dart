import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/enums/enums_with_extensions.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class BoatBattleTeam extends StatelessWidget {
  const BoatBattleTeam({
    Key key,
    @required this.battle,
    this.cardIndexOffset = 0,
    this.verticalDividerTopOffset = 0,
    this.ignorePlayerInfo = false,
  })  : assert(verticalDividerTopOffset >= 0),
        assert(cardIndexOffset >= 0),
        super(key: key);

  final Battle battle;
  final int cardIndexOffset;
  final double verticalDividerTopOffset;
  final bool ignorePlayerInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (battle.isAttacker)
          TeamMemberWidget(
            team: battle.team1,
            teamType: TeamMemberType.Team,
            showTrophies: battle.hasTrophies,
            offset: cardIndexOffset,
            ignorePlayerInfo: ignorePlayerInfo,
          ),
        if (battle.isDefender) AppStyles.sizedBox.width10,
        BoatResultWidget(battle: battle),
        if (battle.isAttacker) AppStyles.sizedBox.width10,
        if (battle.isDefender)
          TeamMemberWidget(
            team: battle.opponent1,
            teamType: TeamMemberType.Opponent,
            showTrophies: battle.hasTrophies,
            offset: cardIndexOffset,
            ignorePlayerInfo: ignorePlayerInfo,
          ),
      ],
    );
  }
}
