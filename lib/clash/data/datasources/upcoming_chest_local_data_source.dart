import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../models/up_chests_model.dart' show UpChestsModel;

abstract class UpcomingChestsLocalDataSource {
  /// Gets the cached list of [UpChestsModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<UpChestsModel> getLastData();

  Future<void> cacheUpcomingChests(UpChestsModel upcomingChestsToCache);
}

class UpcomingChestsLocalDataSourceImpl
    implements UpcomingChestsLocalDataSource {
  final SharedPreferences sharedPreferences;

  const UpcomingChestsLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<UpChestsModel> getLastData() {
    final jsonString =
        sharedPreferences.getString(AppText.consts.cachedUpcomingChests);
    if (jsonString == null) {
      throw CacheException();
    }

    return Future.value(UpChestsModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<void> cacheUpcomingChests(UpChestsModel upcomingChestsToCache) {
    return sharedPreferences.setString(
      AppText.consts.cachedUpcomingChests,
      jsonEncode(upcomingChestsToCache),
    );
  }
}
