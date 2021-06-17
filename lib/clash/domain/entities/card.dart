import 'package:meta/meta.dart' show required;

class Card {
  final String name;
  final int id;
  final int level;
  final int starLevel;
  final int maxLevel;
  final IconUrls iconUrls;

  const Card({
    @required this.name,
    @required this.id,
    @required this.level,
    @required this.starLevel,
    @required this.maxLevel,
    @required this.iconUrls,
  });
}

class IconUrls {
  final String medium;

  const IconUrls({
    @required this.medium,
  });
}
