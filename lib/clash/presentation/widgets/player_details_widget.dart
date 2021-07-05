import 'package:flutter/material.dart' hide Card;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/constants/consts.dart';
import '../../domain/entities/card.dart';
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
            header:
                StatHeader(icon: Icons.ac_unit, title: AppTexts.ui.trophies),
            tiles: [
              StatTile(
                  field: AppTexts.ui.bestTrophiesCol,
                  value: player.bestTrophies.toString()),
              StatTile(
                  field: AppTexts.ui.trophiesCol,
                  value: player.trophies.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: Icons.account_balance, title: AppTexts.ui.battleStats),
            tiles: [
              StatTile(
                  field: AppTexts.ui.winsCol, value: player.wins.toString()),
              StatTile(
                  field: AppTexts.ui.lossesCol,
                  value: player.losses.toString()),
              StatTile(
                  field: AppTexts.ui.threeCrownWinsCol,
                  value: player.threeCrownWins.toString()),
              StatTile(
                  field: AppTexts.ui.battleCountCol,
                  value: player.battleCount.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header:
                StatHeader(icon: Icons.data_usage, title: AppTexts.ui.donation),
            tiles: [
              StatTile(
                field: AppTexts.ui.donationsBalanceCol,
                value: (player.donations - player.donationsReceived) > 0
                    ? AppTexts.ui.plus +
                        (player.donations - player.donationsReceived).toString()
                    : (player.donations - player.donationsReceived).toString(),
              ),
              StatTile(
                  field: AppTexts.ui.donationsCol,
                  value: player.donations.toString()),
              StatTile(
                  field: AppTexts.ui.donationsReceivedCol,
                  value: player.donationsReceived.toString()),
              StatTile(
                  field: AppTexts.ui.totalDonationsCol,
                  value: player.totalDonations.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: Icons.data_usage, title: AppTexts.ui.leagueSeason),
            tiles: [
              StatTile(field: AppTexts.ui.arenaCol, value: player.arena.name),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
              title: AppTexts.ui.challengeAndTournament,
              icon: Icons.toys_rounded,
            ),
            tiles: [
              StatTile(
                  field: AppTexts.ui.warDayWinsCol,
                  value: player.warDayWins.toString()),
              StatTile(
                  field: AppTexts.ui.clanCardsCollectedCol,
                  value: player.clanCardsCollected.toString()),
              StatTile(
                  field: AppTexts.ui.challengeCardsWonCol,
                  value: player.challengeCardsWon.toString()),
              StatTile(
                  field: AppTexts.ui.challengeMaxWinsCol,
                  value: player.challengeMaxWins.toString()),
              StatTile(
                  field: AppTexts.ui.tournamentCardsWonCol,
                  value: player.tournamentCardsWon.toString()),
              StatTile(
                  field: AppTexts.ui.tournamentBattleCountCol,
                  value: player.tournamentBattleCount.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header:
                StatHeader(icon: Icons.data_usage, title: AppTexts.ui.warOld),
            tiles: [
              StatTile(
                  field: AppTexts.ui.warDayWinsCol,
                  value: player.warDayWins.toString()),
              StatTile(
                  field: AppTexts.ui.clanCardsCollectedCol,
                  value: player.clanCardsCollected.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header:
                StatHeader(icon: Icons.info, title: AppTexts.ui.currentSeason),
            tiles: [
              StatTile(
                  field: AppTexts.ui.trophiesCol,
                  value: player.leagueStatistics.currentSeason.trophies
                      .toString()),
              StatTile(
                  field: AppTexts.ui.bestTrophiesCol,
                  value: player.leagueStatistics.currentSeason.bestTrophies
                      .toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: Icons.all_inclusive_sharp,
                title: AppTexts.ui.previousSeason),
            tiles: [
              StatTile(
                  field: AppTexts.ui.dateCol,
                  value: player.leagueStatistics.previousSeason.id.toString()),
              StatTile(
                  field: AppTexts.ui.trophiesCol,
                  value: player.leagueStatistics.previousSeason.trophies
                      .toString()),
              StatTile(
                  field: AppTexts.ui.bestTrophiesCol,
                  value: player.leagueStatistics.previousSeason.bestTrophies
                      .toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: Icons.add_alert, title: AppTexts.ui.bestSeason),
            tiles: [
              StatTile(
                  field: AppTexts.ui.bestTrophiesCol,
                  value: player.leagueStatistics.bestSeason.id.toString()),
              StatTile(
                  field: AppTexts.ui.trophiesCol,
                  value:
                      player.leagueStatistics.bestSeason.trophies.toString()),
            ],
          ),
          AppWidgets.sizedBox.height6,
          Column(
            children: [
              Row(
                children: [
                  StatHeader(icon: Icons.deck, title: AppTexts.ui.currentDeck),
                  Text(
                    AppTexts.ui.arrowFavoriteCardCol,
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
