import 'package:flutter/material.dart' hide Card;

import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/card.dart';

@Deprecated('Use [AppAssets.toWidget.cardToImage] instead')
class CardAssetImage extends StatelessWidget {
  const CardAssetImage({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Card card;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        Assets.cardToPath(card.name!, isGold: card.starLevel != null));
  }
}
