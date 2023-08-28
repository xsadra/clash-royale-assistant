import 'package:dartz/dartz.dart' show Either;
import 'package:meta/meta.dart' show required;

import '../../../core/error/failure.dart';
import '../entities/current_player_tag.dart';

abstract class CurrentPlayerTagRepository {
  Future<Either<Failure, CurrentPlayerTag>> getCurrentPlayerTag();

  Future<Either<Failure, bool>> saveCurrentPlayerTag({
    required CurrentPlayerTag playerTag,
  });
}
