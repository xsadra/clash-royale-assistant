import 'dart:convert';

import 'package:clash_royale_assistant/clash/data/models/upcoming_chest_model.dart';
import 'package:clash_royale_assistant/clash/domain/entities/upcoming_chest.dart';
import 'package:clash_royale_assistant/core/constants/texts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/exceptions.dart';

abstract class UpcomingChestsRemoteDataSource {
  ///Calls the [API_BASE_URL]/v1/players/{tag}}/upcomingchests endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<List<UpcomingChest>> getUpcomingChests(String tag);
}

class UpcomingChestsRemoteDataSourceImpl
    implements UpcomingChestsRemoteDataSource {
  final Dio dio;

  UpcomingChestsRemoteDataSourceImpl({
    @required this.dio,
  });

  @override
  Future<List<UpcomingChest>> getUpcomingChests(String tag) async {
    Response response = await dio
        .get(API_BASE_PLAYER_URL + tag + UPCOMING_CHESTS, queryParameters: {
          'headers': {
            'Content-Type': 'application/json',
            'authorization': "Bearer $API_TOKEN",
          }
        })
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
          throw ServerException();
        });
    final jsonMap = json.decode(response.data);
    return (jsonMap['items'] as List)
        .map((item) => UpcomingChestModel.fromJson(item))
        .toList();
  }
}
