import 'dart:convert';

import 'package:clash_royale_assistant/clash/domain/entities/player.dart';
import 'package:meta/meta.dart';

class PlayerModel extends Player {
  const PlayerModel({
    @required String tag,
    @required String name,
    @required int expLevel,
    @required int trophies,
    @required int bestTrophies,
    @required int wins,
    @required int losses,
    @required int battleCount,
    @required int threeCrownWins,
    @required int challengeCardsWon,
    @required int challengeMaxWins,
    @required int tournamentCardsWon,
    @required int tournamentBattleCount,
    @required String role,
    @required int donations,
    @required int donationsReceived,
    @required int totalDonations,
    @required int warDayWins,
    @required int clanCardsCollected,
    @required ClanModel clan,
    @required ArenaModel arena,
    @required LeagueStatisticsModel leagueStatistics,
    @required List<BadgeModel> badges,
    @required List<AchievementModel> achievements,
    @required List<CardModel> cards,
    @required List<CardModel> currentDeck,
    @required CardModel currentFavouriteCard,
    @required int starPoints,
  }) : super(
          tag: tag,
          name: name,
          expLevel: expLevel,
          trophies: trophies,
          bestTrophies: bestTrophies,
          wins: wins,
          losses: losses,
          battleCount: battleCount,
          threeCrownWins: threeCrownWins,
          challengeCardsWon: challengeCardsWon,
          challengeMaxWins: challengeMaxWins,
          tournamentCardsWon: tournamentCardsWon,
          tournamentBattleCount: tournamentBattleCount,
          role: role,
          donations: donations,
          donationsReceived: donationsReceived,
          totalDonations: totalDonations,
          warDayWins: warDayWins,
          clanCardsCollected: clanCardsCollected,
          clan: clan,
          arena: arena,
          leagueStatistics: leagueStatistics,
          badges: badges,
          achievements: achievements,
          cards: cards,
          currentDeck: currentDeck,
          currentFavouriteCard: currentFavouriteCard,
          starPoints: starPoints,
        );

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return new PlayerModel(
      tag: json['tag'] as String,
      name: json['name'] as String,
      expLevel: json['expLevel'] as int,
      trophies: json['trophies'] as int,
      bestTrophies: json['bestTrophies'] as int,
      wins: json['wins'] as int,
      losses: json['losses'] as int,
      battleCount: json['battleCount'] as int,
      threeCrownWins: json['threeCrownWins'] as int,
      challengeCardsWon: json['challengeCardsWon'] as int,
      challengeMaxWins: json['challengeMaxWins'] as int,
      tournamentCardsWon: json['tournamentCardsWon'] as int,
      tournamentBattleCount: json['tournamentBattleCount'] as int,
      role: json['role'] as String,
      donations: json['donations'] as int,
      donationsReceived: json['donationsReceived'] as int,
      totalDonations: json['totalDonations'] as int,
      warDayWins: json['warDayWins'] as int,
      clanCardsCollected: json['clanCardsCollected'] as int,
      clan: ClanModel.fromJson(json['clan']),
      arena: ArenaModel.fromJson(json['arena']),
      leagueStatistics: LeagueStatisticsModel.fromMap(json['leagueStatistics']),
      badges:
          (json['badges'] as List).map((e) => BadgeModel.fromJson(e)).toList(),
      achievements: (json['achievements'] as List)
          .map((e) => AchievementModel.fromJson(e))
          .toList(),
      cards: (json['cards'] as List).map((e) => CardModel.fromJson(e)).toList(),
      currentDeck: (json['currentDeck'] as List)
          .map((e) => CardModel.fromJson(e))
          .toList(),
      currentFavouriteCard: CardModel.fromJson(json['currentFavouriteCard']),
      starPoints: json['starPoints'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'tag': this.tag,
      'name': this.name,
      'expLevel': this.expLevel,
      'trophies': this.trophies,
      'bestTrophies': this.bestTrophies,
      'wins': this.wins,
      'losses': this.losses,
      'battleCount': this.battleCount,
      'threeCrownWins': this.threeCrownWins,
      'challengeCardsWon': this.challengeCardsWon,
      'challengeMaxWins': this.challengeMaxWins,
      'tournamentCardsWon': this.tournamentCardsWon,
      'tournamentBattleCount': this.tournamentBattleCount,
      'role': this.role,
      'donations': this.donations,
      'donationsReceived': this.donationsReceived,
      'totalDonations': this.totalDonations,
      'warDayWins': this.warDayWins,
      'clanCardsCollected': this.clanCardsCollected,
      'clan': (this.clan as ClanModel).toJson(),
      'arena': (this.arena as ArenaModel).toJson(),
      'leagueStatistics':
          (this.leagueStatistics as LeagueStatisticsModel).toJson(),
      'badges': _toBadgesJson(),
      'achievements': _toAchievementsJson(),
      'cards': _toCardsJson(),
      'currentDeck': _toCurrentDeckJson(),
      'currentFavouriteCard': (this.currentFavouriteCard as CardModel).toJson(),
      'starPoints': this.starPoints,
    } as Map<String, dynamic>;
  }

  String _toAchievementsJson() => jsonEncode(
      this.achievements.map((e) => (e as AchievementModel).toJson()).toList());

  String _toBadgesJson() =>
      jsonEncode(this.badges.map((e) => (e as BadgeModel).toJson()).toList());

  String _toCardsJson() =>
      jsonEncode(this.cards.map((e) => (e as CardModel).toJson()).toList());

  String _toCurrentDeckJson() => jsonEncode(
      this.currentDeck.map((e) => (e as CardModel).toJson()).toList());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerModel &&
          runtimeType == other.runtimeType &&
          tag == other.tag &&
          name == other.name &&
          expLevel == other.expLevel &&
          trophies == other.trophies &&
          bestTrophies == other.bestTrophies &&
          wins == other.wins &&
          losses == other.losses &&
          battleCount == other.battleCount &&
          threeCrownWins == other.threeCrownWins &&
          challengeCardsWon == other.challengeCardsWon &&
          challengeMaxWins == other.challengeMaxWins &&
          tournamentCardsWon == other.tournamentCardsWon &&
          tournamentBattleCount == other.tournamentBattleCount &&
          role == other.role &&
          donations == other.donations &&
          donationsReceived == other.donationsReceived &&
          totalDonations == other.totalDonations &&
          warDayWins == other.warDayWins &&
          clanCardsCollected == other.clanCardsCollected &&
          clan == other.clan &&
          arena == other.arena &&
          leagueStatistics == other.leagueStatistics &&
          badges == other.badges &&
          achievements == other.achievements &&
          cards == other.cards &&
          currentDeck == other.currentDeck &&
          currentFavouriteCard == other.currentFavouriteCard &&
          starPoints == other.starPoints;

  @override
  int get hashCode =>
      tag.hashCode ^
      name.hashCode ^
      expLevel.hashCode ^
      trophies.hashCode ^
      bestTrophies.hashCode ^
      wins.hashCode ^
      losses.hashCode ^
      battleCount.hashCode ^
      threeCrownWins.hashCode ^
      challengeCardsWon.hashCode ^
      challengeMaxWins.hashCode ^
      tournamentCardsWon.hashCode ^
      tournamentBattleCount.hashCode ^
      role.hashCode ^
      donations.hashCode ^
      donationsReceived.hashCode ^
      totalDonations.hashCode ^
      warDayWins.hashCode ^
      clanCardsCollected.hashCode ^
      clan.hashCode ^
      arena.hashCode ^
      leagueStatistics.hashCode ^
      badges.hashCode ^
      achievements.hashCode ^
      cards.hashCode ^
      currentDeck.hashCode ^
      currentFavouriteCard.hashCode ^
      starPoints.hashCode;

  @override
  String toString() {
    return 'PlayerModel{tag: $tag, name: $name, expLevel: $expLevel, trophies: $trophies, bestTrophies: $bestTrophies, wins: $wins, losses: $losses, battleCount: $battleCount, threeCrownWins: $threeCrownWins, challengeCardsWon: $challengeCardsWon, challengeMaxWins: $challengeMaxWins, tournamentCardsWon: $tournamentCardsWon, tournamentBattleCount: $tournamentBattleCount, role: $role, donations: $donations, donationsReceived: $donationsReceived, totalDonations: $totalDonations, warDayWins: $warDayWins, clanCardsCollected: $clanCardsCollected, clan: $clan, arena: $arena, leagueStatistics: $leagueStatistics, badges: $badges, achievements: $achievements, cards: $cards, currentDeck: $currentDeck, currentFavouriteCard: $currentFavouriteCard, starPoints: $starPoints}';
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
    return new ClanModel(
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

class ArenaModel extends Arena {
  const ArenaModel({
    @required int id,
    @required String name,
  }) : super(name: name, id: id);

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

class LeagueStatisticsModel extends LeagueStatistics {
  const LeagueStatisticsModel({
    @required CurrentSeasonModel currentSeason,
    @required PreviousSeasonModel previousSeason,
    @required BestSeasonModel bestSeason,
  }) : super(
            currentSeason: currentSeason,
            previousSeason: previousSeason,
            bestSeason: bestSeason);

  factory LeagueStatisticsModel.fromMap(Map<String, dynamic> json) {
    return new LeagueStatisticsModel(
      currentSeason: CurrentSeasonModel.fromJson(json['currentSeason']),
      previousSeason: PreviousSeasonModel.fromJson(json['previousSeason']),
      bestSeason: BestSeasonModel.fromJson(json['bestSeason']),
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'currentSeason': (this.currentSeason as CurrentSeasonModel).toJson(),
      'previousSeason': (this.previousSeason as PreviousSeasonModel).toJson(),
      'bestSeason': (this.bestSeason as BestSeasonModel).toJson(),
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeagueStatisticsModel &&
          runtimeType == other.runtimeType &&
          currentSeason == other.currentSeason &&
          previousSeason == other.previousSeason &&
          bestSeason == other.bestSeason;

  @override
  int get hashCode =>
      currentSeason.hashCode ^ previousSeason.hashCode ^ bestSeason.hashCode;

  @override
  String toString() {
    return 'LeagueStatisticsModel{currentSeason: $currentSeason, previousSeason: $previousSeason, bestSeason: $bestSeason}';
  }
}

class CurrentSeasonModel extends CurrentSeason {
  const CurrentSeasonModel({
    @required int trophies,
    @required int bestTrophies,
  }) : super(trophies: trophies, bestTrophies: bestTrophies);

  factory CurrentSeasonModel.fromJson(Map<String, dynamic> json) {
    return new CurrentSeasonModel(
      trophies: json['trophies'] as int,
      bestTrophies: json['bestTrophies'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'trophies': this.trophies,
      'bestTrophies': this.bestTrophies,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentSeasonModel &&
          runtimeType == other.runtimeType &&
          trophies == other.trophies &&
          bestTrophies == other.bestTrophies;

  @override
  int get hashCode => trophies.hashCode ^ bestTrophies.hashCode;

  @override
  String toString() {
    return 'CurrentSeasonModel{trophies: $trophies, bestTrophies: $bestTrophies}';
  }
}

class PreviousSeasonModel extends PreviousSeason {
  const PreviousSeasonModel({
    @required String id,
    @required int trophies,
    @required int bestTrophies,
  }) : super(id: id, trophies: trophies, bestTrophies: bestTrophies);

  factory PreviousSeasonModel.fromJson(Map<String, dynamic> json) {
    return new PreviousSeasonModel(
      id: json['id'] as String,
      trophies: json['trophies'] as int,
      bestTrophies: json['bestTrophies'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'trophies': this.trophies,
      'bestTrophies': this.bestTrophies,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreviousSeasonModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          trophies == other.trophies &&
          bestTrophies == other.bestTrophies;

  @override
  int get hashCode => id.hashCode ^ trophies.hashCode ^ bestTrophies.hashCode;

  @override
  String toString() {
    return 'PreviousSeasonModel{id: $id, trophies: $trophies, bestTrophies: $bestTrophies}';
  }
}

class BestSeasonModel extends BestSeason {
  const BestSeasonModel({
    @required String id,
    @required int trophies,
  }) : super(id: id, trophies: trophies);

  factory BestSeasonModel.fromJson(Map<String, dynamic> json) {
    return new BestSeasonModel(
      id: json['id'] as String,
      trophies: json['trophies'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'trophies': this.trophies,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BestSeasonModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          trophies == other.trophies;

  @override
  int get hashCode => id.hashCode ^ trophies.hashCode;

  @override
  String toString() {
    return 'BestSeasonModel{id: $id, trophies: $trophies}';
  }
}

class BadgeModel extends Badge {
  const BadgeModel({
    @required String name,
    @required int progress,
  }) : super(name: name, progress: progress);

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return new BadgeModel(
      name: json['name'] as String,
      progress: json['progress'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'progress': this.progress,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BadgeModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          progress == other.progress;

  @override
  int get hashCode => name.hashCode ^ progress.hashCode;

  @override
  String toString() {
    return 'BadgeModel{name: $name, progress: $progress}';
  }
}

class AchievementModel extends Achievement {
  const AchievementModel({
    @required String name,
    @required int stars,
    @required int value,
    @required int target,
    @required String info,
    @required String completionInfo,
  }) : super(
          name: name,
          stars: stars,
          value: value,
          target: target,
          info: info,
          completionInfo: completionInfo,
        );

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return new AchievementModel(
      name: json['name'] as String,
      stars: json['stars'] as int,
      value: json['value'] as int,
      target: json['target'] as int,
      info: json['info'] as String,
      completionInfo: json['completionInfo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'stars': this.stars,
      'value': this.value,
      'target': this.target,
      'info': this.info,
      'completionInfo': this.completionInfo,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AchievementModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          stars == other.stars &&
          value == other.value &&
          target == other.target &&
          info == other.info &&
          completionInfo == other.completionInfo;

  @override
  int get hashCode =>
      name.hashCode ^
      stars.hashCode ^
      value.hashCode ^
      target.hashCode ^
      info.hashCode ^
      completionInfo.hashCode;

  @override
  String toString() {
    return 'AchievementModel{name: $name, stars: $stars, value: $value, target: $target, info: $info, completionInfo: $completionInfo}';
  }
}

class CardModel extends Card {
  const CardModel({
    @required String name,
    @required int id,
    @required int level,
    @required int starLevel,
    @required int maxLevel,
    @required int count,
    @required IconUrlsModel iconUrls,
  }) : super(
          name: name,
          id: id,
          level: level,
          starLevel: starLevel,
          maxLevel: maxLevel,
          count: count,
          iconUrls: iconUrls,
        );

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return new CardModel(
      name: json['name'] as String,
      id: json['id'] as int,
      level: json['level'] as int,
      starLevel: json['starLevel'] as int,
      maxLevel: json['maxLevel'] as int,
      count: json['count'] as int,
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
      'count': this.count,
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
          count == other.count &&
          iconUrls == other.iconUrls;

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      level.hashCode ^
      starLevel.hashCode ^
      maxLevel.hashCode ^
      count.hashCode ^
      iconUrls.hashCode;

  @override
  String toString() {
    return 'CardModel{name: $name, id: $id, level: $level, starLevel: $starLevel, maxLevel: $maxLevel, count: $count, iconUrls: $iconUrls}';
  }
}

class IconUrlsModel extends IconUrls {
  const IconUrlsModel({
    @required String medium,
  }) : super(medium: medium);

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
