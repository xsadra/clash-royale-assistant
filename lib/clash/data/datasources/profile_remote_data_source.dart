import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/secret.dart';
import '../../../core/constants/texts.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/entities/profile.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  ///Calls the [API_BASE_URL]/v1/players/{playerTag} endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<Profile> getProfile(String playerTag);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl({
    @required this.dio,
  });

  @override
  Future<Profile> getProfile(String playerTag) async {
    final response = await dio
        .get(
          API_BASE_PLAYER_URL_PROXY + playerTag,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'authorization': "Bearer $API_TOKEN_PROXY",
          }),
        )
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
      throw ServerException();
    });

    return ProfileModel.fromJson(response.data);
  }
}
