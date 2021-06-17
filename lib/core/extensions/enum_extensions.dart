import 'package:flutter/foundation.dart' show describeEnum;
import 'package:flutter/material.dart';

import '../enums/enums.dart';

extension TeamMemberTypeExtention on TeamMemberType {
  String get name => describeEnum(this);

  Color get color {
    switch (this) {
      case TeamMemberType.Team:
        return Colors.blue;
      case TeamMemberType.opponent:
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
        return 'boatBattle';
      case BattleType.casual1v1:
        return 'casual1v1';
      case BattleType.challenge:
        return 'Challenge';
      case BattleType.PvP:
        return 'PvP';
      case BattleType.riverRacePvP:
        return 'riverRacePvP';

      default:
        return 'not in list';
    }
  }
}
