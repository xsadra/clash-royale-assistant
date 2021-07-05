import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class BattleRiverRaceDuelItemWidget extends StatelessWidget {
  const BattleRiverRaceDuelItemWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: battle.resultBackgroundColor,
      padding: AppStyles.padding.symmetricV8,
      child: Column(
        children: [
          BattleHeader(battle: battle),
          AppStyles.sizedBox.height10,
          DuelBattleTeam(battle: battle),
          AppStyles.sizedBox.height12,
          BattleStatus(battle: battle),
        ],
      ),
    );
  }
}
