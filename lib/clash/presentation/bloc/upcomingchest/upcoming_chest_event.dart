import 'package:meta/meta.dart';

@immutable
abstract class UpcomingChestsEvent {}

class GetUpcomingChestsEvent extends UpcomingChestsEvent {
  final String playerTag;

  GetUpcomingChestsEvent(this.playerTag);
}
