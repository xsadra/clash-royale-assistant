import 'package:meta/meta.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {
  final String playerTag;

  GetProfileEvent(this.playerTag);
}
