import 'package:meta/meta.dart' show required;

import '../../domain/entities/battle.dart';
import '../../domain/entities/card.dart';
import 'card_model.dart';

class BattleModel extends Battle {
  const BattleModel({
    required String type,
    required String battleTime,
    required String tournamentTag,
    required int princessTowersHitPoints,
    required String boatBattleSide,
    required bool boatBattleWon,
    required int newTowersDestroyed,
    required int prevTowersDestroyed,
    required int remainingTowers,
    required int challengeId,
    required bool isLadderTournament,
    required ArenaModel arena,
    required GameModeModel gameMode,
    required String deckSelection,
    required List<TeamMemberModel> team,
    required List<TeamMemberModel> opponent,
    required String challengeTitle,
    required bool isHostedMatch,
    required int challengeWinCountBefore,
  }) : super(
            type: type,
            battleTime: battleTime,
            tournamentTag: tournamentTag,
            princessTowersHitPoints: princessTowersHitPoints,
            boatBattleSide: boatBattleSide,
            boatBattleWon: boatBattleWon,
            newTowersDestroyed: newTowersDestroyed,
            prevTowersDestroyed: prevTowersDestroyed,
            remainingTowers: remainingTowers,
            challengeId: challengeId,
            isLadderTournament: isLadderTournament,
            arena: arena,
            gameMode: gameMode,
            deckSelection: deckSelection,
            team: team,
            opponent: opponent,
            challengeTitle: challengeTitle,
            isHostedMatch: isHostedMatch,
            challengeWinCountBefore: challengeWinCountBefore);

  factory BattleModel.fromJson(Map<String, dynamic> jsonData) {
    return BattleModel(
      type: jsonData['type'] as String,
      battleTime: jsonData['battleTime'] as String,
      tournamentTag: jsonData['tournamentTag'] as String,
      princessTowersHitPoints: jsonData['princessTowersHitPoints'] as int,
      boatBattleSide: jsonData['boatBattleSide'] as String,
      boatBattleWon: jsonData['boatBattleWon'] as bool,
      newTowersDestroyed: jsonData['newTowersDestroyed'] as int,
      prevTowersDestroyed: jsonData['prevTowersDestroyed'] as int,
      remainingTowers: jsonData['remainingTowers'] as int,
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
      challengeWinCountBefore: jsonData['challengeWinCountBefore'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'type': this.type,
      'battleTime': this.battleTime,
      'tournamentTag': this.tournamentTag,
      'princessTowersHitPoints': this.princessTowersHitPoints,
      'boatBattleSide': this.boatBattleSide,
      'boatBattleWon': this.boatBattleWon,
      'newTowersDestroyed': this.newTowersDestroyed,
      'prevTowersDestroyed': this.prevTowersDestroyed,
      'remainingTowers': this.remainingTowers,
      'challengeId': this.challengeId,
      'isLadderTournament': this.isLadderTournament,
      'arena': (this.arena as ArenaModel).toJson(),
      'gameMode': (this.gameMode as GameModeModel).toJson(),
      'deckSelection': this.deckSelection,
      'team': this.team!.map((e) => (e as TeamMemberModel).toJson()).toList(),
      'opponent': this.opponent != null
          ? this.opponent!.map((e) => (e as TeamMemberModel).toJson()).toList()
          : [],
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
          tournamentTag == other.tournamentTag &&
          princessTowersHitPoints == other.princessTowersHitPoints &&
          boatBattleSide == other.boatBattleSide &&
          boatBattleWon == other.boatBattleWon &&
          newTowersDestroyed == other.newTowersDestroyed &&
          prevTowersDestroyed == other.prevTowersDestroyed &&
          remainingTowers == other.remainingTowers &&
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
      tournamentTag.hashCode ^
      princessTowersHitPoints.hashCode ^
      boatBattleSide.hashCode ^
      boatBattleWon.hashCode ^
      newTowersDestroyed.hashCode ^
      prevTowersDestroyed.hashCode ^
      remainingTowers.hashCode ^
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
    return 'BattleModel{type: $type, battleTime: $battleTime, tournamentTag: $tournamentTag, princessTowersHitPoints: $princessTowersHitPoints, boatBattleSide: $boatBattleSide, boatBattleWon: $boatBattleWon, newTowersDestroyed: $newTowersDestroyed, prevTowersDestroyed: $prevTowersDestroyed, remainingTowers: $remainingTowers, challengeId: $challengeId, isLadderTournament: $isLadderTournament, arena: $arena, gameMode: $gameMode, deckSelection: $deckSelection, team: $team, opponent: $opponent, challengeTitle: $challengeTitle, isHostedMatch: $isHostedMatch}';
  }
}

class ArenaModel extends Arena {
  const ArenaModel({
    required int id,
    required String name,
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
    required int id,
    required String name,
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
    required String tag,
    required String name,
    required int crowns,
    required int startingTrophies,
    required int kingTowerHitPoints,
    required List<int> princessTowersHitPoints,
    required Clan clan,
    required List<Card> cards,
  }) : super(
          tag: tag,
          name: name,
          crowns: crowns,
          startingTrophies: startingTrophies,
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
      startingTrophies: json['startingTrophies'] as int,
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
      'cards': this.cards != null
          ? this.cards?.map((e) => (e as CardModel).toJson()).toList()
          : [],
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
    required String tag,
    required String name,
    required int badgeId,
    required bool hasClan,
  }) : super(
          tag: tag,
          name: name,
          badgeId: badgeId,
          hasClan: hasClan
        );

  factory ClanModel.fromJson(Map<String, dynamic>? json) =>   ClanModel(
            tag: json?['tag'] as String ?? '',
            name: json?['name'] as String,
            badgeId: json?['badgeId'] as int, hasClan: json != null,
          );

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
