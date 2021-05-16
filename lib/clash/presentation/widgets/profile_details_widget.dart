import 'package:flutter/material.dart' hide Card;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/entities/profile.dart';
import '../../presentation/bloc/profile/bloc.dart';
import 'widgets.dart';

class ProfileDetails extends StatelessWidget {
  final Loaded state;

  const ProfileDetails({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = state.profile;
    int currentDeckColumnCount = 4;
    return SingleChildScrollView(
      child: Column(
        children: [
          UserProfileName(profile: profile),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: UserClanName(profile: profile),
          ),
          SizedBox(height: 8),
          Stat(
            header: StatHeader(icon: Icons.ac_unit, title: 'Trophies'),
            tiles: [
              StatTile(
                  field: 'Best Trophies: ',
                  value: profile.bestTrophies.toString()),
              StatTile(field: 'Trophies: ', value: profile.trophies.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header:
                StatHeader(icon: Icons.account_balance, title: 'Battle Stats'),
            tiles: [
              StatTile(field: 'Wins: ', value: profile.wins.toString()),
              StatTile(field: 'Losses: ', value: profile.losses.toString()),
              StatTile(
                  field: 'threeCrownWins: ',
                  value: profile.threeCrownWins.toString()),
              StatTile(
                  field: 'battleCount: ',
                  value: profile.battleCount.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.data_usage, title: 'Donation'),
            tiles: [
              StatTile(
                field: 'Donations balance: ',
                value: (profile.donations - profile.donationsReceived) > 0
                    ? '+' +
                        (profile.donations - profile.donationsReceived)
                            .toString()
                    : (profile.donations - profile.donationsReceived)
                        .toString(),
              ),
              StatTile(
                  field: 'Donations: ', value: profile.donations.toString()),
              StatTile(
                  field: 'Donations Received: ',
                  value: profile.donationsReceived.toString()),
              StatTile(
                  field: 'Total Donations: ',
                  value: profile.totalDonations.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.data_usage, title: 'League Season'),
            tiles: [
              StatTile(field: 'Arena: ', value: profile.arena.name),
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
                  field: 'War Day Wins: ',
                  value: profile.warDayWins.toString()),
              StatTile(
                  field: 'Clan Cards Collected: ',
                  value: profile.clanCardsCollected.toString()),
              StatTile(
                  field: 'Challenge Cards Won: ',
                  value: profile.challengeCardsWon.toString()),
              StatTile(
                  field: 'Challenge Max Wins: ',
                  value: profile.challengeMaxWins.toString()),
              StatTile(
                  field: 'Tournament Cards Won: ',
                  value: profile.tournamentCardsWon.toString()),
              StatTile(
                  field: 'Tournament Battle Count: ',
                  value: profile.tournamentBattleCount.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.data_usage, title: 'War (Old)'),
            tiles: [
              StatTile(
                  field: 'War Day Wins: ',
                  value: profile.warDayWins.toString()),
              StatTile(
                  field: 'Clan Cards Collected: ',
                  value: profile.clanCardsCollected.toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.info, title: 'Current Season'),
            tiles: [
              StatTile(
                  field: 'Trophies: ',
                  value: profile.leagueStatistics.currentSeason.trophies
                      .toString()),
              StatTile(
                  field: 'Best Trophies: ',
                  value: profile.leagueStatistics.currentSeason.bestTrophies
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
                  value: profile.leagueStatistics.previousSeason.id.toString()),
              StatTile(
                  field: 'Trophies: ',
                  value: profile.leagueStatistics.previousSeason.trophies
                      .toString()),
              StatTile(
                  field: 'Best Trophies: ',
                  value: profile.leagueStatistics.previousSeason.bestTrophies
                      .toString()),
            ],
          ),
          SizedBox(height: 6),
          Stat(
            header: StatHeader(icon: Icons.add_alert, title: 'Best Season'),
            tiles: [
              StatTile(
                  field: 'Best Trophies: ',
                  value: profile.leagueStatistics.bestSeason.id.toString()),
              StatTile(
                  field: 'Trophies: ',
                  value:
                      profile.leagueStatistics.bestSeason.trophies.toString()),
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
                    profile.currentFavouriteCard.name,
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
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  crossAxisCount: currentDeckColumnCount,
                  children: List.generate(
                    profile.currentDeck.length,
                    (int index) {
                      Card card = profile.currentDeck.elementAt(index);
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
