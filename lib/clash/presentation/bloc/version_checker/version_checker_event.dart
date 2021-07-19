import 'package:meta/meta.dart';

@immutable
abstract class VersionCheckerEvent {}

class GetVersionEvent extends VersionCheckerEvent {}

class CheckIsUpdatedVersionEvent extends VersionCheckerEvent {}

class SaveCurrentVersionEvent extends VersionCheckerEvent {
  final String currentVersion;

  SaveCurrentVersionEvent({
    @required this.currentVersion,
  });
}
