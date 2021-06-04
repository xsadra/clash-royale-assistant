import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;

import '../../../core/constants/consts.dart';
import '../../../core/constants/secret.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/entities/battles.dart';
import '../models/battles_model.dart';

abstract class BattlesRemoteDataSource {
  ///Calls the [API_BASE_URL]/v1/players/{playerTag}/battlelog endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<Battles> getBattles(String playerTag);
}

class BattlesRemoteDataSourceImpl implements BattlesRemoteDataSource {
  final Dio dio;

  BattlesRemoteDataSourceImpl({
    @required this.dio,
  });

  @override
  Future<Battles> getBattles(String playerTag) async {
    final response = await dio
        .get(
          AppApiTexts.API_BASE_PLAYER_URL_PROXY +
              playerTag +
              AppApiTexts.BATTLES,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'authorization': "Bearer $API_TOKEN_PROXY",
          }),
        )
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
      throw ServerException();
    });

    return BattlesModel.fromJson(response.data);
  }
}
