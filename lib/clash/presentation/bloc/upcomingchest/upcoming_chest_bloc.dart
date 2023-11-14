import 'dart:async' show Stream;

import 'package:bloc/bloc.dart';

import '../../../../core/constants/consts.dart';
import '../../../../core/error/failure_extensions.dart';
import '../../../domain/usecases/get_upcoming_chests.dart';
import 'bloc.dart';

class UpcomingChestsBloc
    extends Bloc<UpcomingChestsEvent, UpcomingChestsState> {
  final GetUpcomingChests _getUpcomingChests;

  UpcomingChestsBloc({required GetUpcomingChests upcomingChests})
      : _getUpcomingChests = upcomingChests,
        super(Empty());

  Stream<UpcomingChestsState> mapEventToState(
      UpcomingChestsEvent event) async* {
    if (event is GetUpcomingChestsEvent) {
      yield Loading();
      final failureOrUpcomingChests = await _getUpcomingChests(event.playerTag);
      yield failureOrUpcomingChests.fold(
        (failure) => Error(message: failure.toMessage),
        (chests) => Loaded(upcomingChests: chests),
      );
    } else {
      yield Error(message: AppTexts.error.unexpectedEvent);
    }
  }
}
