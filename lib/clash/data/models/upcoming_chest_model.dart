import 'dart:convert';

import 'package:clash_royale_assistant/clash/domain/entities/upcoming_chest.dart';
import 'package:flutter/foundation.dart';

class UpcomingChestModel extends UpcomingChest {
  const UpcomingChestModel({
    @required int index,
    @required String name,
  }) : super(index: index, name: name);

  factory UpcomingChestModel.fromJson(Map<String, dynamic> json) {
    return new UpcomingChestModel(
      index: json['index'] as int,
      name: json['name'] as String,
    );
  }

  static List<UpcomingChestModel> fromJsonList(dynamic jsonList) {
    Iterable list = json.decode(jsonList);
    return List<UpcomingChestModel>.from(
      list.map(
        (model) => UpcomingChestModel.fromJson(model),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'index': this.index,
      'name': this.name,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpcomingChestModel &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          name == other.name);

  @override
  int get hashCode => index.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'UpcomingChestModel:\nindex: $index, name: $name\n';
  }
}
