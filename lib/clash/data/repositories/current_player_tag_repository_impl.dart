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
    try {
      final currentTag = await localDataSource.getCurrentPlayerTagData();
      return Right(currentTag);
    } on CacheException {
      return Left(CacheFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveCurrentPlayerTag(
      {required CurrentPlayerTag playerTag}) async {
    try {
      bool result = true;
      await localDataSource
          .saveCurrentPlayerTag(CurrentPlayerTagModel.fromObject(playerTag));

      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
