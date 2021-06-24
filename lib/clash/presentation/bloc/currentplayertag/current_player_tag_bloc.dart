import 'dart:async' show Stream;
import 'dart:developer';

import 'package:bloc/bloc.dart' show Bloc;
import 'package:meta/meta.dart' show required;

import '../../../../core/constants/consts.dart';
import '../../../../core/error/failure_extensions.dart';
import '../../../domain/repository/current_player_tag_repository.dart';
import 'bloc.dart';

class CurrentPlayerTagBloc
    extends Bloc<CurrentPlayerTagEvent, CurrentPlayerTagState> {
  final CurrentPlayerTagRepository _repository;

  CurrentPlayerTagBloc({
    @required CurrentPlayerTagRepository repository,
  })  : assert(repository != null),
        _repository = repository,
        super(Empty());

  @override
  Stream<CurrentPlayerTagState> mapEventToState(
      CurrentPlayerTagEvent event) async* {
    if (event is GetCurrentPlayerTagEvent) {
      yield Loading();
      log('event is GetCurrentPlayerTagEvent', name: 'CurrentPlayerTagBloc');
      final failureOrPlayerTag = await _repository.getCurrentPlayerTag();
      yield failureOrPlayerTag.fold(
        (failure) {
          log('get current player tag from local failed',
              name: 'CurrentPlayerTagBloc');
          return Empty();
        },
        (playerTag) {
          log('get current player tag from local success',
              name: 'CurrentPlayerTagBloc');
          log(playerTag.playerTag, name: 'CurrentPlayerTagBloc');
          return Loaded(playerTag: playerTag);
        },
      );
    } else if (event is SaveCurrentPlayerTagEvent) {
      log('event is SaveCurrentPlayerTagEvent', name: 'CurrentPlayerTagBloc');
      yield Saving();
      final failureOrSavePlayerTag =
          await _repository.saveCurrentPlayerTag(playerTag: event.playerTag);
      yield failureOrSavePlayerTag.fold(
        (failure) => Error(message: failure.toMessage),
        (isSaved) {
          log('saveCurrentPlayerTag is ' + isSaved.toString(),
              name: 'CurrentPlayerTagBloc');
          if (isSaved) {
            return Saved();
          }
          return Error(message: AppText.error.playerTagNotSavedMessage);
        },
      );
    } else {
      yield Error(message: AppText.error.unexpectedEvent);
    }
  }
}
