import 'package:meta/meta.dart';

import '../../../domain/entities/current_player_tag.dart';

@immutable
abstract class CurrentPlayerTagEvent {}

class GetCurrentPlayerTagEvent extends CurrentPlayerTagEvent {}

class SaveCurrentPlayerTagEvent extends CurrentPlayerTagEvent {
  final CurrentPlayerTag playerTag;

  SaveCurrentPlayerTagEvent(this.playerTag);
}
