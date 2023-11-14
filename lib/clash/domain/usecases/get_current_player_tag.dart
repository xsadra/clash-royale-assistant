import 'package:dartz/dartz.dart' show Either;

import '../../../core/error/failure.dart';
import '../entities/current_player_tag.dart';
import '../repository/current_player_tag_repository.dart';

class GetCurrentPlayerTag {
  final CurrentPlayerTagRepository repository;

  const GetCurrentPlayerTag({
    required this.repository,
  });

  Future<Either<Failure, CurrentPlayerTag>> call() async =>
      await repository.getCurrentPlayerTag();
}
