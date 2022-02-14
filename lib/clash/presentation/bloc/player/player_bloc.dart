import 'dart:async' show Stream;
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/consts.dart';
import '../../../../core/error/failure_extensions.dart';
import '../../../domain/usecases/get_player.dart';
import 'bloc.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final GetPlayer _getPlayer;

  PlayerBloc({@required GetPlayer player})
      : assert(player != null),
        _getPlayer = player,
        super(Empty());

  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is GetPlayerEvent) {
      yield Loading();
      log('getBattles', name: 'PlayerBloc');
      final failureOrPlayer = await _getPlayer(event.playerTag);
      log('getBattles fold', name: 'PlayerBloc');
      yield failureOrPlayer.fold(
        (failure) => Error(message: failure.toMessage),
        (chests) => Loaded(player: chests),
      );
    } else {
      yield Error(message: AppTexts.error.unexpectedEvent);
    }
  }
}
