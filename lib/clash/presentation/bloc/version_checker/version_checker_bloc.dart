import 'dart:async' show Stream;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/consts.dart';
import '../../../../core/error/failure_extensions.dart';
import '../../../domain/repository/version_repository.dart';
import 'bloc.dart';

class VersionCheckerBloc
    extends Bloc<VersionCheckerEvent, VersionCheckerState> {
  final VersionRepository _repository;

  VersionCheckerBloc({@required VersionRepository repository})
      : assert(repository != null),
        _repository = repository,
        super(Empty());

  @override
  Stream<VersionCheckerState> mapEventToState(
    VersionCheckerEvent event,
  ) async* {
    if (event is GetVersionEvent) {
      yield Loading();
      final failureOrVersion = await _repository.getVersion();
      failureOrVersion.fold(
        (failure) => Error(message: failure.toMessage),
        (version) => Loaded(version: version),
      );
    } else if (event is CheckIsUpdatedVersionEvent) {
      yield CheckingVersion();
      final isUpdated = await _repository.isUpdatedVersion();
      yield isUpdated ? IsUpdated() : NotUpdate();
    } else if (event is SaveCurrentVersionEvent) {
      yield Saving();
      await _repository.saveCurrentVersion(event.currentVersion);
      yield Saved();
    } else {
      yield Error(message: AppTexts.error.unexpectedEvent);
    }
  }
}
