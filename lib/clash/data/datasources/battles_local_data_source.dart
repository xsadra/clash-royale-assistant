import 'dart:convert';

import 'package:meta/meta.dart' show required;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../models/battles_model.dart';

abstract class BattleLocalDataSource {
  /// Gets the cached list of [BattlesModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<BattlesModel> getLastData();

  Future<void> cacheBattles(BattlesModel battlesToCache);
}

class BattleLocalDataSourceImpl implements BattleLocalDataSource {
  final SharedPreferences sharedPreferences;

  BattleLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<BattlesModel> getLastData() {
    final jsonString =
        sharedPreferences.getString(AppConstTests.CACHED_BATTLES);
    if (jsonString == null) {
      throw CacheException();
    }

    return Future.value(BattlesModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<void> cacheBattles(BattlesModel battlesToCache) {
    return sharedPreferences.setString(
      AppConstTests.CACHED_BATTLES,
      jsonEncode(battlesToCache),
    );
  }
}
