import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class DuelBattleTeam extends StatelessWidget {
  const DuelBattleTeam({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    bool hasThreeBattle = battle.team1.cards.length > 16;
    return Column(
      children: [
        OneToOneBattleTeam(
          battle: battle,
          verticalDividerTopOffset: battle.team1.canShareDeck ? 0 : 24,
        ),
        AppStyles.sizedBox.height10,
        OneToOneBattleTeam(
          battle: battle,
          cardIndexOffset: 8,
          ignorePlayerInfo: true,
          verticalDividerTopOffset: battle.team1.canShareSecondDeck ? 0 : 24,
        ),
        if (hasThreeBattle) ...[
          AppStyles.sizedBox.height10,
          OneToOneBattleTeam(
            battle: battle,
            cardIndexOffset: 16,
            ignorePlayerInfo: true,
            verticalDividerTopOffset: battle.team1.canShareThirdDeck ? 0 : 24,
          ),
        ],
      ],
    );
  }
}
