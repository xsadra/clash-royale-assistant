import 'dart:async' show Stream;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/texts.dart';
import '../../../../core/error/failure_extensions.dart';
import '../../../domain/usecases/get_profile.dart';
import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile _getProfile;

  ProfileBloc({@required GetProfile profile})
      : assert(profile != null),
        _getProfile = profile,
        super(Empty());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetProfileEvent) {
      yield Loading();
      final failureOrProfile = await _getProfile(event.playerTag);
      yield failureOrProfile.fold(
        (failure) => Error(message: failure.toMessage),
        (chests) => Loaded(profile: chests),
      );
    } else {
      yield Error(message: UNEXPECTED_EVENT);
    }
  }
}
