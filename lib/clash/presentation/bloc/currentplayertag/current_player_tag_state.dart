import 'package:meta/meta.dart';

import '../../../domain/entities/current_player_tag.dart';

@immutable
abstract class CurrentPlayerTagState {}

class Empty extends CurrentPlayerTagState {}

class Loading extends CurrentPlayerTagState {}

class Loaded extends CurrentPlayerTagState {
  final CurrentPlayerTag playerTag;

  Loaded({
    required this.playerTag,
  });
}

class Saving extends CurrentPlayerTagState {}

class Saved extends CurrentPlayerTagState {}

class Error extends CurrentPlayerTagState {
  final String message;

  Error({
    required this.message,
  });
}
