import 'package:collection/collection.dart' show groupBy;
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/entities/profile.dart';
import '../../presentation/bloc/profile/bloc.dart';
import 'widgets.dart';

class CardsDetails extends StatelessWidget {
  const CardsDetails({Key key, this.state}) : super(key: key);
  final Loaded state;

  @override
  Widget build(BuildContext context) {
    var cards = state.profile.cards;
    cards.sort((b, a) =>
        (a.level + 13 - a.maxLevel).compareTo(b.level + 13 - b.maxLevel));
    var newList = groupBy(
        cards, (card) => (card as Card).level + 13 - (card as Card).maxLevel);
    int currentDeckColumnCount = 4;
    return Column(
      children: [
        for (var cardLevels in newList.keys) ...[
          Row(
            children: [
              StatHeader(
                icon: Icons.label_rounded,
                title: 'Level ' + cardLevels.toString(),
              ),
              Text(
                ' (${newList[cardLevels].length})',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          AnimationLimiter(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              shrinkWrap: true,
              crossAxisCount: currentDeckColumnCount,
              children: List.generate(
                newList[cardLevels].length,
                (int index) {
                  Card card = newList[cardLevels].elementAt(index);
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 575),
                    columnCount: currentDeckColumnCount,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: CardDeckItem(card: card),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
        SizedBox(height: 16),
      ],
    );
  }
}
