import 'dart:convert';

import 'package:clash_royale_assistant/core/constants/texts.dart';
import 'package:clash_royale_assistant/core/error/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/upcoming_chest_model.dart';

abstract class UpcomingChestsLocalDataSource {
  /// Gets the cached list of [UpcomingChestModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<List<UpcomingChestModel>> getLastData();

  Future<void> cacheUpcomingChests(
      List<UpcomingChestModel> upcomingChestsToCache);
}

class UpcomingChestsLocalDataSourceImpl
    implements UpcomingChestsLocalDataSource {
  final SharedPreferences sharedPreferences;

  const UpcomingChestsLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<void> cacheUpcomingChests(
      List<UpcomingChestModel> upcomingChestsToCache) {
    return sharedPreferences.setString(
      CACHED_UPCOMING_CHESTS,
      jsonEncode(upcomingChestsToCache),
    );
  }

  @override
  Future<List<UpcomingChestModel>> getLastData() {
    final jsonString = sharedPreferences.getString(CACHED_UPCOMING_CHESTS);
    if (jsonString == null) {
      throw CacheException();
    }
    return Future.value(UpcomingChestModel.fromJsonList(jsonString));
  }
}
