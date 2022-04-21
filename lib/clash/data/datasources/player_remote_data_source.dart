import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/entities/player.dart';
import '../models/player_model.dart';

abstract class PlayerRemoteDataSource {
  ///Calls the [API_BASE_URL]/v1/players/{playerTag} endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<Player> getPlayer(String playerTag);
}

class PlayerRemoteDataSourceImpl implements PlayerRemoteDataSource {
  final Dio dio;

  PlayerRemoteDataSourceImpl({
    @required this.dio,
  });

  @override
  Future<Player> getPlayer(String playerTag) async {
    final response = await dio
        .get(
          AppTexts.api.apiBasePlayerUrlProxy + playerTag,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'authorization': "Bearer $API_TOKEN_PROXY",
          }),
        )
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
      throw ServerException();
    });

    return PlayerModel.fromJson(response.data);
  }
}
