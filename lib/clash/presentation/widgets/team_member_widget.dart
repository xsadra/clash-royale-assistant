import 'package:clash_royale_assistant/core/constants/consts.dart';
import 'package:flutter/material.dart' hide Card;

import '../../../core/enums/enums_with_extensions.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/battle.dart';
import '../../domain/entities/card.dart';
import 'widgets.dart';

class TeamMemberWidget extends StatelessWidget {
  const TeamMemberWidget({
    Key key,
    @required this.team,
    @required this.teamType,
    @required this.showTrophies,
  }) : super(key: key);

  final TeamMember team;
  final TeamMemberType teamType;
  final bool showTrophies;

  @override
  Widget build(BuildContext context) {
    final List<Card> teamCards = team.cards;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: teamType == TeamMemberType.Team
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            team.name,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (team.hasClan)
            Row(
              children: [
                if (teamType == TeamMemberType.Team)
                  Assets.clanBadgeIdToImage(team.clan.badgeId, size: 18),
                AppWidgets.sizedBox.width4,
                Text(
                  team.clan.name,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                AppWidgets.sizedBox.width4,
                if (teamType == TeamMemberType.opponent)
                  Assets.clanBadgeIdToImage(team.clan.badgeId, size: 18),
              ],
            ),
          AppWidgets.sizedBox.height2,
          if (showTrophies)
            Row(
              children: [
                AppWidgets.sizedBox.width4,
                if (teamType == TeamMemberType.Team)
                  Image.asset(Assets.trophy, height: 12, width: 12),
                AppWidgets.sizedBox.width7,
                Text(
                  team.startingTrophies.toString(),
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.black87,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
                AppWidgets.sizedBox.width7,
                if (teamType == TeamMemberType.opponent)
                  Image.asset(Assets.trophy, height: 12, width: 12),
                AppWidgets.sizedBox.width3,
              ],
            ),
          AppWidgets.sizedBox.height8,
          Row(
            children: [
              CardAssetImageBattle(card: teamCards[0]),
              CardAssetImageBattle(card: teamCards[1]),
              CardAssetImageBattle(card: teamCards[2]),
              CardAssetImageBattle(card: teamCards[3]),
            ],
          ),
          Row(
            children: [
              CardAssetImageBattle(card: teamCards[4]),
              CardAssetImageBattle(card: teamCards[5]),
              CardAssetImageBattle(card: teamCards[6]),
              CardAssetImageBattle(card: teamCards[7]),
            ],
          ),
        ],
      ),
    );
  }
}
