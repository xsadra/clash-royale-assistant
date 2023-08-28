import 'package:meta/meta.dart';

import '../../../domain/entities/battles.dart';

@immutable
abstract class BattlesState {}

class Empty extends BattlesState {}

class Loading extends BattlesState {}

class Loaded extends BattlesState {
  final Battles battles;

  Loaded({
    required this.battles,
  });
}

class Error extends BattlesState {
  final String message;

  Error({
    required this.message,
  });
}
