import '../../core/constants/consts.dart';
import 'failure.dart';

extension FailureExtension on Failure {
  String get toMessage {
    switch (this.runtimeType) {
      case ServerFailure:
        return AppText.error.serverFailureMessage;
      case CacheFailure:
        return AppText.error.cacheFailureMessage;
      case NotFoundFailure:
        return AppText.error.notFoundFailureMessage;
      default:
        return AppText.error.unexpectedError;
    }
  }
}
