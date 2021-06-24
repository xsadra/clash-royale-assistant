import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import '../../../core/enums/enums_with_extensions.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/battle.dart';
import 'widgets.dart';

class BattleListTile extends StatelessWidget {
  final Battle battle;

  const BattleListTile({Key key, this.battle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (battle.type == BattleType.challenge.name) {
      return BattlePvPItemWidget(battle: battle);
    } else if (battle.type == BattleType.riverRacePvP.name) {
      return BattlePvPItemWidget(battle: battle);
    } else if (battle.type == BattleType.PvP.name) {
      return BattlePvPItemWidget(battle: battle);
    } else if (battle.type == BattleType.boatBattle.name) {
      return BattlePvPItemWidget(battle: battle);
    } else if (battle.type == BattleType.casual2v2.name) {
      return Battle2V2ItemWidget(battle: battle);
    } else if (battle.type == BattleType.riverRaceDuel.name) {
      return BattleRiverRaceDuelItemWidget(battle: battle);
    } else if (battle.type == BattleType.casual1v1.name) {
      // return BattlePvPItemWidget(battle: battle);
      return Container();
    } else
      return Container(child: Text(battle.type));
  }
}

List<Widget> generateBattleItemHeader({@required Battle battle}) {
  return [
    Text(
      battle.gameModeNameFormatted,
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.9,
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.paths.crownBlue,
          height: 24,
          width: 24,
        ),
        AppWidgets.sizedBox.width6,
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: battle.teamCrowns.toString(),
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: ' - ',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: battle.opponentCrowns.toString(),
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ],
        )),
        AppWidgets.sizedBox.width6,
        Image.asset(
          AppAssets.paths.crownRed,
          height: 24,
          width: 24,
        ),
      ],
    ),
    if (battle.isDisplayTeamWin) TeamWinCounterDisplayWidget(battle: battle),
  ];
}

class BattlePvPItemWidget extends StatelessWidget {
  const BattlePvPItemWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: battle.resultBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ...generateBattleItemHeader(battle: battle),
          AppWidgets.sizedBox.height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TeamMemberWidget(
                team: battle.team1,
                teamType: TeamMemberType.Team,
                showTrophies: battle.hasTrophies,
              ),
              TeamMemberWidget(
                team: battle.opponent1,
                teamType: TeamMemberType.opponent,
                showTrophies: battle.hasTrophies,
              ),
            ],
          ),
          AppWidgets.sizedBox.height8,
          BattleStatus(
            didWin: battle.didTeamWin,
            statusColor: battle.resultStatsColor,
            result: battle.battleResultTitle,
            battleTime: battle.timeAgo,
          ),
        ],
      ),
    );
  }
}

class Battle2V2ItemWidget extends StatelessWidget {
  const Battle2V2ItemWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    List<Widget> battleHeader = [
      Text(
        battle.gameModeName.replaceAll('_', ' '),
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.9,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.paths.crownBlue,
            height: 24,
            width: 24,
          ),
          AppWidgets.sizedBox.width6,
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: (battle.team1.crowns ?? 0).toString(),
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: ' - ',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: (battle.opponent1.crowns ?? 0).toString(),
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
            ],
          )),
          AppWidgets.sizedBox.width6,
          Image.asset(
            AppAssets.paths.crownRed,
            height: 24,
            width: 24,
          ),
        ],
      ),
      if (battle.isDisplayTeamWin) TeamWinCounterDisplayWidget(battle: battle),
    ];
    return Container(
      color: battle.didTeamWin ? Colors.green.shade100 : Colors.red.shade50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ...battleHeader,
          AppWidgets.sizedBox.height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TeamMemberWidget(
                team: battle.team1,
                teamType: TeamMemberType.Team,
                showTrophies: battle.hasTrophies,
              ),
              TeamMemberWidget(
                team: battle.opponent1,
                teamType: TeamMemberType.opponent,
                showTrophies: battle.hasTrophies,
              ),
            ],
          ),
          AppWidgets.sizedBox.height12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TeamMemberWidget(
                team: battle.team2,
                teamType: TeamMemberType.Team,
                showTrophies: battle.hasTrophies,
              ),
              TeamMemberWidget(
                team: battle.opponent2,
                teamType: TeamMemberType.opponent,
                showTrophies: battle.hasTrophies,
              ),
            ],
          ),
          AppWidgets.sizedBox.height8,
          BattleStatus(
            didWin: battle.didTeamWin,
            statusColor: battle.resultStatsColor,
            result: battle.battleResult.title,
            battleTime: battle.timeAgo,
          ),
        ],
      ),
    );
  }
}

class BattleRiverRaceDuelItemWidget extends StatelessWidget {
  const BattleRiverRaceDuelItemWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    List<Widget> battleHeader = [
      Text(
        battle.gameModeNameFormatted,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.9,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.paths.crownBlue,
            height: 24,
            width: 24,
          ),
          AppWidgets.sizedBox.width6,
          if (battle.isDisplayTeamWin)
            TeamWinCounterDisplayWidget(battle: battle),
          AppWidgets.sizedBox.width6,
          Image.asset(
            AppAssets.paths.crownRed,
            height: 24,
            width: 24,
          ),
        ],
      ),
    ];
    return Container(
      color: battle.resultBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ...battleHeader,
          AppWidgets.sizedBox.height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      battle.team1.name,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        AppAssets.toWidget.clanBadgeIdToImage(
                            battle.team1.clan.badgeId,
                            size: 18),
                        AppWidgets.sizedBox.width4,
                        Text(
                          battle.team1.clan.name,
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    AppWidgets.sizedBox.height8,
                    Row(
                      children: [
                        CardAssetImageBattle(card: battle.team1.cards[0]),
                        CardAssetImageBattle(card: battle.team1.cards[1]),
                        CardAssetImageBattle(card: battle.team1.cards[2]),
                        CardAssetImageBattle(card: battle.team1.cards[3]),
                      ],
                    ),
                    Row(
                      children: [
                        CardAssetImageBattle(card: battle.team1.cards[4]),
                        CardAssetImageBattle(card: battle.team1.cards[5]),
                        CardAssetImageBattle(card: battle.team1.cards[6]),
                        CardAssetImageBattle(card: battle.team1.cards[7]),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      battle.opponent1.name,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        AppWidgets.sizedBox.width4,
                        Text(
                          battle.opponent1.clan.name,
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        AppWidgets.sizedBox.width4,
                        AppAssets.toWidget.clanBadgeIdToImage(
                            battle.opponent1.clan.badgeId,
                            size: 18),
                      ],
                    ),
                    AppWidgets.sizedBox.height8,
                    Row(
                      children: [
                        CardAssetImageBattle(card: battle.opponent1.cards[0]),
                        CardAssetImageBattle(card: battle.opponent1.cards[1]),
                        CardAssetImageBattle(card: battle.opponent1.cards[2]),
                        CardAssetImageBattle(card: battle.opponent1.cards[3]),
                      ],
                    ),
                    Row(
                      children: [
                        CardAssetImageBattle(card: battle.opponent1.cards[4]),
                        CardAssetImageBattle(card: battle.opponent1.cards[5]),
                        CardAssetImageBattle(card: battle.opponent1.cards[6]),
                        CardAssetImageBattle(card: battle.opponent1.cards[7]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ), //
          AppWidgets.sizedBox.height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      battle.team1.name,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        AppAssets.toWidget.clanBadgeIdToImage(
                          battle.team1.clan.badgeId,
                          size: 18,
                        ),
                        AppWidgets.sizedBox.width4,
                        Text(
                          battle.team1.clan.name,
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    AppWidgets.sizedBox.height8,
                    Row(
                      children: [
                        CardAssetImageBattle(card: battle.team1.cards[8]),
                        CardAssetImageBattle(card: battle.team1.cards[9]),
                        CardAssetImageBattle(card: battle.team1.cards[10]),
                        CardAssetImageBattle(card: battle.team1.cards[11]),
                      ],
                    ),
                    Row(
                      children: [
                        CardAssetImageBattle(card: battle.team1.cards[12]),
                        CardAssetImageBattle(card: battle.team1.cards[13]),
                        CardAssetImageBattle(card: battle.team1.cards[14]),
                        CardAssetImageBattle(card: battle.team1.cards[15]),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      battle.opponent1.name,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        AppWidgets.sizedBox.width4,
                        Text(
                          battle.opponent1.clan.name,
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        AppWidgets.sizedBox.width4,
                        AppAssets.toWidget.clanBadgeIdToImage(
                            battle.opponent1.clan.badgeId,
                            size: 18),
                      ],
                    ),
                    AppWidgets.sizedBox.height8,
                    Row(
                      children: [
                        CardAssetImageBattle(card: battle.opponent1.cards[8]),
                        CardAssetImageBattle(card: battle.opponent1.cards[9]),
                        CardAssetImageBattle(card: battle.opponent1.cards[10]),
                        CardAssetImageBattle(card: battle.opponent1.cards[11]),
                      ],
                    ),
                    Row(
                      children: [
                        CardAssetImageBattle(card: battle.opponent1.cards[12]),
                        CardAssetImageBattle(card: battle.opponent1.cards[13]),
                        CardAssetImageBattle(card: battle.opponent1.cards[14]),
                        CardAssetImageBattle(card: battle.opponent1.cards[15]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ), //
          if (battle.team1.cards[16] != null) ...[
            AppWidgets.sizedBox.height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        battle.team1.name,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          AppAssets.toWidget.clanBadgeIdToImage(
                              battle.team1.clan.badgeId,
                              size: 18),
                          AppWidgets.sizedBox.width4,
                          Text(
                            battle.team1.clan.name,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      AppWidgets.sizedBox.height8,
                      Row(
                        children: [
                          CardAssetImageBattle(card: battle.team1.cards[16]),
                          CardAssetImageBattle(card: battle.team1.cards[17]),
                          CardAssetImageBattle(card: battle.team1.cards[18]),
                          CardAssetImageBattle(card: battle.team1.cards[19]),
                        ],
                      ),
                      Row(
                        children: [
                          CardAssetImageBattle(card: battle.team1.cards[20]),
                          CardAssetImageBattle(card: battle.team1.cards[21]),
                          CardAssetImageBattle(card: battle.team1.cards[22]),
                          CardAssetImageBattle(card: battle.team1.cards[23]),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        battle.opponent1.name,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          AppWidgets.sizedBox.width4,
                          Text(
                            battle.opponent1.clan.name,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          AppWidgets.sizedBox.width4,
                          AppAssets.toWidget.clanBadgeIdToImage(
                              battle.opponent1.clan.badgeId,
                              size: 18),
                        ],
                      ),
                      AppWidgets.sizedBox.height8,
                      Row(
                        children: [
                          CardAssetImageBattle(
                              card: battle.opponent1.cards[16]),
                          CardAssetImageBattle(
                              card: battle.opponent1.cards[17]),
                          CardAssetImageBattle(
                              card: battle.opponent1.cards[18]),
                          CardAssetImageBattle(
                              card: battle.opponent1.cards[19]),
                        ],
                      ),
                      Row(
                        children: [
                          CardAssetImageBattle(
                              card: battle.opponent1.cards[20]),
                          CardAssetImageBattle(
                              card: battle.opponent1.cards[21]),
                          CardAssetImageBattle(
                              card: battle.opponent1.cards[22]),
                          CardAssetImageBattle(
                              card: battle.opponent1.cards[23]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          AppWidgets.sizedBox.height12,
          BattleStatus(
            didWin: battle.didTeamWin,
            statusColor: battle.resultStatsColor,
            result: battle.battleResult.title,
            battleTime: battle.timeAgo,
          ),
        ],
      ),
    );
  }
}

class BattleStatus extends StatelessWidget {
  const BattleStatus({
    Key key,
    @required this.didWin,
    @required this.statusColor,
    @required this.result,
    @required this.battleTime,
  }) : super(key: key);

  final bool didWin;
  final Color statusColor;
  final String result;
  final String battleTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            didWin ? Icons.thumb_up : Icons.thumb_down,
            size: 12,
            color: statusColor,
          ),
          AppWidgets.sizedBox.width2,
          Text(
            result,
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: statusColor,
            ),
          ),
          AppWidgets.sizedBox.width10,
          Icon(
            Icons.timer_sharp,
            size: 12,
            color: Colors.blueAccent,
          ),
          AppWidgets.sizedBox.width2,
          Text(
            battleTime,
            style: TextStyle(
              fontSize: 10.0,
              fontStyle: FontStyle.italic,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class TeamWinCounterDisplayWidget extends StatelessWidget {
  const TeamWinCounterDisplayWidget({
    Key key,
    @required this.battle,
  }) : super(key: key);

  final Battle battle;

  @override
  Widget build(BuildContext context) {
    final TextStyle winsStyle = TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.red, blurRadius: 2, offset: Offset(1, 1)),
        Shadow(color: Colors.black, blurRadius: 4, offset: Offset(1, -1)),
        Shadow(color: Colors.black, blurRadius: 2, offset: Offset(-1, 1)),
        Shadow(color: Colors.black, blurRadius: 2, offset: Offset(-1, -1)),
      ],
    );
    return RichText(
      text: TextSpan(
        children: [
          if (battle.isDisplayPreviousTeamWinNumber)
            TextSpan(
              text: battle.winCount,
              style: winsStyle,
            ),
          if (battle.didTeamWin)
            TextSpan(
              text: ' +1',
              style: winsStyle,
            ),
          TextSpan(
            text: battle.winCountText,
            style: winsStyle,
          ),
        ],
      ),
    );
  }
}
