import 'package:meta/meta.dart';

@immutable
abstract class ValidateTagEvent {}

class CheckValidateTagEvent extends ValidateTagEvent {
  final String tag;
  final String type;

  CheckValidateTagEvent({
    required this.tag,
    required this.type,
  });
}
