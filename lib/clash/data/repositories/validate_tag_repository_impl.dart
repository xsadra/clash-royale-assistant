import 'package:meta/meta.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/repository/validate_tag_repository.dart';
import '../datasources/validate_tag_remote_data_source.dart';

class ValidateTagRepositoryImpl implements ValidateTagRepository {
  final NetworkInfo networkInfo;
  final ValidateTagRemoteDataSource remoteDataSource;

  ValidateTagRepositoryImpl({
    @required this.networkInfo,
    @required this.remoteDataSource,
  });

  @override
  Future<bool> isValidTag({String tag, String type}) async {
    if (await networkInfo.isConnected) {
      try {
        return await remoteDataSource.isValidTag(tag: tag, type: type);
      } on ServerException {
        return false;
      }
    }
    return false;
  }
}
