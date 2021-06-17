import 'package:flutter/material.dart' hide Card;

import '../../../core/enums/enums_with_extensions.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/battle.dart';
import '../../domain/entities/card.dart';
import 'widgets.dart';

class TeamMemberWidget extends StatelessWidget {
  const TeamMemberWidget({
    Key key,
    @required this.team,
    @required this.teamType,
  }) : super(key: key);

  final TeamMember team;
  final TeamMemberType teamType;

  @override
  Widget build(BuildContext context) {
    final List<Card> teamCards = team.cards;
    return Container(
      color: teamType.color,
      child: Column(
        children: [
          Text(team.name),
          Row(
            children: [
              Assets.clanBadgeIdToImage(team.clan.badgeId, size: 24),
              Text(team.clan.name),
            ],
          ),
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
