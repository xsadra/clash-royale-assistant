import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/battles.dart';

abstract class BattlesRepository {
  Future<Either<Failure, Battles>> getBattles(String playerTag);
}
