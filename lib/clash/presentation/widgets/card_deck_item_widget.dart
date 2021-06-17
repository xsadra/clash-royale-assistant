import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/card.dart';
import 'widgets.dart';

class CardDeckItem extends StatelessWidget {
  const CardDeckItem({
    Key key,
    @required this.card,
  }) : super(key: key);

  final Card card;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 86.0,
        width: 86.0,
        child: Stack(
          children: [
            CardAssetImage(card: card),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 60.0, top: 12),
              width: 76,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var index = 0; index < (card.starLevel ?? 0); index++)
                      Image.asset(Assets.starLevel, width: 20, height: 20),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 12.0, left: 9),
              width: 56,
              child: Text(
                AppUITexts.LVL_SPC +
                    (card.level + 13 - card.maxLevel).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(-1, -1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(-1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(1, -1)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
