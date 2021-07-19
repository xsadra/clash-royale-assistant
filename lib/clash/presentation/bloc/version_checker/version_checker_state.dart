import 'package:clash_royale_assistant/clash/domain/entities/version.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VersionCheckerState {}

class Empty extends VersionCheckerState {}

class CheckingVersion extends VersionCheckerState {}

class IsUpdated extends VersionCheckerState {}

class NotUpdate extends VersionCheckerState {}

class Loading extends VersionCheckerState {}

class Loaded extends VersionCheckerState {
  final Version version;

  Loaded({
    @required this.version,
  });
}

class Saving extends VersionCheckerState {}

class Saved extends VersionCheckerState {}

class Error extends VersionCheckerState {
  final String message;

  Error({
    @required this.message,
  });
}
