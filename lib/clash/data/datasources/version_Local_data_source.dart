import 'dart:convert';

import 'package:meta/meta.dart' show required;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../models/version_model.dart';

abstract class VersionLocalDataSource {
  /// Gets the cached data of [VersionModel] which was gotten the last update.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<VersionModel> getLastData();

  /// Gets the cached current version.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<String> getCurrentVersion();

  /// Save current version to the local.
  Future<void> saveCurrentVersion(String version);

  /// Save [VersionModel] to the local.
  Future<void> cacheVersion(VersionModel versionToCache);
}

class VersionLocalDataSourceImpl implements VersionLocalDataSource {
  final SharedPreferences sharedPreferences;

  VersionLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<VersionModel> getLastData() {
    final jsonString =
        sharedPreferences.getString(AppTexts.consts.cachedVersionInfo);
    if (jsonString == null) {
      throw CacheException();
    }
    return Future.value(VersionModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<void> cacheVersion(VersionModel versionToCache) {
    return sharedPreferences.setString(
      AppTexts.consts.cachedVersionInfo,
      jsonEncode(versionToCache.toJson()),
    );
  }

  @override
  Future<String> getCurrentVersion() {
    final currentVersion =
        sharedPreferences.getString(AppTexts.consts.cachedVersion);
    if (currentVersion == null) {
      throw CacheException();
    }
    return Future.value(currentVersion);
  }

  @override
  Future<void> saveCurrentVersion(String version) {
    return sharedPreferences.setString(
      AppTexts.consts.cachedVersionInfo,
      version,
    );
  }
}
