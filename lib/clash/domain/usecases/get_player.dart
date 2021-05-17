import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/failure.dart';
import '../entities/player.dart';
import '../repository/player_repository.dart';

class GetPlayer {
  final PlayerRepository repository;

  const GetPlayer({
    @required this.repository,
  });

  Future<Either<Failure, Player>> call(String playerTag) async =>
      await repository.getPlayer(playerTag);
}
