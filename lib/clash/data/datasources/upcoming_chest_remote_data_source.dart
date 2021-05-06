import 'package:clash_royale_assistant/core/constants/secret.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/texts.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/entities/upcoming_chest.dart';
import '../models/upcoming_chest_model.dart';

abstract class UpcomingChestsRemoteDataSource {
  ///Calls the [API_BASE_URL]/v1/players/{playerTag}}/upcomingchests endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<List<UpcomingChest>> getUpcomingChests(String playerTag);
}

class UpcomingChestsRemoteDataSourceImpl
    implements UpcomingChestsRemoteDataSource {
  final Dio dio;

  UpcomingChestsRemoteDataSourceImpl({
    @required this.dio,
  });

  @override
  Future<List<UpcomingChest>> getUpcomingChests(String playerTag) async {
    final response = await dio
        .get(
          API_BASE_PLAYER_URL_PROXY + playerTag + UPCOMING_CHESTS,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'authorization': "Bearer $API_TOKEN_PROXY",
          }),
        )
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
      throw ServerException();
    });

    final jsonMap = response.data;
    return (jsonMap['items'] as List)
        .map((item) => UpcomingChestModel.fromJson(item))
        .toList();
  }
}
