import 'dart:convert';

import 'package:clash_royale_assistant/clash/domain/entities/upcoming_chest.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/up_chests.dart';
import 'upcoming_chest_model.dart';

class UpChestsModel extends UpChests {
  const UpChestsModel({
    @required List<UpcomingChestModel> items,
  }) : super(items: items);

  factory UpChestsModel.fromJson(Map<String, dynamic> jsonMap) {
    dynamic items = jsonMap['items'];
    dynamic decodedItems = items is String ? jsonDecode(items) : items;
    return new UpChestsModel(
      items: (decodedItems as List)
          .map((item) => UpcomingChestModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'items':
          jsonEncode(this.items.map((element) => _toJson(element)).toList()),
    } as Map<String, dynamic>;
  }

  Map<String, dynamic> _toJson(UpcomingChest element) =>
      (element as UpcomingChestModel).toJson();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpChestsModel &&
          runtimeType == other.runtimeType &&
          items == other.items;

  @override
  int get hashCode => items.hashCode;

  @override
  String toString() {
    return 'UpChestsModel{items: $items}';
  }
}