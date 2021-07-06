import 'package:clash_royale_assistant/core/constants/consts.dart';
import 'package:flutter/material.dart';

import '../../clash/domain/entities/battle.dart';
import '../enums/enums_with_extensions.dart';
import 'string_extensions.dart';

extension BattleEntityExtensions on Battle {
  bool get hasCrowns =>
      this.team1.crowns != null && this.opponent1.crowns != null;

  bool get hasCrowns2v2 =>
      this.team1.crowns != null &&
      this.team2.crowns != null &&
      this.opponent1.crowns != null &&
      this.opponent2.crowns != null;

  bool get hasTrophies =>
      this.team1.startingTrophies != null &&
      this.opponent1.startingTrophies != null;

  bool get hasTrophies2v2 =>
      this.team1.startingTrophies != null &&
      this.team2.startingTrophies != null &&
      this.opponent1.startingTrophies != null &&
      this.opponent2.startingTrophies != null;

  bool get didTeamWin =>
      (this.team1.crowns ?? 0) > (this.opponent1.crowns ?? 0);

  bool get didBoatWin => this.boatBattleWon;

  bool get isDisplayTeamWin => this.challengeWinCountBefore != null;

  bool get isDisplayPreviousTeamWinNumber =>
      (this.challengeWinCountBefore ?? 0) > 0;

  bool get isDisplayTeamWinText => isDisplayPreviousTeamWinNumber || didTeamWin;

  bool get isAttacker =>
      this.boatBattleSide != null &&
      this.boatBattleSide == AppTexts.ui.attacker;

  bool get isDefender => !isAttacker;

  String get winCount =>
      (this.challengeWinCountBefore ?? AppTexts.ui.no).toString();

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

  String get boatBattleResultTitle => boatBattleResult.title;

  BattleResult get boatBattleResult {
    return this.boatBattleWon ? BattleResult.Victory : BattleResult.Defeat;
  }

  String get winCountText => (this.challengeWinCountBefore ?? 0) > 0
      ? AppTexts.ui.spcWins
      : AppTexts.ui.spcWin;

  String get gameModeName => this.gameMode.name;

  String get gameModeNameFormatted => this.gameMode.name.replaceAll(
        AppTexts.ui.underline,
        AppTexts.ui.spc,
      );

  int get teamCrowns => this.team1.crowns ?? 0;

  int get opponentCrowns => this.opponent1.crowns ?? 0;

  TeamMember get team1 => this.team[0];

  TeamMember get opponent1 => this.opponent[0];

  TeamMember get team2 => this.team[1] ?? null;

  TeamMember get opponent2 => this.opponent[1] ?? null;

  Color get resultBackgroundColor {
    if (this.teamCrowns == this.opponentCrowns) {
      return AppColors.battles.tileResultDrawBackgroundColor;
    } else if (this.teamCrowns > this.opponentCrowns) {
      return AppColors.battles.tileResultWinBackgroundColor;
    }
    return AppColors.battles.tileResultDefeatBackgroundColor;
  }

  Color get resultStatsColor {
    if (this.teamCrowns == this.opponentCrowns) {
      return AppColors.battles.tileStatusDrawBackgroundColor;
    } else if (this.teamCrowns > this.opponentCrowns) {
      return AppColors.battles.tileStatusWinBackgroundColor;
    }
    return AppColors.battles.tileStatusDefeatBackgroundColor;
  }

  Color get boatResultStatsColor {
    return this.boatBattleWon
        ? AppColors.battles.tileStatusWinBackgroundColor
        : AppColors.battles.tileStatusDefeatBackgroundColor;
  }

  Color get boatResultBackgroundColor {
    return this.boatBattleWon
        ? AppColors.battles.tileResultWinBackgroundColor
        : AppColors.battles.tileResultDefeatBackgroundColor;
  }
}
