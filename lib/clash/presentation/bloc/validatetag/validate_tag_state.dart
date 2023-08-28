import 'package:meta/meta.dart';

@immutable
abstract class ValidateTagState {}

class Empty extends ValidateTagState {}

class Loading extends ValidateTagState {}

class IsValid extends ValidateTagState {}

class NotValid extends ValidateTagState {}

class Error extends ValidateTagState {
  final String message;

  Error({
    required this.message,
  });
}
