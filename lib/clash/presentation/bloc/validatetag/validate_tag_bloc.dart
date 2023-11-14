import 'dart:async' show Stream;

import 'package:bloc/bloc.dart' show Bloc;

import '../../../domain/repository/validate_tag_repository.dart';
import 'bloc.dart';

class ValidateTagBloc extends Bloc<ValidateTagEvent, ValidateTagState> {
  final ValidateTagRepository _repository;

  ValidateTagBloc({
    required ValidateTagRepository repository,
  })  : _repository = repository,
        super(Empty());

  Stream<ValidateTagState> mapEventToState(ValidateTagEvent event) async* {
    if (event is CheckValidateTagEvent) {
      yield Loading();
      final validateTag =
          await _repository.isValidTag(tag: event.tag, type: event.type);

      yield validateTag ? IsValid() : NotValid();
    }
  }
}
