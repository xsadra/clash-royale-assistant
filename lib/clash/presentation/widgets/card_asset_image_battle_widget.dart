import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/card.dart';

class CardAssetImageBattle extends StatelessWidget {
  const CardAssetImageBattle({
    Key key,
    @required this.card,
  }) : super(key: key);

  final Card card;

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 9;
    return SizedBox(
      height: cardWidth + 35, //Fix Step: move to CONSTANTS
      width: cardWidth,
      child: Column(
        children: [
          AppAssets.toWidget.cardToImage(card: card),
          Text(
            card.name,
            textAlign: TextAlign.center,
            style: AppStyles.battles.tileBattleTeamCardNameTextStyle,
          ),
        ],
      ),
    );
  }
}
