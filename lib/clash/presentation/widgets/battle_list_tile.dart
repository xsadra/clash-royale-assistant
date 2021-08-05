import 'package:clash_royale_assistant/clash/presentation/widgets/battle_tile_boat.dart';
import 'package:flutter/material.dart' hide Card;

import '../../../core/enums/enums_with_extensions.dart';
import '../../../core/extensions/extensions.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class BattleListTile extends StatelessWidget {
  final Battle battle;

  const BattleListTile({
    Key key,
    this.battle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (battle.type == BattleType.challenge.name ||
            battle.type == BattleType.riverRacePvP.name ||
            battle.type == BattleType.PvP.name ||
            battle.type == BattleType.tournament.name ||
            battle.type == BattleType.casual1v1.name
        // ||
        // battle.type == BattleType.boatBattle.name
        ) {
      return BattlePvPItemWidget(battle: battle);
    } else if (battle.type == BattleType.boatBattle.name) {
      return BattleBoatItemWidget(battle: battle);
    } else if (battle.type == BattleType.casual2v2.name) {
      return Battle2V2ItemWidget(battle: battle);
    } else if (battle.type == BattleType.riverRaceDuel.name) {
      return BattleRiverRaceDuelItemWidget(battle: battle);
      // } else if (battle.type == BattleType.casual1v1.name) {
      //   return Container();
    } else
      return Container();
    // return Container(child: Text(battle.type));
  }
}
