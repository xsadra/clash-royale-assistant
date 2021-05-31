import 'dart:developer';

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
      log('Device has network connection', name: 'PlayerRepositoryImpl');
      try {
        log('Getting Data from Api', name: 'PlayerRepositoryImpl');
        final remotePlayer = await remoteDataSource.getPlayer(playerTag);
        log(remotePlayer.toString().substring(0, 100),
            name: 'PlayerRepositoryImpl');
        log('Saving Player to local...', name: 'PlayerRepositoryImpl');
        localDataSource.cachePlayer(remotePlayer);
        return right(remotePlayer);
      } on ServerException {
        log('Server Exceptions happened...',
            name: 'PlayerRepositoryImpl',
            error: 'Server Exceptions happened...');
        return left(ServerFailure());
      }
    }
    log('Device has NOT network connection', name: 'PlayerRepositoryImpl');
    try {
      log('Getting Data from Local', name: 'PlayerRepositoryImpl');
      final localPlayer = await localDataSource.getLastData();
      log(localPlayer.toString().substring(0, 100),
          name: 'PlayerRepositoryImpl');
      return Right(localPlayer);
    } on CacheException {
      log('Cache Exceptions happened...',
          name: 'PlayerRepositoryImpl', error: 'Cache Exceptions happened...');
      return Left(CacheFailure());
    }
  }
}
