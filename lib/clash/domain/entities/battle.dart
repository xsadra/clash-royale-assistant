import 'package:meta/meta.dart' show required;

class Battle {
  final String type;
  final String battleTime;
  final int princessTowersHitPoints;
  final String boatBattleSide;
  final bool boatBattleWon;
  final int newTowersDestroyed;
  final int prevTowersDestroyed;
  final int challengeId;
  final bool isLadderTournament;
  final Arena arena;
  final GameMode gameMode;
  final String deckSelection;
  final List<TeamMember> team;
  final List<TeamMember> opponent;
  final String challengeTitle;
  final bool isHostedMatch;

  const Battle({
    @required this.type,
    @required this.battleTime,
    @required this.princessTowersHitPoints,
    @required this.boatBattleSide,
    @required this.boatBattleWon,
    @required this.newTowersDestroyed,
    @required this.prevTowersDestroyed,
    @required this.challengeId,
    @required this.isLadderTournament,
    @required this.arena,
    @required this.gameMode,
    @required this.deckSelection,
    @required this.team,
    @required this.opponent,
    @required this.challengeTitle,
    @required this.isHostedMatch,
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
  final int kingTowerHitPoints;
  final List<int> princessTowersHitPoints;
  final Clan clan;
  final List<Card> clans;

  const TeamMember({
    @required this.tag,
    @required this.name,
    @required this.crowns,
    @required this.kingTowerHitPoints,
    @required this.princessTowersHitPoints,
    @required this.clan,
    @required this.clans,
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

class Card {
  final String name;
  final int id;
  final int level;
  final int starLevel;
  final int maxLevel;
  final IconUrls iconUrls;

  const Card({
    @required this.name,
    @required this.id,
    @required this.level,
    @required this.starLevel,
    @required this.maxLevel,
    @required this.iconUrls,
  });
}

class IconUrls {
  final String medium;

  const IconUrls({
    @required this.medium,
  });
}
