import 'dart:async' show Stream;
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/consts.dart';
import '../../../../core/error/failure_extensions.dart';
import '../../../domain/repository/battles_repository.dart';
import 'bloc.dart';

class BattlesBloc extends Bloc<BattlesEvent, BattlesState> {
  final BattlesRepository _repository;

  BattlesBloc({required BattlesRepository repository})
      : assert(repository != null),
        _repository = repository,
        super(Empty());

  Stream<BattlesState> mapEventToState(BattlesEvent event) async* {
    if (event is GetBattlesEvent) {
      log('Loading', name: 'BattlesBloc');
      yield Loading();
      log('getBattles', name: 'BattlesBloc');
      final failureOrBattles = await _repository.getBattles(event.playerTag);
      log('getBattles fold', name: 'BattlesBloc');
      yield failureOrBattles.fold(
        (failure) => Error(message: failure.toMessage),
        (battles) => Loaded(battles: battles),
      );
    } else {
      yield Error(message: AppTexts.error.unexpectedEvent);
    }
  }
}
