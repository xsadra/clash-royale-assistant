import 'package:dartz/dartz.dart' show Either;
import 'package:meta/meta.dart' show required;

import '../../../core/error/failure.dart';
import '../entities/current_player_tag.dart';
import '../repository/current_player_tag_repository.dart';

class GetCurrentPlayerTag {
  final CurrentPlayerTagRepository repository;

  const GetCurrentPlayerTag({
    required this.repository,
  });

  Future<Either<Failure, bool>> call(CurrentPlayerTag playerTag) async =>
      await repository.saveCurrentPlayerTag(playerTag: playerTag);
}
