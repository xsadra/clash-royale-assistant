import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/texts.dart';
import '../../../core/error/exceptions.dart';
import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  /// Gets the cached list of [ProfileModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<ProfileModel> getLastData();

  Future<void> cacheProfile(ProfileModel profileToCache);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  const ProfileLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<ProfileModel> getLastData() {
    final jsonString = sharedPreferences.getString(CACHED_PROFILE);
    if (jsonString == null) {
      throw CacheException();
    }

    return Future.value(ProfileModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<void> cacheProfile(ProfileModel profileToCache) {
    return sharedPreferences.setString(
      CACHED_PROFILE,
      jsonEncode(profileToCache),
    );
  }
}
