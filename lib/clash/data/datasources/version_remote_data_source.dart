import 'package:dio/dio.dart';

import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/entities/version.dart';
import '../models/version_model.dart';

abstract class VersionRemoteDataSource {
  ///Calls the [api.sadra.at/cra/get/version.json endpoint to get last app version.
  ///
  /// Throws [ServerException] for all error codes.
  Future<Version> getVersion();
}

class VersionRemoteDataSourceImpl implements VersionRemoteDataSource {
  final Dio dio;

  VersionRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<Version> getVersion() async {
    final response = await dio
        .get(
          AppTexts.api.apiGetVersion,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
        )
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
      throw ServerException();
    });

    return VersionModel.fromJson(response.data);
  }
}
