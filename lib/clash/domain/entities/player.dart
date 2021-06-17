import 'package:meta/meta.dart';

import 'card.dart';

class Player {
  final String tag;
  final String name;
  final int expLevel;
  final int trophies;
  final int bestTrophies;
  final int wins;
  final int losses;
  final int battleCount;
  final int threeCrownWins;
  final int challengeCardsWon;
  final int challengeMaxWins;
  final int tournamentCardsWon;
  final int tournamentBattleCount;
  final String role;
  final int donations;
  final int donationsReceived;
  final int totalDonations;
  final int warDayWins;
  final int clanCardsCollected;
  final Clan clan;
  final Arena arena;
  final LeagueStatistics leagueStatistics;
  final List<Badge> badges;
  final List<Achievement> achievements;
  final List<Card> cards;
  final List<Card> currentDeck;
  final Card currentFavouriteCard;
  final int starPoints;

  const Player({
    @required this.tag,
    @required this.name,
    @required this.expLevel,
    @required this.trophies,
    @required this.bestTrophies,
    @required this.wins,
    @required this.losses,
    @required this.battleCount,
    @required this.threeCrownWins,
    @required this.challengeCardsWon,
    @required this.challengeMaxWins,
    @required this.tournamentCardsWon,
    @required this.tournamentBattleCount,
    @required this.role,
    @required this.donations,
    @required this.donationsReceived,
    @required this.totalDonations,
    @required this.warDayWins,
    @required this.clanCardsCollected,
    @required this.clan,
    @required this.arena,
    @required this.leagueStatistics,
    @required this.badges,
    @required this.achievements,
    @required this.cards,
    @required this.currentDeck,
    @required this.currentFavouriteCard,
    @required this.starPoints,
  });
}

class Clan {
  final String tag;
  final String name;
  final int badgeId;

  const Clan({
    @required this.tag,
    @required this.name,
    @required this.badgeId,
  });
}

class Arena {
  final int id;
  final String name;

  const Arena({
    @required this.name,
    @required this.id,
  });
}

class LeagueStatistics {
  final CurrentSeason currentSeason;
  final PreviousSeason previousSeason;
  final BestSeason bestSeason;

  const LeagueStatistics({
    @required this.currentSeason,
    @required this.previousSeason,
    @required this.bestSeason,
  });
}

class CurrentSeason {
  final int trophies;
  final int bestTrophies;

  const CurrentSeason({
    @required this.trophies,
    @required this.bestTrophies,
  });
}

class PreviousSeason {
  final String id;
  final int trophies;
  final int bestTrophies;

  const PreviousSeason({
    @required this.id,
    @required this.trophies,
    @required this.bestTrophies,
  });
}

class BestSeason {
  final String id;
  final int trophies;

  const BestSeason({
    @required this.id,
    @required this.trophies,
  });
}

// Fix Step - badge:
//             "name": "ClanWarWins",
//             "level": 3,
//             "maxLevel": 3,
//             "progress": 148

class Badge {
  final String name;
  final int progress;

  const Badge({
    @required this.name,
    @required this.progress,
  });
}

class Achievement {
  final String name;
  final int stars;
  final int value;
  final int target;
  final String info;
  final String completionInfo;

  const Achievement({
    @required this.name,
    @required this.stars,
    @required this.value,
    @required this.target,
    @required this.info,
    @required this.completionInfo,
  });
}
