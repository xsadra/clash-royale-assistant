import '../../core/constants/consts.dart';
import 'failure.dart';

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
