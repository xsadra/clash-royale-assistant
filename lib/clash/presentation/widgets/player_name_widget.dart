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
        AppStyles.sizedBox.width8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              player.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            AppStyles.sizedBox.height2,
            Text(
              player.role,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
            AppStyles.sizedBox.height4,
            Text(
              player.tag,
              style: TextStyle(fontSize: 9, color: Colors.green),
            ),
          ],
        ),
        if (player.expPoints > 0) ...[
          AppStyles.sizedBox.width16,
          Row(
            children: [
              Image.asset(AppAssets.paths.experience, width: 24, height: 24),
              AppStyles.sizedBox.width6,
              Text(
                player.expPoints.toString(),
                style: starPointTextStyle(Colors.lightBlue, hasShadow: false),
              ),
            ],
          ),
        ],
        if (player.starPoints > 0) ...[
          AppStyles.sizedBox.width16,
          Row(
            children: [
              Image.asset(AppAssets.paths.starLevel, width: 24, height: 24),
              AppStyles.sizedBox.width6,
              Text(
                player.starPoints.toString(),
                style: starPointTextStyle(Colors.yellow),
              ),
            ],
          ),
        ],
      ],
    );
  }

  TextStyle starPointTextStyle(
    Color color, {
    bool hasShadow = true,
  }) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: color,
      fontSize: 14,
      shadows: [
        if (hasShadow) ...[
          Shadow(color: Colors.black, blurRadius: 0, offset: Offset(1, 1)),
          Shadow(color: Colors.black, blurRadius: 6, offset: Offset(-1, -1)),
          Shadow(color: Colors.black, blurRadius: 6, offset: Offset(-1, 1)),
          Shadow(color: Colors.black, blurRadius: 0, offset: Offset(1, -1)),
        ],
      ],
    );
  }
}
