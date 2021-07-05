import 'package:flutter/material.dart' hide Card;
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/consts.dart';
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
      padding: AppStyles.padding.symmetricH4,
      child: Column(
        crossAxisAlignment: teamType == TeamMemberType.Team
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            team.name,
            style: AppStyles.battles.tileBattleTeamNameTextStyle,
          ),
          if (!team.hasClan)
            Text(
              AppTexts.ui.hasNoClan,
              style: AppStyles.battles.tileBattleTeamHasNoClanNameTextStyle,
            ),
          if (team.hasClan) DisplayClanName(teamType: teamType, team: team),
          AppStyles.sizedBox.height2,
          if (showTrophies)
            DisplayMemberTrophies(teamType: teamType, team: team),
          AppStyles.sizedBox.height8,
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
          if (team.canShareDeck) ShareDeck(teamType: teamType, team: team),
        ],
      ),
    );
  }
}

class DisplayClanName extends StatelessWidget {
  const DisplayClanName({
    Key key,
    @required this.teamType,
    @required this.team,
  }) : super(key: key);

  final TeamMemberType teamType;
  final TeamMember team;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (teamType == TeamMemberType.Team)
          AppAssets.toWidget.clanBadgeIdToImage(
            team.clan.badgeId,
            size: AppStyles.battles.tileBattleTeamClanIconSize,
          ),
        AppStyles.sizedBox.width4,
        Text(
          team.clan.name,
          style: AppStyles.battles.tileBattleTeamClanNameTextStyle,
        ),
        AppStyles.sizedBox.width4,
        if (teamType == TeamMemberType.opponent)
          AppAssets.toWidget.clanBadgeIdToImage(
            team.clan.badgeId,
            size: AppStyles.battles.tileBattleTeamClanIconSize,
          ),
      ],
    );
  }
}

class DisplayMemberTrophies extends StatelessWidget {
  const DisplayMemberTrophies({
    Key key,
    @required this.teamType,
    @required this.team,
  }) : super(key: key);

  final TeamMemberType teamType;
  final TeamMember team;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppStyles.sizedBox.width4,
        if (teamType == TeamMemberType.Team)
          Image.asset(
            AppAssets.paths.trophy,
            height: AppStyles.battles.tileBattleTeamClanTrophiesIconSize,
            width: AppStyles.battles.tileBattleTeamClanTrophiesIconSize,
          ),
        AppStyles.sizedBox.width7,
        Text(
          team.startingTrophies.toString(),
          style: AppStyles.battles.tileBattleTeamClanStartingTrophiesTextStyle,
        ),
        AppStyles.sizedBox.width7,
        if (teamType == TeamMemberType.opponent)
          Image.asset(
            AppAssets.paths.trophy,
            height: AppStyles.battles.tileBattleTeamClanTrophiesIconSize,
            width: AppStyles.battles.tileBattleTeamClanTrophiesIconSize,
          ),
        AppStyles.sizedBox.width3,
      ],
    );
  }
}

class ShareDeck extends StatelessWidget {
  const ShareDeck({
    Key key,
    @required this.teamType,
    @required this.team,
  }) : super(key: key);

  final TeamMemberType teamType;
  final TeamMember team;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppStyles.sizedBox.width4,
        if (teamType == TeamMemberType.Team)
          InkWell(
            onTap: () => launch(team.shareDeckUrl),
            child: Icon(
              Icons.ios_share,
              color: AppColors.battles.tileBattleTeamShareDeckIconColor,
            ),
          ),
        if (teamType == TeamMemberType.opponent)
          InkWell(
            onTap: () => launch(team.shareDeckUrl),
            child: Icon(
              Icons.ios_share,
              color: AppColors.battles.tileBattleTeamShareDeckIconColor,
            ),
          ),
        AppStyles.sizedBox.width3,
      ],
    );
  }
}
