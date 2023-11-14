import 'package:meta/meta.dart';

import '../../../domain/entities/version.dart';

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
    required this.version,
  });
}

class ReadVersion extends VersionCheckerState {
  final Version version;

  ReadVersion({
    required this.version,
  });
}

class Saving extends VersionCheckerState {}

class Saved extends VersionCheckerState {}

class Hidden extends VersionCheckerState {}

class Error extends VersionCheckerState {
  final String message;

  Error({
    required this.message,
  });
}
