import 'package:clash_royale_assistant/clash/data/models/up_chests_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/up_chests.dart';
import '../../domain/repository/upcoming_chest_repository.dart';
import '../datasources/datasources.dart';

class UpcomingChestsRepositoryImpl implements UpcomingChestsRepository {
  final NetworkInfo networkInfo;
  final UpcomingChestsLocalDataSource localDataSource;

  final UpcomingChestsRemoteDataSource remoteDataSource;

  const UpcomingChestsRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, UpChests>> getUpcomingChests(String playerTag) async {
    if (await networkInfo.isConnected) {
      try {
        final UpChests remoteUpChests =
            await remoteDataSource.getUpcomingChests(playerTag);
        localDataSource.cacheUpcomingChests(remoteUpChests as UpChestsModel);
        return right(remoteUpChests);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    try {
      final localUpChests = await localDataSource.getLastData();
      return Right(localUpChests);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
