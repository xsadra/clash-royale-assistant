import 'dart:developer';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:clash_royale_assistant/clash/presentation/widgets/cards_chart.dart';
import 'package:collection/collection.dart' show groupBy;
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/entities/player.dart';
import '../../presentation/bloc/player/bloc.dart';
import 'widgets.dart';

class CardsDetails extends StatelessWidget {
  const CardsDetails({Key key, this.state}) : super(key: key);
  final Loaded state;

  @override
  Widget build(BuildContext context) {
    // Step move all logic to a controller class
    var cards = state.player.cards;
    cards.sort((b, a) =>
        (a.level + 13 - a.maxLevel).compareTo(b.level + 13 - b.maxLevel));
    var newList = groupBy(
        cards, (card) => (card as Card).level + 13 - (card as Card).maxLevel);
    int currentDeckColumnCount = 4;
    var cardsChartData = newList.keys
        .map((e) => CardsChartData('Level ' + e.toString(), newList[e].length))
        .toList();
    final _colorPalettes =
        charts.MaterialPalette.getOrderedPalettes(newList.keys.length);
    var colorIndex = 0;
    log('Color Palette: ' + _colorPalettes.length.toString(),
        name: 'CardsDetails');

    final _colors = _colorPalettes
        .map((e) =>
            e.shadeDefault.hexString.replaceAll('#', '0xff').toUpperCase())
        .toList();
    log('Color Palette: [' + _colors.join(' ') + ']', name: 'CardsDetails');

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: CardsChart(
            chartData: cardsChartData,
            cardsCount: cards.length,
          ),
        ),
        for (var cardLevels in newList.keys) ...[
          Row(
            children: [
              StatHeader(
                icon: Icons.label_rounded,
                title: 'Level ' + cardLevels.toString(),
                color: Color(int.parse(_colors.elementAt(colorIndex))),
                textColor: Color(int.parse(_colors.elementAt(colorIndex++))),
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
                    duration: const Duration(milliseconds: 775),
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
