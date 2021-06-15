import 'package:flutter/material.dart' hide Card;

import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/battle.dart';

class CardAssetImageBattle extends StatelessWidget {
  const CardAssetImageBattle({
    Key key,
    @required this.card,
  }) : super(key: key);

  final Card card;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      width: 30.0,
      child: Image.asset(
          Assets.cardToPath(card.name, isGold: card.starLevel != null)),
    );
  }
}
