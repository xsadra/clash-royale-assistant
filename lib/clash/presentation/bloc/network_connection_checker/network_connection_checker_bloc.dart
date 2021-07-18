import 'dart:async' show Stream;

import 'package:bloc/bloc.dart' show Bloc;
import 'package:meta/meta.dart' show required;

import '../../../../core/constants/consts.dart' show AppTexts;
import '../../../domain/repository/network_connection_checker_repository.dart';
import 'bloc.dart';

class NetworkConnectionCheckerBloc
    extends Bloc<NetworkConnectionCheckerEvent, NetworkConnectionCheckerState> {
  final NetworkConnectionCheckerRepository _repository;

  NetworkConnectionCheckerBloc({
    @required NetworkConnectionCheckerRepository repository,
  })  : assert(repository != null),
        _repository = repository,
        super(Empty());

  @override
  Stream<NetworkConnectionCheckerState> mapEventToState(
      NetworkConnectionCheckerEvent event) async* {
    if (event is ConnectionCheckerEvent) {
      yield Checking();
      final hasConnection = await _repository.hasConnection();
      yield hasConnection ? HasConnection() : NoConnection();
    } else {
      yield Error(message: AppTexts.error.unexpectedEvent);
    }
  }
}
