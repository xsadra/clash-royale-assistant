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
        TeamMemberWidget(
          team: battle.team1,
          teamType: TeamMemberType.Team,
          showTrophies: battle.hasTrophies,
          offset: cardIndexOffset,
          ignorePlayerInfo: ignorePlayerInfo,
        ),
        OneToOneBattleVerticalDivider(
          color: Colors.black38,
          height: 52.0,
          thickness: 2.0,
          text: AppTexts.ui.vsCap,
          topOffset: verticalDividerTopOffset,
          hasBottomOffset: ignorePlayerInfo,
        ),
        TeamMemberWidget(
          team: battle.opponent1,
          teamType: TeamMemberType.opponent,
          showTrophies: battle.hasTrophies,
          offset: cardIndexOffset,
          ignorePlayerInfo: ignorePlayerInfo,
        ),
      ],
    );
  }
}
