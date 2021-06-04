import 'package:meta/meta.dart' show immutable;

@immutable
abstract class BattlesEvent {}

class GetBattlesEvent extends BattlesEvent {
  final String playerTag;

  GetBattlesEvent(this.playerTag);
}
