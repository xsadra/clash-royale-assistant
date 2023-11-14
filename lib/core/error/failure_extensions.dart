import 'package:clash_royale_assistant/core/constants/consts.dart';
import 'package:clash_royale_assistant/core/error/failure.dart';

extension FailureExtension on Failure {
  String get toMessage {
    switch (this.runtimeType) {
      case ServerFailure:
        return AppTexts.error.serverFailureMessage;
      case CacheFailure:
        return AppTexts.error.cacheFailureMessage;
      case NotFoundFailure:
        return AppTexts.error.notFoundFailureMessage;
      default:
        return AppTexts.error.unexpectedError;
    }
  }
}
