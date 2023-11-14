import 'dart:convert';

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
    required this.sharedPreferences,
  });

  @override
  Future<PlayerModel> getLastData() {
    final jsonString =
        sharedPreferences.getString(AppTexts.consts.cachedPlayer);
    if (jsonString == null) {
      throw CacheException();
    }
    return Future.value(
        PlayerModel.fromJson(jsonDecode(json.decode(jsonString).toString())));
  }

  @override
  Future<void> cachePlayer(PlayerModel playerToCache) {
    return sharedPreferences.setString(
      AppTexts.consts.cachedPlayer,
      jsonEncode(playerToCache.toJson()),
    );
  }
}
