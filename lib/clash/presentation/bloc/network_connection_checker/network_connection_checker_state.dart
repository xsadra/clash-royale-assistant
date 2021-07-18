import 'package:meta/meta.dart';

@immutable
abstract class NetworkConnectionCheckerState {}

class Empty extends NetworkConnectionCheckerState {}

class Checking extends NetworkConnectionCheckerState {}

class HasConnection extends NetworkConnectionCheckerState {}

class NoConnection extends NetworkConnectionCheckerState {}

class Error extends NetworkConnectionCheckerState {
  final String message;

  Error({
    @required this.message,
  });
}
