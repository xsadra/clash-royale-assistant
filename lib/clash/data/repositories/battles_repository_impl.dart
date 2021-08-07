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
      try {
        final remoteBattles = await remoteDataSource.getBattles(playerTag);
        localDataSource.cacheBattles(remoteBattles);
        return right(remoteBattles);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    try {
      final localBattles = await localDataSource.getLastData();
      return Right(localBattles);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
