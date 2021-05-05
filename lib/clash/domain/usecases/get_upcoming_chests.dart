import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/failure.dart';
import '../entities/upcoming_chest.dart';
import '../repository/upcoming_chest_repository.dart';

class GetUpcomingChests {
  final UpcomingChestsRepository repository;

  const GetUpcomingChests({
    @required this.repository,
  });

  Future<Either<Failure, List<UpcomingChest>>> call() async =>
      await repository.getUpcomingChests();
}
