import 'dart:convert' show jsonEncode;

import 'package:meta/meta.dart' show required;

import '../../domain/entities/battle.dart';

class BattleModel extends Battle {
  const BattleModel({
    @required String type,
    @required String battleTime,
    @required int princessTowersHitPoints,
    @required String boatBattleSide,
    @required bool boatBattleWon,
    @required int newTowersDestroyed,
    @required int prevTowersDestroyed,
    @required int challengeId,
    @required bool isLadderTournament,
    @required ArenaModel arena,
    @required GameModeModel gameMode,
    @required String deckSelection,
    @required List<TeamMemberModel> team,
    @required List<TeamMemberModel> opponent,
    @required String challengeTitle,
    @required bool isHostedMatch,
  }) : super(
          type: type,
          battleTime: battleTime,
          princessTowersHitPoints: princessTowersHitPoints,
          boatBattleSide: boatBattleSide,
          boatBattleWon: boatBattleWon,
          newTowersDestroyed: newTowersDestroyed,
          prevTowersDestroyed: prevTowersDestroyed,
          challengeId: challengeId,
          isLadderTournament: isLadderTournament,
          arena: arena,
          gameMode: gameMode,
          deckSelection: deckSelection,
          team: team,
          opponent: opponent,
          challengeTitle: challengeTitle,
          isHostedMatch: isHostedMatch,
        );

  factory BattleModel.fromJson(Map<String, dynamic> jsonData) {
    return BattleModel(
      type: jsonData['type'] as String,
      battleTime: jsonData['battleTime'] as String,
      princessTowersHitPoints: jsonData['princessTowersHitPoints'] as int,
      boatBattleSide: jsonData['boatBattleSide'] as String,
      boatBattleWon: jsonData['boatBattleWon'] as bool,
      newTowersDestroyed: jsonData['newTowersDestroyed'] as int,
      prevTowersDestroyed: jsonData['prevTowersDestroyed'] as int,
      challengeId: jsonData['challengeId'] as int,
      isLadderTournament: jsonData['isLadderTournament'] as bool,
      arena: ArenaModel.fromJson(jsonData['arena']),
      gameMode: GameModeModel.fromJson(jsonData['gameMode']),
      deckSelection: jsonData['deckSelection'] as String,
      team: (jsonData['team'] as List)
          .map((e) => TeamMemberModel.fromJson(e))
          .toList(),
      opponent: (jsonData['opponent'] as List)
          .map((e) => TeamMemberModel.fromJson(e))
          .toList(),
      challengeTitle: jsonData['challengeTitle'] as String,
      isHostedMatch: jsonData['isHostedMatch'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'type': this.type,
      'battleTime': this.battleTime,
      'princessTowersHitPoints': this.princessTowersHitPoints,
      'boatBattleSide': this.boatBattleSide,
      'boatBattleWon': this.boatBattleWon,
      'newTowersDestroyed': this.newTowersDestroyed,
      'prevTowersDestroyed': this.prevTowersDestroyed,
      'challengeId': this.challengeId,
      'isLadderTournament': this.isLadderTournament,
      'arena': (this.arena as ArenaModel).toJson(),
      'gameMode': (this.gameMode as GameModeModel).toJson(),
      'deckSelection': this.deckSelection,
      'team': jsonEncode(
          this.team.map((e) => (e as TeamMemberModel).toJson()).toList()),
      'opponent': jsonEncode(
          this.opponent.map((e) => (e as TeamMemberModel).toJson()).toList()),
      'challengeTitle': this.challengeTitle,
      'isHostedMatch': this.isHostedMatch,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BattleModel &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          battleTime == other.battleTime &&
          princessTowersHitPoints == other.princessTowersHitPoints &&
          boatBattleSide == other.boatBattleSide &&
          boatBattleWon == other.boatBattleWon &&
          newTowersDestroyed == other.newTowersDestroyed &&
          prevTowersDestroyed == other.prevTowersDestroyed &&
          challengeId == other.challengeId &&
          isLadderTournament == other.isLadderTournament &&
          arena == other.arena &&
          gameMode == other.gameMode &&
          deckSelection == other.deckSelection &&
          team == other.team &&
          opponent == other.opponent &&
          challengeTitle == other.challengeTitle &&
          isHostedMatch == other.isHostedMatch;

  @override
  int get hashCode =>
      type.hashCode ^
      battleTime.hashCode ^
      princessTowersHitPoints.hashCode ^
      boatBattleSide.hashCode ^
      boatBattleWon.hashCode ^
      newTowersDestroyed.hashCode ^
      prevTowersDestroyed.hashCode ^
      challengeId.hashCode ^
      isLadderTournament.hashCode ^
      arena.hashCode ^
      gameMode.hashCode ^
      deckSelection.hashCode ^
      team.hashCode ^
      opponent.hashCode ^
      challengeTitle.hashCode ^
      isHostedMatch.hashCode;

  @override
  String toString() {
    return 'BattleModel{type: $type, battleTime: $battleTime, princessTowersHitPoints: $princessTowersHitPoints, boatBattleSide: $boatBattleSide, boatBattleWon: $boatBattleWon, newTowersDestroyed: $newTowersDestroyed, prevTowersDestroyed: $prevTowersDestroyed, challengeId: $challengeId, isLadderTournament: $isLadderTournament, arena: $arena, gameMode: $gameMode, deckSelection: $deckSelection, team: $team, opponent: $opponent, challengeTitle: $challengeTitle, isHostedMatch: $isHostedMatch}';
  }
}

class ArenaModel extends Arena {
  const ArenaModel({
    @required int id,
    @required String name,
  }) : super(
          name: name,
          id: id,
        );

  factory ArenaModel.fromJson(Map<String, dynamic> json) {
    return new ArenaModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'ArenaModel{id: $id, name: $name}';
  }
}

class GameModeModel extends GameMode {
  const GameModeModel({
    @required int id,
    @required String name,
  }) : super(
          name: name,
          id: id,
        );

  factory GameModeModel.fromJson(Map<String, dynamic> json) {
    return new GameModeModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'GameModeModel{id: $id, name: $name}';
  }
}

class TeamMemberModel extends TeamMember {
  const TeamMemberModel({
    @required String tag,
    @required String name,
    @required int crowns,
    @required int kingTowerHitPoints,
    @required List<int> princessTowersHitPoints,
    @required Clan clan,
    @required List<Card> cards,
  }) : super(
          tag: tag,
          name: name,
          crowns: crowns,
          kingTowerHitPoints: kingTowerHitPoints,
          princessTowersHitPoints: princessTowersHitPoints,
          clan: clan,
          cards: cards,
        );

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      tag: json['tag'] as String,
      name: json['name'] as String,
      crowns: json['crowns'] as int,
      kingTowerHitPoints: json['kingTowerHitPoints'] as int,
      princessTowersHitPoints: json['princessTowersHitPoints'] != null
          ? (json['princessTowersHitPoints'] as List)
              .map((e) => int.parse(e.toString()))
              .toList()
          : [],
      clan: ClanModel.fromJson(json['clan']),
      cards: (json['cards'] as List).map((e) => CardModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'tag': this.tag,
      'name': this.name,
      'crowns': this.crowns,
      'kingTowerHitPoints': this.kingTowerHitPoints,
      'princessTowersHitPoints': this.princessTowersHitPoints,
      'clan': this.clan,
      'cards':
          jsonEncode(this.cards.map((e) => (e as CardModel).toJson()).toList()),
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamMemberModel &&
          runtimeType == other.runtimeType &&
          tag == other.tag &&
          name == other.name &&
          crowns == other.crowns &&
          kingTowerHitPoints == other.kingTowerHitPoints &&
          princessTowersHitPoints == other.princessTowersHitPoints &&
          clan == other.clan &&
          cards == other.cards;

  @override
  int get hashCode =>
      tag.hashCode ^
      name.hashCode ^
      crowns.hashCode ^
      kingTowerHitPoints.hashCode ^
      princessTowersHitPoints.hashCode ^
      clan.hashCode ^
      cards.hashCode;

  @override
  String toString() {
    return 'TeamMemberModel{tag: $tag, name: $name, crowns: $crowns, kingTowerHitPoints: $kingTowerHitPoints, princessTowersHitPoints: $princessTowersHitPoints, clan: $clan, cards: $cards}';
  }
}

class ClanModel extends Clan {
  const ClanModel({
    @required String tag,
    @required String name,
    @required int badgeId,
  }) : super(
          tag: tag,
          name: name,
          badgeId: badgeId,
        );

  factory ClanModel.fromJson(Map<String, dynamic> json) {
    return json == null
        ? null
        : new ClanModel(
            tag: json['tag'] as String,
            name: json['name'] as String,
            badgeId: json['badgeId'] as int,
          );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'tag': this.tag,
      'name': this.name,
      'badgeId': this.badgeId,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClanModel &&
          runtimeType == other.runtimeType &&
          tag == other.tag &&
          name == other.name &&
          badgeId == other.badgeId;

  @override
  int get hashCode => tag.hashCode ^ name.hashCode ^ badgeId.hashCode;

  @override
  String toString() {
    return 'ClanModel{tag: $tag, name: $name, badgeId: $badgeId}';
  }
}

class CardModel extends Card {
  const CardModel({
    @required String name,
    @required int id,
    @required int level,
    @required int starLevel,
    @required int maxLevel,
    @required IconUrlsModel iconUrls,
  }) : super(
          name: name,
          id: id,
          level: level,
          starLevel: starLevel,
          maxLevel: maxLevel,
          iconUrls: iconUrls,
        );

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return new CardModel(
      name: json['name'] as String,
      id: json['id'] as int,
      level: json['level'] as int,
      starLevel: json['starLevel'] as int,
      maxLevel: json['maxLevel'] as int,
      iconUrls: IconUrlsModel.fromJson(json['iconUrls']),
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'id': this.id,
      'level': this.level,
      'starLevel': this.starLevel,
      'maxLevel': this.maxLevel,
      'iconUrls': (this.iconUrls as IconUrlsModel).toJson(),
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          level == other.level &&
          starLevel == other.starLevel &&
          maxLevel == other.maxLevel &&
          iconUrls == other.iconUrls;

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      level.hashCode ^
      starLevel.hashCode ^
      maxLevel.hashCode ^
      iconUrls.hashCode;

  @override
  String toString() {
    return 'CardModel{name: $name, id: $id, level: $level, starLevel: $starLevel, maxLevel: $maxLevel, iconUrls: $iconUrls}';
  }
}

class IconUrlsModel extends IconUrls {
  const IconUrlsModel({
    @required String medium,
  }) : super(
          medium: medium,
        );

  factory IconUrlsModel.fromJson(Map<String, dynamic> json) {
    return new IconUrlsModel(
      medium: json['medium'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'medium': this.medium,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconUrlsModel &&
          runtimeType == other.runtimeType &&
          medium == other.medium;

  @override
  int get hashCode => medium.hashCode;

  @override
  String toString() {
    return 'IconUrlsModel{medium: $medium}';
  }
}
