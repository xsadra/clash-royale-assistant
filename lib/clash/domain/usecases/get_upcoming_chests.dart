import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/failure.dart';
import '../entities/up_chests.dart';
import '../repository/upcoming_chest_repository.dart';

class GetUpcomingChests {
  final UpcomingChestsRepository repository;

  const GetUpcomingChests({
    @required this.repository,
  });

  Future<Either<Failure, UpChests>> call(String playerTag) async =>
      await repository.getUpcomingChests(playerTag);
}
