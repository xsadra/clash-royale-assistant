import 'package:flutter/material.dart' hide Card;

import '../../clash/domain/entities/card.dart';

class Assets {
  Assets._();

  static String get experience => 'assets/images/ui/ui-experience.png';

  static String get starLevel => 'assets/images/ui/ui-star-level.png';

  static String get notFound => 'assets/images/ui/not-found.png';

  static String get crownRed => 'assets/images/crown/crown-red.png';

  static String get crownBlue => 'assets/images/crown/crown-blue.png';

  static String chestNameToPath(String name) {
    final images = {
      'Silver Chest': 'assets/images/chests/chest-silver.png',
      'Golden Chest': 'assets/images/chests/chest-golden.png',
      'Epic Chest': 'assets/images/chests/chest-epic.png',
      'Giant Chest': 'assets/images/chests/chest-giant.png',
      'Magical Chest': 'assets/images/chests/chest-magical.png',
      'Legendary Chest': 'assets/images/chests/chest-legendary.png',
      'Mega Lightning Chest': 'assets/images/chests/chest-megalightning.png',
      'Gold Crate': 'assets/images/chests/chest-goldcrate.png',
    };
    return images.keys.contains(name)
        ? images[name]
        : 'assets/images/ui/not-found.png';
  }

  static String arenaIdToPath(int id) {
    return 'assets/images/arena/${id.toString()}.png';
  }

  @Deprecated(
      'Use `cardToImage` instead. This method cause an ERROR, on parsing missing Card')
  static String cardToPath(String name, {bool isGold}) {
    String path = isGold ? 'assets/images/cards-gold/' : 'assets/images/cards/';
    String fileName =
        name.replaceAll(' ', '-').replaceAll('.', '').toLowerCase() + '.png';

    return path + fileName;
  }

  static Image cardToImage(Card card) {
    String path = card.starLevel != null
        ? 'assets/images/cards-gold/'
        : 'assets/images/cards/';
    String fileName =
        card.name.replaceAll(' ', '-').replaceAll('.', '').toLowerCase() +
            '.png';

    return Image.asset(
      path + fileName,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(card.iconUrls.medium);
      },
    );
  }

  static String clanBadgeIdToPath(int id) {
    return 'assets/images/clan-badges/${id.toString()}.png';
  }

  static Widget clanBadgeIdToImage(int id, {double size}) {
    String path = 'assets/images/clan-badges/${id.toString()}.png';
    if (size == null) {
      return Image.asset(path);
    }
    assert(size > 0);
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(path),
    );
  }
}
