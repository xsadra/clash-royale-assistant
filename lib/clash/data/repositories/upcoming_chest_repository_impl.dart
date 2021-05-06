import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/upcoming_chest.dart';
import '../../domain/repository/upcoming_chest_repository.dart';
import '../datasources/datasources.dart';

class UpcomingChestsRepositoryImpl implements UpcomingChestsRepository {
  final NetworkInfo networkInfo;
  final UpcomingChestsLocalDataSource localDataSource;

  final UpcomingChestsRemoteDataSource remoteDataSource;

  const UpcomingChestsRepositoryImpl({
    @required this.networkInfo,
    @required this.localDataSource,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<UpcomingChest>>> getUpcomingChests(
      String playerTag) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUpcomingChests =
            await remoteDataSource.getUpcomingChests(playerTag);
        //! Fix Step: save to local Data Source
        // localDataSource.cacheUpcomingChests(remoteUpcomingChests);
        return right(remoteUpcomingChests);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    try {
      final localUpcomingChests = await localDataSource.getLastData();
      return Right(localUpcomingChests);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
