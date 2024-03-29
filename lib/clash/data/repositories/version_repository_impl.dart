import 'package:clash_royale_assistant/clash/data/models/version_model.dart';
import 'package:dartz/dartz.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/logs/logger.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/version.dart';
import '../../domain/repository/version_repository.dart';
import '../datasources/datasources.dart';

class VersionRepositoryImpl implements VersionRepository {
  final NetworkInfo networkInfo;
  final VersionLocalDataSource localDataSource;
  final VersionRemoteDataSource remoteDataSource;

  const VersionRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Version>> getVersion() async {
    if (await networkInfo.isConnected) {
      try {
        final Version remoteVersion = await remoteDataSource.getVersion();
        logVersion.v('Get remoteVersion', 'VersionRepositoryImpl');
        logVersion.v(remoteVersion.toString(), 'VersionRepositoryImpl');
        localDataSource.cacheVersion(remoteVersion as VersionModel);
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
    final serverVersion = await networkInfo.isConnected
        ? await remoteDataSource.getVersion()
        : await localDataSource.getLastData();

    logVersion.d(
        'Server Version: ' + serverVersion.current!, 'VersionRepositoryImpl');

    final platformInfo = await PackageInfo.fromPlatform();
    logVersion.d(
        'Platform Version: ' + platformInfo.version, 'VersionRepositoryImpl');
    logVersion.d('Platform buildNumber: ' + platformInfo.buildNumber,
        'VersionRepositoryImpl');

    return platformInfo.version == serverVersion.current;
  }

  @override
  Future<void> saveCurrentVersion() async {
    final platformInfo = await PackageInfo.fromPlatform();
    localDataSource.saveCurrentVersion(platformInfo.version);
  }
}
