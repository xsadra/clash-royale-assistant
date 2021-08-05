import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import '../../../core/extensions/extensions.dart';
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
        if (player.hasClan) ...[
          Text(player.clan.name),
          AppStyles.sizedBox.width4,
          Text(
            player.clan.tag,
            style: TextStyle(fontSize: 10, color: Colors.blueGrey),
          ),
          AppStyles.sizedBox.width4,
          Text(player.role),
        ],
        if (player.hasNotClan)
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Text(
              AppTexts.ui.hasNoClan,
              style: TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
          ),
      ],
    );
  }
}
