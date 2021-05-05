import 'package:meta/meta.dart';

@immutable
abstract class UpcomingChestsEvent {}

class GetUpcomingChests extends UpcomingChestsEvent {}
