import '../../core/constants/consts.dart';
import 'failure.dart';

extension FailureExtension on Failure {
  String get toMessage {
    switch (this.runtimeType) {
      case ServerFailure:
        return AppErrorTexts.SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return AppErrorTexts.CACHE_FAILURE_MESSAGE;
      case NotFoundFailure:
        return AppErrorTexts.NOT_FOUND_FAILURE_MESSAGE;
      default:
        return AppErrorTexts.UNEXPECTED_ERROR;
    }
  }
}
