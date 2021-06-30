import 'dart:convert';

import 'package:meta/meta.dart' show required;

import '../../domain/entities/battle.dart';
import '../../domain/entities/battles.dart';
import 'battle_model.dart';

class BattlesModel extends Battles {
  const BattlesModel({
    @required List<BattleModel> battles,
  }) : super(battles: battles);

  factory BattlesModel.fromJson(Map<String, dynamic> jsonMap) {
    dynamic battles = jsonMap['battles'];
    dynamic decodedItems = battles is String ? jsonDecode(battles) : battles;
    return new BattlesModel(
      battles:
          (decodedItems as List).map((e) => BattleModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'battles':
          jsonEncode(this.battles.map((element) => _toJson(element)).toList()),
    } as Map<String, dynamic>;
  }

  Map<String, dynamic> _toJson(Battle element) =>
      (element as BattleModel).toJson();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BattlesModel &&
          runtimeType == other.runtimeType &&
          battles == other.battles;

  @override
  int get hashCode => battles.hashCode;

  @override
  String toString() {
    return 'BattlesModel{battles: $battles}';
  }
}
