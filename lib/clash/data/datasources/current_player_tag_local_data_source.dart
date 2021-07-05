import 'dart:convert' show json, jsonEncode;
import 'dart:developer';

import 'package:meta/meta.dart' show required;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/consts.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/entities/current_player_tag.dart';
import '../models/current_player_tag_model.dart';

abstract class CurrentPlayerTagLocalDataSource {
  /// Gets the saved object of [CurrentPlayerTag].
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<CurrentPlayerTagModel> getCurrentPlayerTagData();

  Future<bool> saveCurrentPlayerTag(CurrentPlayerTagModel infoToSave);
}

class CurrentPlayerTagLocalDataSourceImpl
    implements CurrentPlayerTagLocalDataSource {
  final SharedPreferences sharedPreferences;

  const CurrentPlayerTagLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<bool> saveCurrentPlayerTag(CurrentPlayerTagModel tagToSave) {
    log('call local', name: 'CurrentPlayerTagLocalDataSourceImpl');
    log(tagToSave.playerTag, name: 'CurrentPlayerTagLocalDataSourceImpl');

    return sharedPreferences.setString(
      AppTexts.consts.currentPlayerTag,
      jsonEncode(tagToSave),
    );
  }

  @override
  Future<CurrentPlayerTagModel> getCurrentPlayerTagData() {
    try {
      final jsonString =
          sharedPreferences.getString(AppTexts.consts.currentPlayerTag);
      if (jsonString == null) {
        throw NotFoundException();
      }

      return Future.value(
        CurrentPlayerTagModel.fromJson(json.decode(jsonString)),
      );
    } catch (e) {
      throw CacheException();
    }
  }
}
