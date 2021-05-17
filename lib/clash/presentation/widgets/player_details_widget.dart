import 'package:flutter/material.dart' hide Card;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: UserClanName(player: player),
          ),
          SizedBox(height: 8),
          Stat(
            header: StatHeader(icon: Icons.ac_unit, title: 'Trophies'),
            tiles: [
              StatTile(
                  field: 'Best Trophies: ',
                  value: player.bestTrophies.toString()),
              StatTile(field: 'Trophies: ', value: player.trophies.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header:
                StatHeader(icon: Icons.account_balance, title: 'Battle Stats'),
            tiles: [
              StatTile(field: 'Wins: ', value: player.wins.toString()),
              StatTile(field: 'Losses: ', value: player.losses.toString()),
              StatTile(
                  field: 'threeCrownWins: ',
                  value: player.threeCrownWins.toString()),
              StatTile(
                  field: 'battleCount: ', value: player.battleCount.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.data_usage, title: 'Donation'),
            tiles: [
              StatTile(
                field: 'Donations balance: ',
                value: (player.donations - player.donationsReceived) > 0
                    ? '+' +
                        (player.donations - player.donationsReceived).toString()
                    : (player.donations - player.donationsReceived).toString(),
              ),
              StatTile(
                  field: 'Donations: ', value: player.donations.toString()),
              StatTile(
                  field: 'Donations Received: ',
                  value: player.donationsReceived.toString()),
              StatTile(
                  field: 'Total Donations: ',
                  value: player.totalDonations.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.data_usage, title: 'League Season'),
            tiles: [
              StatTile(field: 'Arena: ', value: player.arena.name),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(
              title: 'Challenge and Tournament',
              icon: Icons.toys_rounded,
            ),
            tiles: [
              StatTile(
                  field: 'War Day Wins: ', value: player.warDayWins.toString()),
              StatTile(
                  field: 'Clan Cards Collected: ',
                  value: player.clanCardsCollected.toString()),
              StatTile(
                  field: 'Challenge Cards Won: ',
                  value: player.challengeCardsWon.toString()),
              StatTile(
                  field: 'Challenge Max Wins: ',
                  value: player.challengeMaxWins.toString()),
              StatTile(
                  field: 'Tournament Cards Won: ',
                  value: player.tournamentCardsWon.toString()),
              StatTile(
                  field: 'Tournament Battle Count: ',
                  value: player.tournamentBattleCount.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.data_usage, title: 'War (Old)'),
            tiles: [
              StatTile(
                  field: 'War Day Wins: ', value: player.warDayWins.toString()),
              StatTile(
                  field: 'Clan Cards Collected: ',
                  value: player.clanCardsCollected.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.info, title: 'Current Season'),
            tiles: [
              StatTile(
                  field: 'Trophies: ',
                  value: player.leagueStatistics.currentSeason.trophies
                      .toString()),
              StatTile(
                  field: 'Best Trophies: ',
                  value: player.leagueStatistics.currentSeason.bestTrophies
                      .toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(
                icon: Icons.all_inclusive_sharp, title: 'Previous Season'),
            tiles: [
              StatTile(
                  field: 'Date: ',
                  value: player.leagueStatistics.previousSeason.id.toString()),
              StatTile(
                  field: 'Trophies: ',
                  value: player.leagueStatistics.previousSeason.trophies
                      .toString()),
              StatTile(
                  field: 'Best Trophies: ',
                  value: player.leagueStatistics.previousSeason.bestTrophies
                      .toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.add_alert, title: 'Best Season'),
            tiles: [
              StatTile(
                  field: 'Best Trophies: ',
                  value: player.leagueStatistics.bestSeason.id.toString()),
              StatTile(
                  field: 'Trophies: ',
                  value:
                      player.leagueStatistics.bestSeason.trophies.toString()),
            ],
          ),
          SizedBox(height: 6),
          Column(
            children: [
              Row(
                children: [
                  StatHeader(icon: Icons.deck, title: 'Current Deck'),
                  Text(
                    ' > Favorite Card: ',
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
              SizedBox(height: 6),
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
