import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/consts.dart';
import '../../../core/constants/secret.dart';
import '../../../core/error/exceptions.dart';

// Fix Step: force to use [RoyaleTags] type
class RoyaleTagsType {
  static String player = AppApiTexts.API_BASE_PLAYER_URL_PROXY;
  static String clan = AppApiTexts.API_BASE_CLAN_URL_PROXY;
  static String tournaments = AppApiTexts.API_BASE_TOURNAMENT_URL_PROXY;
}

abstract class ValidateTagRemoteDataSource {
  //Fix Step: 404, 403, ...
  ///Calls the [API_BASE_URL]/v1/{type}/{tag} endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<bool> isValidTag({
    @required String tag,
    @required String type,
  });
}

class ValidateTagRemoteDataSourceImpl implements ValidateTagRemoteDataSource {
  final Dio dio;

  ValidateTagRemoteDataSourceImpl({
    @required this.dio,
  });

  @override
  Future<bool> isValidTag({
    @required String tag,
    @required String type,
  }) async {
    final response = await dio
        .get(
          type + tag,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'authorization': "Bearer $API_TOKEN_PROXY",
          }),
        )
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
      throw ServerException();
    });

    return response.statusCode == 200;
  }
}
