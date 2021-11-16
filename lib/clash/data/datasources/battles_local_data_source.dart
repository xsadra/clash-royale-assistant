import 'dart:convert';

import 'package:meta/meta.dart' show required;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../models/battles_model.dart';

abstract class BattlesLocalDataSource {
  /// Gets the cached list of [BattlesModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<BattlesModel> getLastData();

  Future<void> cacheBattles(BattlesModel battlesToCache);
}

class BattlesLocalDataSourceImpl implements BattlesLocalDataSource {
  final SharedPreferences sharedPreferences;

  BattlesLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<BattlesModel> getLastData() {
    final jsonString =
        sharedPreferences.getString(AppTexts.consts.cachedBattles);
    if (jsonString == null) {
      throw CacheException();
    }

    return Future.value(BattlesModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<void> cacheBattles(BattlesModel battlesToCache) {
    return sharedPreferences.setString(
      AppTexts.consts.cachedBattles,
      battlesToCache.toJson()['battles'],
    );
  }
}
