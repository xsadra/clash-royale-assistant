import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/version.dart';
import '../../domain/repository/version_repository.dart';
import '../datasources/datasources.dart';

class VersionRepositoryImpl implements VersionRepository {
  final NetworkInfo networkInfo;
  final VersionLocalDataSource localDataSource;
  final VersionRemoteDataSource remoteDataSource;

  const VersionRepositoryImpl({
    @required this.networkInfo,
    @required this.localDataSource,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Version>> getVersion() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteVersion = await remoteDataSource.getVersion();
        localDataSource.cacheVersion(remoteVersion);
        return right(remoteVersion);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    try {
      final localVersion = await localDataSource.getLastData();
      return Right(localVersion);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<bool> isUpdatedVersion() async {
    final remoteVersion = await remoteDataSource.getVersion();
    final localVersion = await localDataSource.getLastData();
    return localVersion.current == remoteVersion.current;
  }

  @override
  Future<void> saveCurrentVersion(String versionTag) async {
    localDataSource.saveCurrentVersion(versionTag);
  }
}
