import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/constants/consts.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/card.dart';
import '../bloc/player/bloc.dart';
import '../bloc/version_checker/bloc.dart' as version;
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
          BlocBuilder<version.VersionCheckerBloc, version.VersionCheckerState>(
            builder: (context, state) {
              if (state is version.Loading) {
                return Center(
                  child: const CircularProgressIndicator(
                      color: const Color(0xFF4CAF50)),
                );
              } else if (state is version.Hidden) {
                return EmptyContainer();
              } else if (state is version.Loaded) {
                final versionInfo = state.version;
                return UpdateNotificationWidget(versionInfo: versionInfo);
              }
              return EmptyContainer();
            },
          ),
          PlayerName(player: player),
          AppStyles.sizedBox.height4,
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: UserClanName(player: player),
          ),
          AppStyles.sizedBox.height8,
          Stat(
            header: StatHeader(
                icon: AppAssets.imageIcons.trophy(),
                title: AppTexts.ui.trophies),
            tiles: [
              StatTile(
                  field: AppTexts.ui.bestTrophiesCol,
                  value: player.bestTrophies.toString()),
              StatTile(
                  field: AppTexts.ui.trophiesCol,
                  value: player.trophies.toString()),
            ],
          ),
          AppStyles.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: AppAssets.imageIcons.battle(),
                title: AppTexts.ui.battleStats),
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
          AppStyles.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: AppAssets.imageIcons.donate(),
                title: AppTexts.ui.donation),
            tiles: [
              StatTile(
                field: AppTexts.ui.donationsBalanceCol,
                value: (player.donations - player.donationsReceived) > 0
                    ? AppTexts.ui.plus +
                        (player.donations - player.donationsReceived).toString()
                    : (player.donations - player.donationsReceived).toString(),
                valueColor: (player.donations - player.donationsReceived) > 0
                    ? Colors.green
                    : Colors.red,
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
          AppStyles.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: AppAssets.imageIcons.league(),
                title: AppTexts.ui.leagueSeason),
            tiles: [
              StatTile(field: AppTexts.ui.arenaCol, value: player.arena.name),
            ],
          ),
          AppStyles.sizedBox.height6,
          Stat(
            header: StatHeader(
              title: AppTexts.ui.challengeAndTournament,
              icon: AppAssets.imageIcons.tournament(),
            ),
            tiles: [
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
          AppStyles.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: AppAssets.imageIcons.clanWars(),
                title: AppTexts.ui.warOld),
            tiles: [
              StatTile(
                  field: AppTexts.ui.warDayWinsCol,
                  value: player.warDayWins.toString()),
              StatTile(
                  field: AppTexts.ui.clanCardsCollectedCol,
                  value: player.clanCardsCollected.toString()),
            ],
          ),
          AppStyles.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: AppAssets.imageIcons.currentSeason(),
                title: AppTexts.ui.currentSeason),
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
          AppStyles.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: AppAssets.imageIcons.prevSeason(),
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
          AppStyles.sizedBox.height6,
          Stat(
            header: StatHeader(
                icon: AppAssets.imageIcons.bestSeason(),
                title: AppTexts.ui.bestSeason),
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
          AppStyles.sizedBox.height6,
          Column(
            children: [
              Row(
                children: [
                  StatHeader(
                      icon: AppAssets.imageIcons.deck(),
                      title: AppTexts.ui.currentDeck),
                  Text(
                    AppTexts.ui.arrowFavoriteCardCol,
                    style: TextStyle(fontSize: 12, color: Colors.purple),
                  ),
                  Text(
                    player.currentFavouriteCard.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              AppStyles.sizedBox.height6,
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
          AppStyles.sizedBox.height20,
        ],
      ),
    );
  }
}
