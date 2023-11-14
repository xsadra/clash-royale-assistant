import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import '../../domain/entities/battle.dart';
import '../../presentation/bloc/battles/bloc.dart';
import 'battle_list_tile.dart';

class BattlesDetails extends StatelessWidget {
  const BattlesDetails({Key? key, required this.state}) : super(key: key);
  final Loaded state;

  @override
  Widget build(BuildContext context) {
    List<Battle> _battles = state.battles.battles!;

    return ListView.builder(
      itemCount: _battles.length,
      itemBuilder: (context, index) {
        Battle battle = _battles[index];
        return Padding(
          padding: AppStyles.padding.symmetricV4,
          child: BattleListTile(battle: battle),
        );
      },
    );
  }
}
