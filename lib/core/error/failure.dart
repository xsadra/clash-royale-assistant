import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// General failures
class ServerFailure extends Failure {
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class CacheFailure extends Failure {
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
