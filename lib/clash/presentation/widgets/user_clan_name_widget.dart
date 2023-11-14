import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/player.dart';

class UserClanName extends StatelessWidget {
  const UserClanName({
    Key? key,
    required this.player,
  }) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (player.hasClan) ...[
          AppAssets.toWidget.clanBadgeIdToImage(player.clan!.badgeId!, size: 32),
          AppStyles.sizedBox.width4,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.clan!.name!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                player.clan!.tag!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
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
