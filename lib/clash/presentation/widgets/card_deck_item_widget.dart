import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/card.dart';

class CardDeckItem extends StatelessWidget {
  const CardDeckItem({
    Key key,
    @required this.card,
  }) : super(key: key);

  final Card card;
  static const int maxLvl = 14;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 86.0,
        width: 86.0,
        child: Tooltip(
          message: card.level == card.maxLevel
              ? 'Max Level'
              : 'Count: ' + card.count.toString(),
          triggerMode: TooltipTriggerMode.tap,
          verticalOffset: -65,
          child: Stack(
            children: [
              AppAssets.toWidget.cardToImage(card: card),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 60.0, top: 12),
                width: 76,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var index = 0;
                          index < (card.starLevel ?? 0);
                          index++)
                        Image.asset(AppAssets.paths.starLevel,
                            width: 20, height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 12.0, left: 9),
                width: 56,
                child: Text(
                  AppTexts.ui.levelSpc +
                      (card.level + maxLvl - card.maxLevel).toString(),
                  style: levelSpcTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get levelSpcTextStyle {
    return TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 3, offset: Offset(-2, 3)),
        Shadow(color: Colors.black, blurRadius: 5, offset: Offset(-2, 3)),
        Shadow(color: Colors.black, blurRadius: 10, offset: Offset(-2, 3)),
        Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, 1)),
        Shadow(color: Colors.black, blurRadius: 1, offset: Offset(-1, -1)),
        Shadow(color: Colors.black, blurRadius: 1, offset: Offset(-1, 1)),
        Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, -1)),
      ],
    );
  }
}
