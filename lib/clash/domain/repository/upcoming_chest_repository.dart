import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/up_chests.dart';

abstract class UpcomingChestsRepository {
  Future<Either<Failure, UpChests>> getUpcomingChests(String tag);
}
