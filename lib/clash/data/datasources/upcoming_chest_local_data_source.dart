import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/texts.dart';
import '../../../core/error/exceptions.dart';
import '../models/up_chests_model.dart';
import '../models/upcoming_chest_model.dart';

abstract class UpcomingChestsLocalDataSource {
  /// Gets the cached list of [UpcomingChestModel] which was gotten the last time.
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
    final jsonString = sharedPreferences.getString(CACHED_UPCOMING_CHESTS);
    if (jsonString == null) {
      throw CacheException();
    }

    return Future.value(UpChestsModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<void> cacheUpcomingChests(UpChestsModel upcomingChestsToCache) {
    return sharedPreferences.setString(
      CACHED_UPCOMING_CHESTS,
      jsonEncode(upcomingChestsToCache),
    );
  }
}
