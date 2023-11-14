import 'dart:async' show Stream;

import 'package:bloc/bloc.dart' show Bloc;
import 'package:clash_royale_assistant/core/logs/logger.dart';

import '../../../../core/constants/consts.dart';
import '../../../../core/error/failure_extensions.dart';
import '../../../domain/repository/current_player_tag_repository.dart';
import 'bloc.dart';

class CurrentPlayerTagBloc
    extends Bloc<CurrentPlayerTagEvent, CurrentPlayerTagState> {
  final CurrentPlayerTagRepository _repository;

  CurrentPlayerTagBloc({
    required CurrentPlayerTagRepository repository,
  })  : _repository = repository,
        super(Empty());

  Stream<CurrentPlayerTagState> mapEventToState(
      CurrentPlayerTagEvent event) async* {
    logger.d('CurrentPlayerTagBloc: get new $event');
    if (event is GetCurrentPlayerTagEvent) {
      logger.d('CurrentPlayerTagBloc: GetCurrentPlayerTagEvent');
      yield Loading();
      final failureOrPlayerTag = await _repository.getCurrentPlayerTag();
      yield failureOrPlayerTag.fold(
        (failure) {
          return Empty();
        },
        (playerTag) {
          logger.d('CurrentPlayerTagBloc: playerTag $playerTag');
          return Loaded(playerTag: playerTag);
        },
      );
    } else if (event is SaveCurrentPlayerTagEvent) {
      logger.d('SaveCurrentPlayerTagEvent');

      yield Saving();
      final failureOrSavePlayerTag =
          await _repository.saveCurrentPlayerTag(playerTag: event.playerTag);
      yield failureOrSavePlayerTag.fold(
        (failure) => Error(message: failure.toMessage),
        (isSaved) {
          logger.d('SaveCurrentPlayerTagEvent: $isSaved');
          if (isSaved) {
            return Saved();
          }
          return Error(message: AppTexts.error.playerTagNotSavedMessage);
        },
      );
    } else {
      logger.d('SaveCurrentPlayerTagEvent: else');
      yield Error(message: AppTexts.error.unexpectedEvent);
    }
  }
}
