import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/player.dart';
import 'widgets.dart';

class PlayerName extends StatelessWidget {
  const PlayerName({
    Key key,
    @required this.player,
  }) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PlayerExperienceWidget(expLevel: player.expLevel.toString()),
        AppWidgets.sizedBox.width8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              player.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            AppWidgets.sizedBox.height2,
            Text(
              player.tag,
              style: TextStyle(fontSize: 9, color: Colors.green),
            ),
          ],
        ),
        if (player.expLevel == 13) ...[
          AppWidgets.sizedBox.width16,
          Row(
            children: [
              Image.asset(Assets.starLevel, width: 24, height: 24),
              AppWidgets.sizedBox.width6,
              Text(
                player.starPoints.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(-1, -1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(-1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(1, -1)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
