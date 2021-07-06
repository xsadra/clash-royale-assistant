import 'package:meta/meta.dart' show required;

import 'card.dart';

class Battle {
  final String type;
  final String battleTime;
  final int princessTowersHitPoints;
  final String boatBattleSide;
  final bool boatBattleWon;
  final int newTowersDestroyed;
  final int prevTowersDestroyed;
  final int remainingTowers;
  final int challengeId;
  final bool isLadderTournament;
  final Arena arena;
  final GameMode gameMode;
  final String deckSelection;
  final List<TeamMember> team;
  final List<TeamMember> opponent;
  final String challengeTitle;
  final bool isHostedMatch;
  final int challengeWinCountBefore;

  const Battle({
    @required this.type,
    @required this.battleTime,
    @required this.princessTowersHitPoints,
    @required this.boatBattleSide,
    @required this.boatBattleWon,
    @required this.newTowersDestroyed,
    @required this.prevTowersDestroyed,
    @required this.remainingTowers,
    @required this.challengeId,
    @required this.isLadderTournament,
    @required this.arena,
    @required this.gameMode,
    @required this.deckSelection,
    @required this.team,
    @required this.opponent,
    @required this.challengeTitle,
    @required this.isHostedMatch,
    @required this.challengeWinCountBefore,
  });
}

class Arena {
  final int id;
  final String name;

  const Arena({
    @required this.id,
    @required this.name,
  });
}

class GameMode {
  final int id;
  final String name;

  const GameMode({
    @required this.id,
    @required this.name,
  });
}

class TeamMember {
  final String tag;
  final String name;
  final int crowns;
  final int startingTrophies;
  final int kingTowerHitPoints;
  final List<int> princessTowersHitPoints;
  final Clan clan;
  final List<Card> cards;

  const TeamMember({
    @required this.tag,
    @required this.name,
    @required this.crowns,
    @required this.startingTrophies,
    @required this.kingTowerHitPoints,
    @required this.princessTowersHitPoints,
    @required this.clan,
    @required this.cards,
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
