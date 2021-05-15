import 'package:clash_royale_assistant/clash/domain/entities/profile.dart';
import 'package:clash_royale_assistant/core/platform/assets_controller.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../bloc/profile/bloc.dart';
import 'widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is Empty) {
              return _emptyDisplay();
            } else if (state is Error) {
              return MessageDisplay(message: state.message);
            } else if (state is Loading) {
              return LoadingWidget();
            } else if (state is Loaded) {
              return _loadedDisplay(state);
            }
            return MessageDisplay(message: 'Unhandled State');
          },
        ),
      ),
    );
  }

  Widget _emptyDisplay() {
    return SingleChildScrollView(
      child: Column(
        children: [
          RefreshProfile(),
          MessageDisplay(message: 'No data'),
        ],
      ),
    );
  }

  Widget _loadedDisplay(Loaded state) {
    return ProfileDetails(state: state);
  }
}

class RefreshProfile extends StatelessWidget {
  const RefreshProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () =>
            context.read<ProfileBloc>().add(GetProfileEvent('%23PPGRVJJQ')),
        child: Icon(Icons.refresh),
      ),
    );
  }
}

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
            padding: const EdgeInsets.only(left: 36),
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

class CardDeckItem extends StatelessWidget {
  const CardDeckItem({
    Key key,
    @required this.card,
  }) : super(key: key);

  final Card card;

  @override
  Widget build(BuildContext context) {
    print(card.starLevel);
    return Center(
      child: Container(
        height: 86.0,
        width: 86.0,
        child: Stack(
          children: [
            Image.network(card.iconUrls.medium),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 60.0, top: 12),
              width: 76,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var index = 0; index < (card.starLevel ?? 0); index++)
                      Icon(Icons.stars, color: Colors.yellowAccent, size: 12),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 12.0, left: 9),
              width: 56,
              child: Text(
                'lvl ' + (card.level + 13 - card.maxLevel).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(-1, -1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(-1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(1, -1)),
                  ],
                ),
              ),
            ),
          ],
        ),
        // title: Text(chest.name),
        // trailing: Text((chest.index + 1).toString()),
        // leading: Image.asset(chestNameToPath(chest.name)),
      ),
    );
  }
}

class Stat extends StatelessWidget {
  const Stat({
    Key key,
    @required this.header,
    @required this.tiles,
  }) : super(key: key);

  final StatHeader header;
  final List<StatTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header,
        SizedBox(height: 4),
        for (var tile in tiles) tile,
      ],
    );
  }
}

class StatTile extends StatelessWidget {
  const StatTile({
    Key key,
    @required this.field,
    @required this.value,
  }) : super(key: key);

  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, bottom: 2),
      child: Row(
        children: [
          Text(
            field,
            style: TextStyle(fontSize: 13),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class StatHeader extends StatelessWidget {
  const StatHeader({
    @required this.icon,
    @required this.title,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class UserClanName extends StatelessWidget {
  const UserClanName({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(profile.clan.name),
        SizedBox(width: 4),
        Text(
          profile.clan.tag,
          style: TextStyle(fontSize: 10, color: Colors.blueGrey),
        ),
        SizedBox(width: 4),
        Text(profile.role),
      ],
    );
  }
}

class UserProfileName extends StatelessWidget {
  const UserProfileName({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileExperienceWidget(expLevel: profile.expLevel.toString()),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profile.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              profile.tag,
              style: TextStyle(fontSize: 9, color: Colors.green),
            ),
          ],
        )
      ],
    );
  }
}

class ProfileExperienceWidget extends StatelessWidget {
  const ProfileExperienceWidget({
    @required this.expLevel,
    Key key,
  }) : super(key: key);

  final String expLevel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.experience,
          height: 32,
          width: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1, bottom: 1),
          child: Text(
            expLevel,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
