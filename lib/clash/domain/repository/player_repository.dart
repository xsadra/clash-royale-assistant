import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/player.dart';

abstract class PlayerRepository {
  Future<Either<Failure, Player>> getPlayer(String tag);
}
