import 'package:flutter/material.dart' hide Card;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/constants/consts.dart';
import '../../domain/entities/player.dart';
import '../../presentation/bloc/player/bloc.dart';
import 'widgets.dart';

class PlayerDetails extends StatelessWidget {
  final Loaded state;

  const PlayerDetails({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var player = state.player;
    int currentDeckColumnCount = 4;
    return SingleChildScrollView(
      child: Column(
        children: [
          PlayerName(player: player),
          AppWidgets.sizedBox.height4,
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: UserClanName(player: player),
          ),
          AppWidgets.sizedBox.height8,
          Stat(
            header: StatHeader(icon: Icons.ac_unit, title: AppUITexts.TROPHIES),
            tiles: [
              StatTile(
                  field: AppUITexts.BEST_TROPHIES_COL,
                  value: player.bestTrophies.toString()),
              StatTile(
                  field: AppUITexts.TROPHIES_COl,
                  value: player.trophies.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: Icons.account_balance, title: AppUITexts.BATTLE_STATS),
            tiles: [
              StatTile(
                  field: AppUITexts.WINS_COL, value: player.wins.toString()),
              StatTile(
                  field: AppUITexts.LOSSES_COL,
                  value: player.losses.toString()),
              StatTile(
                  field: AppUITexts.THREE_CROWN_WINS_COL,
                  value: player.threeCrownWins.toString()),
              StatTile(
                  field: AppUITexts.BATTLE_COUNT_COL,
                  value: player.battleCount.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header:
                StatHeader(icon: Icons.data_usage, title: AppUITexts.DONATION),
            tiles: [
              StatTile(
                field: AppUITexts.DONATIONS_BALANCE_COL,
                value: (player.donations - player.donationsReceived) > 0
                    ? AppUITexts.PLUS +
                        (player.donations - player.donationsReceived).toString()
                    : (player.donations - player.donationsReceived).toString(),
              ),
              StatTile(
                  field: AppUITexts.DONATIONS_COL,
                  value: player.donations.toString()),
              StatTile(
                  field: AppUITexts.DONATIONS_RECEIVED_COL,
                  value: player.donationsReceived.toString()),
              StatTile(
                  field: AppUITexts.TOTAL_DONATIONS_COL,
                  value: player.totalDonations.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: Icons.data_usage, title: AppUITexts.LEAGUE_SEASON),
            tiles: [
              StatTile(field: AppUITexts.ARENA_COL, value: player.arena.name),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
              title: AppUITexts.CHALLENGE_AND_TOURNAMENT,
              icon: Icons.toys_rounded,
            ),
            tiles: [
              StatTile(
                  field: AppUITexts.WAR_DAY_WINS_COL,
                  value: player.warDayWins.toString()),
              StatTile(
                  field: AppUITexts.CLAN_CARDS_COLLECTED_COL,
                  value: player.clanCardsCollected.toString()),
              StatTile(
                  field: AppUITexts.CHALLENGE_CARDS_WON_COL,
                  value: player.challengeCardsWon.toString()),
              StatTile(
                  field: AppUITexts.CHALLENGE_MAX_WINS_COL,
                  value: player.challengeMaxWins.toString()),
              StatTile(
                  field: AppUITexts.TOURNAMENT_CARDS_WON_COL,
                  value: player.tournamentCardsWon.toString()),
              StatTile(
                  field: AppUITexts.TOURNAMENT_BATTLE_COUNT_COL,
                  value: player.tournamentBattleCount.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header:
                StatHeader(icon: Icons.data_usage, title: AppUITexts.WAR_OLD),
            tiles: [
              StatTile(
                  field: AppUITexts.WAR_DAY_WINS_COL,
                  value: player.warDayWins.toString()),
              StatTile(
                  field: AppUITexts.CLAN_CARDS_COLLECTED_COL,
                  value: player.clanCardsCollected.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header:
                StatHeader(icon: Icons.info, title: AppUITexts.CURRENT_SEASON),
            tiles: [
              StatTile(
                  field: AppUITexts.TROPHIES_COl,
                  value: player.leagueStatistics.currentSeason.trophies
                      .toString()),
              StatTile(
                  field: AppUITexts.BEST_TROPHIES_COL,
                  value: player.leagueStatistics.currentSeason.bestTrophies
                      .toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: Icons.all_inclusive_sharp,
                title: AppUITexts.PREVIOUS_SEASON),
            tiles: [
              StatTile(
                  field: AppUITexts.DATE_COL,
                  value: player.leagueStatistics.previousSeason.id.toString()),
              StatTile(
                  field: AppUITexts.TROPHIES_COl,
                  value: player.leagueStatistics.previousSeason.trophies
                      .toString()),
              StatTile(
                  field: AppUITexts.BEST_TROPHIES_COL,
                  value: player.leagueStatistics.previousSeason.bestTrophies
                      .toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: Icons.add_alert, title: AppUITexts.BEST_SEASON),
            tiles: [
              StatTile(
                  field: AppUITexts.BEST_TROPHIES_COL,
                  value: player.leagueStatistics.bestSeason.id.toString()),
              StatTile(
                  field: AppUITexts.TROPHIES_COl,
                  value:
                      player.leagueStatistics.bestSeason.trophies.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Column(
            children: [
              Row(
                children: [
                  StatHeader(icon: Icons.deck, title: AppUITexts.CURRENT_DECK),
                  Text(
                    AppUITexts.ARROW_FAVORITE_CARD_COL,
                    style: TextStyle(fontSize: 12, color: Colors.purple),
                  ),
                  Text(
                    player.currentFavouriteCard.name,
                    style: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              AppWidgets.sizedBox.height6,
              AnimationLimiter(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  crossAxisCount: currentDeckColumnCount,
                  children: List.generate(
                    player.currentDeck.length,
                    (int index) {
                      Card card = player.currentDeck.elementAt(index);
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 575),
                        columnCount: currentDeckColumnCount,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: CardDeckItem(card: card),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          AppWidgets.sizedBox.height20,
        ],
      ),
    );
  }
}
