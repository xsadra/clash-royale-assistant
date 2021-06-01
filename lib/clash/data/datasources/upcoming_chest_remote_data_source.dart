import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/secret.dart';
import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/entities/up_chests.dart';
import '../models/up_chests_model.dart';

abstract class UpcomingChestsRemoteDataSource {
  ///Calls the [API_BASE_URL]/v1/players/{playerTag}/upcomingchests endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<UpChests> getUpcomingChests(String playerTag);
}

class UpcomingChestsRemoteDataSourceImpl
    implements UpcomingChestsRemoteDataSource {
  final Dio dio;

  UpcomingChestsRemoteDataSourceImpl({
    @required this.dio,
  });

  @override
  Future<UpChests> getUpcomingChests(String playerTag) async {
    final response = await dio
        .get(
      AppApiTexts.API_BASE_PLAYER_URL_PROXY + playerTag +
          AppApiTexts.UPCOMING_CHESTS,
      options: Options(headers: {
        'Content-Type': 'application/json',
        'authorization': "Bearer $API_TOKEN_PROXY",
      }),
    )
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
      throw ServerException();
    });

    return UpChestsModel.fromJson(response.data);
    // return (jsonMap['items'] as List)
    //     .map((item) => UpcomingChestModel.fromJson(item))
    //     .toList();
  }
}
