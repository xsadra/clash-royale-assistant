import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasources/datasources.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileLocalDataSource localDataSource;

  final ProfileRemoteDataSource remoteDataSource;

  const ProfileRepositoryImpl({
    @required this.networkInfo,
    @required this.localDataSource,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Profile>> getProfile(String playerTag) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProfile = await remoteDataSource.getProfile(playerTag);
        localDataSource.cacheProfile(remoteProfile);
        return right(remoteProfile);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    try {
      final localProfile = await localDataSource.getLastData();
      return Right(localProfile);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
