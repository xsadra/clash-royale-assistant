import 'package:meta/meta.dart';

import '../../../domain/entities/profile.dart';

@immutable
abstract class ProfileState {}

class Empty extends ProfileState {}

class Loading extends ProfileState {}

class Loaded extends ProfileState {
  final Profile profile;

  Loaded({
    @required this.profile,
  });
}

class Error extends ProfileState {
  final String message;

  Error({
    @required this.message,
  });
}
