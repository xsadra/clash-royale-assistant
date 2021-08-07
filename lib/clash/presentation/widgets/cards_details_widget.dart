import 'package:charts_flutter/flutter.dart' as charts;
import 'package:collection/collection.dart' show groupBy;
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/constants/consts.dart';
import '../../domain/entities/card.dart';
import '../../presentation/bloc/player/bloc.dart';
import 'widgets.dart';

class CardsDetails extends StatelessWidget {
  const CardsDetails({Key key, this.state}) : super(key: key);
  final Loaded state;

  @override
  Widget build(BuildContext context) {
    // Step move all logic to a controller class
    var _cards = state.player.cards;
    _cards.sort((b, a) =>
        (a.level + 13 - a.maxLevel).compareTo(b.level + 13 - b.maxLevel));
    var _newList = groupBy(
        _cards, (card) => (card as Card).level + 13 - (card as Card).maxLevel);
    int currentDeckColumnCount = 4;
    var _cardsChartData = _newList.keys
        .map((e) => CardsChartData(
            AppTexts.ui.levelSpc + e.toString(), _newList[e].length))
        .toList();
    final _colorPalettes =
        charts.MaterialPalette.getOrderedPalettes(_newList.keys.length);
    var colorIndex = 0;

    final _colors = _colorPalettes
        .map((e) =>
            e.shadeDefault.hexString.replaceAll('#', '0xff').toUpperCase())
        .toList();

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: CardsChart(
            chartData: _cardsChartData,
            cardsCount: _cards.length,
          ),
        ),
        AppStyles.sizedBox.height(50),
        for (var cardLevels in _newList.keys)
          ..._createCard(cardLevels, _colors, colorIndex, _newList,
              currentDeckColumnCount),
        AppStyles.sizedBox.height16,
      ],
    );
  }

  List<Widget> _createCard(
    int cardLevel,
    List<String> colors,
    int colorIndex,
    Map<int, List<Card>> cardList,
    int columnCount,
  ) {
    return [
      Row(
        children: [
          StatHeader(
            icon: Icon(
              Icons.label_rounded,
              color: Color(int.parse(colors.elementAt(colorIndex))),
            ),
            title: AppTexts.ui.levelSpc + cardLevel.toString(),
            textColor: Color(int.parse(colors.elementAt(colorIndex++))),
          ),
          Text(
            ' (${cardList[cardLevel].length})',
            style: TextStyle(color: Colors.green),
          )
        ],
      ),
      AnimationLimiter(
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          shrinkWrap: true,
          crossAxisCount: columnCount,
          children: List.generate(
            cardList[cardLevel].length,
            (int index) {
              Card card = cardList[cardLevel].elementAt(index);
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 775),
                columnCount: columnCount,
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
    ];
  }
}
