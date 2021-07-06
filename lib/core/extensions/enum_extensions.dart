import 'package:flutter/foundation.dart' show describeEnum;
import 'package:flutter/material.dart';

import '../enums/enums.dart';

extension TeamMemberTypeExtention on TeamMemberType {
  String get name => describeEnum(this);

  Color get color {
    switch (this) {
      case TeamMemberType.Team:
        return Colors.blue;
      case TeamMemberType.Opponent:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }
}

extension BattleTypeExtention on BattleType {
  String get name => describeEnum(this);

  String get title {
    switch (this) {
      case BattleType.boatBattle:
        return 'Boat Battle';
      case BattleType.casual1v1:
        return 'Casual 1v1';
      case BattleType.challenge:
        return 'Challenge';
      case BattleType.PvP:
        return 'P vs P';
      case BattleType.riverRacePvP:
        return 'River Race P vs P';
      case BattleType.casual2v2:
        return 'Casual 2v2';
      case BattleType.riverRaceDuel:
        return 'River Race Duel';
      case BattleType.tournament:
        return 'Tournament';

      default:
        return 'not in list';
    }
  }
}

extension BattleResultExtension on BattleResult {
  String get name => describeEnum(this);

  String get title {
    switch (this) {
      case BattleResult.Victory:
        return 'Victory';
      case BattleResult.Draw:
        return 'Draw';
      case BattleResult.Defeat:
        return 'Defeat';

      default:
        return 'not in list';
    }
  }
}
