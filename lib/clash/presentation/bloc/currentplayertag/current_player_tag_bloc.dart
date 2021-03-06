import 'dart:async' show Stream;

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

  Stream<CurrentPlayerTagState> mapEventToState(
      CurrentPlayerTagEvent event) async* {
    if (event is GetCurrentPlayerTagEvent) {
      yield Loading();
      final failureOrPlayerTag = await _repository.getCurrentPlayerTag();
      yield failureOrPlayerTag.fold(
        (failure) {
          return Empty();
        },
        (playerTag) {
          return Loaded(playerTag: playerTag);
        },
      );
    } else if (event is SaveCurrentPlayerTagEvent) {
      yield Saving();
      final failureOrSavePlayerTag =
          await _repository.saveCurrentPlayerTag(playerTag: event.playerTag);
      yield failureOrSavePlayerTag.fold(
        (failure) => Error(message: failure.toMessage),
        (isSaved) {
          if (isSaved) {
            return Saved();
          }
          return Error(message: AppTexts.error.playerTagNotSavedMessage);
        },
      );
    } else {
      yield Error(message: AppTexts.error.unexpectedEvent);
    }
  }
}
