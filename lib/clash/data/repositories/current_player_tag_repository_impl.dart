import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/current_player_tag.dart';
import '../../domain/repository/current_player_tag_repository.dart';
import '../datasources/datasources.dart' show CurrentPlayerTagLocalDataSource;
import '../models/current_player_tag_model.dart';

class CurrentPlayerTagRepositoryImpl implements CurrentPlayerTagRepository {
  final CurrentPlayerTagLocalDataSource localDataSource;

  const CurrentPlayerTagRepositoryImpl({
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, CurrentPlayerTag>> getCurrentPlayerTag() async {
    log('getCurrentPlayerTag', name: 'CurrentPlayerTagRepositoryImpl');
    try {
      final currentTag = await localDataSource.getCurrentPlayerTagData();
      return Right(currentTag);
    } on CacheException {
      log('getCurrentPlayerTag',
          name: 'CurrentPlayerTagRepositoryImpl', error: 'CacheException');
      return Left(CacheFailure());
    } on NotFoundException {
      log('getCurrentPlayerTag',
          name: 'CurrentPlayerTagRepositoryImpl', error: 'NotFoundException');
      return Left(NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveCurrentPlayerTag(
      {CurrentPlayerTag playerTag}) async {
    try {
      bool result = true;
      log('saveCurrentPlayerTag', name: 'CurrentPlayerTagRepositoryImpl');
      await localDataSource
          .saveCurrentPlayerTag(CurrentPlayerTagModel.fromObject(playerTag));

      return Right(result);
    } on CacheException {
      log('saveCurrentPlayerTag',
          name: 'CurrentPlayerTagRepositoryImpl', error: 'CacheException');
      return Left(CacheFailure());
    }
  }
}
