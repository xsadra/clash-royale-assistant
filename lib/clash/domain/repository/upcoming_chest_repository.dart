import 'package:clash_royale_assistant/clash/domain/entities/upcoming_chest.dart';
import 'package:clash_royale_assistant/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UpcomingChestsRepository {
  Future<Either<Failure, List<UpcomingChest>>> getUpcomingChests();
}
