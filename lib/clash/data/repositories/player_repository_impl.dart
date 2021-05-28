import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/player.dart';
import '../../domain/repository/player_repository.dart';
import '../datasources/datasources.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final NetworkInfo networkInfo;
  final PlayerLocalDataSource localDataSource;
  final PlayerRemoteDataSource remoteDataSource;

  const PlayerRepositoryImpl({
    @required this.networkInfo,
    @required this.localDataSource,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Player>> getPlayer(String playerTag) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePlayer = await remoteDataSource.getPlayer(playerTag);
        localDataSource.cachePlayer(remotePlayer);
        return right(remotePlayer);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    try {
      final localPlayer = await localDataSource.getLastData();
      return Right(localPlayer);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
