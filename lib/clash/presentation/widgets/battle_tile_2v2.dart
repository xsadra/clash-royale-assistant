import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class Battle2V2ItemWidget extends StatelessWidget {
  const Battle2V2ItemWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: battle.resultBackgroundColor,
      padding: AppStyles.paddings.symmetricV8,
      child: Column(
        children: [
          BattleHeader(battle: battle),
          AppStyles.sizedBox.height10,
          TwoToTwoBattleTeam(battle: battle),
          AppStyles.sizedBox.height8,
          BattleStatus(battle: battle),
        ],
      ),
    );
  }
}
