import 'package:meta/meta.dart';

@immutable
abstract class PlayerEvent {}

class GetPlayerEvent extends PlayerEvent {
  final String playerTag;

  GetPlayerEvent(this.playerTag);
}
