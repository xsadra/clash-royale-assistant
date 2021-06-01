import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../models/player_model.dart';

abstract class PlayerLocalDataSource {
  /// Gets the cached list of [PlayerModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<PlayerModel> getLastData();

  Future<void> cachePlayer(PlayerModel playerToCache);
}

class PlayerLocalDataSourceImpl implements PlayerLocalDataSource {
  final SharedPreferences sharedPreferences;

  const PlayerLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<PlayerModel> getLastData() {
    log('Getting Data from sharedPreferences', name: 'PlayerLocalDataSource');
    final jsonString = sharedPreferences.getString(AppConstTests.CACHED_PLAYER);
    if (jsonString == null) {
      throw CacheException();
    }
    log(jsonString, name: 'PlayerLocalDataSource');

    return Future.value(PlayerModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<void> cachePlayer(PlayerModel playerToCache) {
    log('Save Data to sharedPreferences', name: 'PlayerLocalDataSource');
    log(playerToCache.toString().substring(0, 100),
        name: 'PlayerLocalDataSource');

    return sharedPreferences.setString(
      AppConstTests.CACHED_PLAYER,
      jsonEncode(playerToCache),
    );
  }
}
