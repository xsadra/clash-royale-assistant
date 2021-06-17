import 'package:meta/meta.dart' show required;

import '../../domain/entities/card.dart';

class CardModel extends Card {
  const CardModel({
    @required String name,
    @required int id,
    @required int level,
    @required int starLevel,
    @required int maxLevel,
    @required IconUrlsModel iconUrls,
  }) : super(
          name: name,
          id: id,
          level: level,
          starLevel: starLevel,
          maxLevel: maxLevel,
          iconUrls: iconUrls,
        );

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return new CardModel(
      name: json['name'] as String,
      id: json['id'] as int,
      level: json['level'] as int,
      starLevel: json['starLevel'] as int,
      maxLevel: json['maxLevel'] as int,
      iconUrls: IconUrlsModel.fromJson(json['iconUrls']),
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'id': this.id,
      'level': this.level,
      'starLevel': this.starLevel,
      'maxLevel': this.maxLevel,
      'iconUrls': (this.iconUrls as IconUrlsModel).toJson(),
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          level == other.level &&
          starLevel == other.starLevel &&
          maxLevel == other.maxLevel &&
          iconUrls == other.iconUrls;

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      level.hashCode ^
      starLevel.hashCode ^
      maxLevel.hashCode ^
      iconUrls.hashCode;

  @override
  String toString() {
    return 'CardModel{name: $name, id: $id, level: $level, starLevel: $starLevel, maxLevel: $maxLevel, iconUrls: $iconUrls}';
  }
}

class IconUrlsModel extends IconUrls {
  const IconUrlsModel({
    @required String medium,
  }) : super(
          medium: medium,
        );

  factory IconUrlsModel.fromJson(Map<String, dynamic> json) {
    return new IconUrlsModel(
      medium: json['medium'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'medium': this.medium,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconUrlsModel &&
          runtimeType == other.runtimeType &&
          medium == other.medium;

  @override
  int get hashCode => medium.hashCode;

  @override
  String toString() {
    return 'IconUrlsModel{medium: $medium}';
  }
}
