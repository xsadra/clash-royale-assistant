import 'package:flutter/material.dart';

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
        SizedBox(width: 4),
        Text(
          player.clan.tag,
          style: TextStyle(fontSize: 10, color: Colors.blueGrey),
        ),
        SizedBox(width: 4),
        Text(player.role),
      ],
    );
  }
}
