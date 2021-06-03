import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import '../../domain/entities/player.dart';

class UserClanName extends StatelessWidget {
  const UserClanName({
    Key key,
    @required this.player,
  }) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(player.clan.name),
        AppWidgets.sizedBox.width4,
        Text(
          player.clan.tag,
          style: TextStyle(fontSize: 10, color: Colors.blueGrey),
        ),
        AppWidgets.sizedBox.width4,
        Text(player.role),
      ],
    );
  }
}
