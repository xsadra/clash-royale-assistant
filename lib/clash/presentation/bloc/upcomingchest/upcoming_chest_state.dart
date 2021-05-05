import 'package:meta/meta.dart';

import '../../../domain/entities/upcoming_chest.dart';

@immutable
abstract class UpcomingChestsState {}

class Empty extends UpcomingChestsState {}

class Loading extends UpcomingChestsState {}

class Loaded extends UpcomingChestsState {
  final List<UpcomingChest> upcomingChests;

  Loaded({
    @required this.upcomingChests,
  });
}

class Error extends UpcomingChestsState {
  final String message;

  Error({
    @required this.message,
  });
}
