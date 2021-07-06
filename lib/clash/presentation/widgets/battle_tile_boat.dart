import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class BattleBoatItemWidget extends StatelessWidget {
  const BattleBoatItemWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: battle.boatResultBackgroundColor,
      padding: AppStyles.padding.symmetricV8,
      child: Column(
        children: [
          BoatBattleHeader(battle: battle),
          AppStyles.sizedBox.height10,
          BoatBattleTeam(battle: battle),
          AppStyles.sizedBox.height8,
          BoatBattleStatus(battle: battle),
        ],
      ),
    );
  }
}
