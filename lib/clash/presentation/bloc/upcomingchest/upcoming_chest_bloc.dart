import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class UpcomingChestsBloc
    extends Bloc<UpcomingChestsEvent, UpcomingChestsState> {
  UpcomingChestsBloc() : super(Empty());

  @override
  Stream<UpcomingChestsState> mapEventToState(
      UpcomingChestsEvent event) async* {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
