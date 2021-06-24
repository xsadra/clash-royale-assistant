import 'dart:async' show Stream;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/consts.dart';
import '../../../../core/error/failure_extensions.dart';
import '../../../domain/repository/battles_repository.dart';
import 'bloc.dart';

class BattlesBloc extends Bloc<BattlesEvent, BattlesState> {
  final BattlesRepository _repository;

  BattlesBloc({@required BattlesRepository repository})
      : assert(repository != null),
        _repository = repository,
        super(Empty());

  @override
  Stream<BattlesState> mapEventToState(BattlesEvent event) async* {
    if (event is GetBattlesEvent) {
      yield Loading();
      final failureOrBattles = await _repository.getBattles(event.playerTag);
      yield failureOrBattles.fold(
        (failure) => Error(message: failure.toMessage),
        (battles) => Loaded(battles: battles),
      );
    } else {
      yield Error(message: AppText.error.unexpectedEvent);
    }
  }
}
