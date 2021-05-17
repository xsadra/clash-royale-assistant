import 'package:meta/meta.dart';

import '../../../domain/entities/player.dart';

@immutable
abstract class PlayerState {}

class Empty extends PlayerState {}

class Loading extends PlayerState {}

class Loaded extends PlayerState {
  final Player player;

  Loaded({
    @required this.player,
  });
}

class Error extends PlayerState {
  final String message;

  Error({
    @required this.message,
  });
}
