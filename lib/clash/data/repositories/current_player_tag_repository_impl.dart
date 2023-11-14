import 'package:clash_royale_assistant/core/logs/logger.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/current_player_tag.dart';
import '../../domain/repository/current_player_tag_repository.dart';
import '../datasources/datasources.dart' show CurrentPlayerTagLocalDataSource;
import '../models/current_player_tag_model.dart';

class CurrentPlayerTagRepositoryImpl implements CurrentPlayerTagRepository {
  final CurrentPlayerTagLocalDataSource localDataSource;

  const CurrentPlayerTagRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, CurrentPlayerTag>> getCurrentPlayerTag() async {
    logger.d('CurrentPlayerTagRepositoryImpl: Try getCurrentPlayerTag');
    try {
      final currentTag = await localDataSource.getCurrentPlayerTagData();
      logger.d(
          'CurrentPlayerTagRepositoryImpl: getCurrentPlayerTag - currentTag $currentTag');
      return Right(currentTag);
    } on CacheException {
      logger.d(
          'CurrentPlayerTagRepositoryImpl: getCurrentPlayerTag - CacheException');
      return Left(CacheFailure());
    } on NotFoundException {
      logger.d(
          'CurrentPlayerTagRepositoryImpl: getCurrentPlayerTag - NotFoundException');
      return Left(NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveCurrentPlayerTag({
    required CurrentPlayerTag playerTag,
  }) async {
    logger.d('CurrentPlayerTagRepositoryImpl: Try saveCurrentPlayerTag');
    try {
      bool result = true;
      await localDataSource
          .saveCurrentPlayerTag(CurrentPlayerTagModel.fromObject(playerTag));
      logger.d('CurrentPlayerTagRepositoryImpl: Saved saveCurrentPlayerTag');

      return Right(result);
    } on CacheException {
      logger.d('CurrentPlayerTagRepositoryImpl: CacheException saveCurrentPlayerTag');
      return Left(CacheFailure());
    }
  }
}
