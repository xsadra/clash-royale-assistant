import 'package:flutter/material.dart';

import '../../clash/domain/entities/battle.dart';
import '../enums/enums_with_extensions.dart';
import 'string_extensions.dart';

extension BattleEntityExtensions on Battle {
  bool get hasCrowns =>
      this.team[0].crowns != null && this.opponent[0].crowns != null;

  bool get hasCrowns2v2 =>
      this.team[0].crowns != null &&
      this.opponent[0].crowns != null &&
      this.opponent[1].crowns != null &&
      this.opponent[1].crowns != null;

  bool get didTeamWin =>
      (this.team[0].crowns ?? 0) > (this.opponent[0].crowns ?? 0);

  String get winCount => (this.challengeWinCountBefore ?? 'no').toString();

  String get timeAgo => this.battleTime.timeAgo();

  @Deprecated('use [battleResult] instead')
  String get resultTitle => this.didTeamWin ? 'Victory' : 'Defeat';

  String get battleResultTitle => battleResult.title;

  BattleResult get battleResult {
    if (this.teamCrowns == this.opponentCrowns) {
      return BattleResult.Draw;
    } else if (this.teamCrowns > this.opponentCrowns) {
      return BattleResult.Victory;
    }
    return BattleResult.Defeat;
  }

  String get winCountText =>
      (this.challengeWinCountBefore ?? 0) > 0 ? ' Wins' : ' Win';

  String get gameModeName => this.gameMode.name;

  int get teamCrowns => this.team1.crowns ?? 0;

  int get opponentCrowns => this.opponent1.crowns ?? 0;

  TeamMember get team1 => this.team[0];

  TeamMember get opponent1 => this.opponent[0];

  TeamMember get team2 => this.team[1] ?? null;

  TeamMember get opponent2 => this.opponent[1] ?? null;

  Color get resultBackgroundColor {
    if (this.teamCrowns == this.opponentCrowns) {
      return Colors.black54;
    } else if (this.teamCrowns > this.opponentCrowns) {
      return Colors.green.shade100;
    }
    return Colors.red.shade50;
  }

  Color get resultStatsColor {
    if (this.teamCrowns == this.opponentCrowns) {
      return Colors.white70;
    } else if (this.teamCrowns > this.opponentCrowns) {
      return Colors.green;
    }
    return Colors.red;
  }
}
