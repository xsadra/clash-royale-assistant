import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart' show required;

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/battles.dart';
import '../../domain/repository/battles_repository.dart';
import '../datasources/datasources.dart';

class BattlesRepositoryImpl implements BattlesRepository {
  final NetworkInfo networkInfo;
  final BattlesLocalDataSource localDataSource;
  final BattlesRemoteDataSource remoteDataSource;

  BattlesRepositoryImpl({
    @required this.networkInfo,
    @required this.localDataSource,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Battles>> getBattles(String playerTag) async {
    if (await networkInfo.isConnected) {
      log(
        'Device has network connection',
        name: 'BattlesRepositoryImpl',
      );
      try {
        final remoteBattles = await remoteDataSource.getBattles(playerTag);
        log(
          remoteBattles.toString().substring(0, 200),
          name: 'BattlesRepositoryImpl',
        );
        log(
          'Saving Player to local...',
          name: 'BattlesRepositoryImpl',
        );
        localDataSource.cacheBattles(remoteBattles);
        return right(remoteBattles);
      } on ServerException {
        log(
          'Server Exceptions happened...',
          name: 'BattlesRepositoryImpl',
          error: 'Server Exceptions happened...',
        );
        return left(ServerFailure());
      }
    }
    log(
      'Device has NOT network connection',
      name: 'BattlesRepositoryImpl',
    );
    try {
      log(
        'Getting Data from Local',
        name: 'BattlesRepositoryImpl',
      );
      final localBattles = await localDataSource.getLastData();
      log(
        localBattles.toString().substring(0, 200),
        name: 'BattlesRepositoryImpl',
      );
      return Right(localBattles);
    } on CacheException {
      log(
        'Cache Exceptions happened...',
        name: 'BattlesRepositoryImpl',
        error: 'Cache Exceptions happened...',
      );
      return Left(CacheFailure());
    }
  }
}
