import 'package:flutter/material.dart' hide Card;

import '../../clash/domain/entities/card.dart';

class AppAssets {
  static AssetPaths paths = const AssetPaths();
  static AssetToPaths toPath = const AssetToPaths();
  static AssetToWidgets toWidget = const AssetToWidgets();

  AppAssets._();
}

class AssetPaths {
  String get experience => 'assets/images/ui/ui-experience.png';

  String get starLevel => 'assets/images/ui/ui-star-level.png';

  String get notFound => 'assets/images/ui/not-found.png';

  String get trophy => 'assets/images/ui/ui-trophy.png';

  String get crownRed => 'assets/images/crown/crown-red.png';

  String get crownBlue => 'assets/images/crown/crown-blue.png';

  const AssetPaths();
}

class AssetToPaths {
  String chestNameToPath(String name) {
    final images = {
      'Silver Chest': 'assets/images/chests/chest-silver.png',
      'Golden Chest': 'assets/images/chests/chest-golden.png',
      'Epic Chest': 'assets/images/chests/chest-epic.png',
      'Giant Chest': 'assets/images/chests/chest-giant.png',
      'Magical Chest': 'assets/images/chests/chest-magical.png',
      'Legendary Chest': 'assets/images/chests/chest-legendary.png',
      'Mega Lightning Chest': 'assets/images/chests/chest-megalightning.png',
      'Gold Crate': 'assets/images/chests/chest-goldcrate.png',
      'Overflowing Gold Crate':
          'assets/images/chests/chest-overflowinggoldcrate.png',
      'Plentiful Gold Crate':
          'assets/images/chests/chest-plentifulgoldcrate.png',
    };
    return images.keys.contains(name)
        ? images[name]
        : 'assets/images/ui/not-found.png';
  }

  String arenaIdToPath(int id) {
    return 'assets/images/arena/${id.toString()}.png';
  }

  String clanBadgeIdToPath(int id) {
    return 'assets/images/clan-badges/${id.toString()}.png';
  }

  const AssetToPaths();
}

class AssetToWidgets {
  Image cardToImage({Card card}) {
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

  Widget clanBadgeIdToImage(int id, {double size}) {
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

  const AssetToWidgets();
}

class Assets {
  Assets._();

  @Deprecated(
      'Use `AppAssets.toWidget.cardToImage` to get an image instead. This method cause an ERROR, on parsing missing Card')
  static String cardToPath(String name, {bool isGold}) {
    String path = isGold ? 'assets/images/cards-gold/' : 'assets/images/cards/';
    String fileName =
        name.replaceAll(' ', '-').replaceAll('.', '').toLowerCase() + '.png';

    return path + fileName;
  }
}
