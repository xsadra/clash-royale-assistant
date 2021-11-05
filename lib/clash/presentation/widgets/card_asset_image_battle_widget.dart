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
    double cardWidth = MediaQuery.of(context).size.width / 9.5;
    return SizedBox(
      height: cardWidth + 36, //Fix Step: move to CONSTANTS
      width: cardWidth,
      child: Column(
        children: [
          AppAssets.toWidget.cardToImage(card: card),
          Text(
            card.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyles.battles.tileBattleTeamCardNameTextStyle,
          ),
        ],
      ),
    );
  }
}
