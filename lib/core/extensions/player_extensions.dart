import 'package:clash_royale_assistant/clash/domain/entities/player.dart';

extension PlayerExtensions on Player {
  bool get hasLeagueStatistics => this.leagueStatistics != null;

  bool get hasClan => this.clan != null;

  bool get hasNotClan => this.clan == null;
}
