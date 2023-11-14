import '../../domain/entities/current_player_tag.dart';

class CurrentPlayerTagModel extends CurrentPlayerTag {
  const CurrentPlayerTagModel({
    required String playerTag,
    String? playerClanTag,
  }) : super(
          playerTag: playerTag,
          playerClanTag: playerClanTag,
        );

  factory CurrentPlayerTagModel.fromJson(Map<String, dynamic> json) {
    return new CurrentPlayerTagModel(
      playerTag: json['playerTag'] as String,
      playerClanTag: json['playerClanTag'] as String,
    );
  }

  factory CurrentPlayerTagModel.fromObject(CurrentPlayerTag playerTag) {
    return new CurrentPlayerTagModel(
      playerTag: playerTag.playerTag,
      playerClanTag: playerTag.playerClanTag,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'playerTag': this.playerTag,
      'playerClanTag': this.playerClanTag,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentPlayerTagModel &&
          runtimeType == other.runtimeType &&
          playerTag == other.playerTag;

  @override
  int get hashCode => playerTag.hashCode;

  @override
  String toString() {
    return 'CurrentPlayerTagModel{playerTag: $playerTag, playerClanTag: $playerClanTag}';
  }
}
