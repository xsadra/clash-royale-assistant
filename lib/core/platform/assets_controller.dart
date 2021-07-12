import 'package:flutter/material.dart' hide Card;

import '../../clash/domain/entities/card.dart';

class AppAssets {
  static AssetPaths paths = const AssetPaths();
  static AssetToPaths toPath = const AssetToPaths();
  static AssetToWidgets toWidget = const AssetToWidgets();
  static AssetFonts fonts = const AssetFonts();
  static AssetIcons icons = const AssetIcons();

  AppAssets._();
}

class AssetPaths {
  String get experience => 'assets/images/ui/ui-experience.png';

  String get starLevel => 'assets/images/ui/ui-star-level.png';

  String get notFound => 'assets/images/ui/not-found.png';

  String get trophy => 'assets/images/ui/ui-trophy.png';

  String get shareDeck => 'assets/images/ui/ui-share-deck.png';

  String get tournament => 'assets/images/ui/ui-tournament.png';

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

class AssetFonts {
  String get alfaSlabOne => 'AlfaSlabOne';
  String get monoton => 'Monoton';
  String get pacifico => 'Pacifico';
  String get openSansCondensed => 'OpenSansCondensed';
  String get rajdhani => 'Rajdhani';
  String get roboto => 'Roboto';
  String get staatliches => 'Staatliches';
  String get teko => 'Teko';
  String get yanoneKaffeesatz => 'YanoneKaffeesatz';
  String get zillaSlab => 'ZillaSlab';

  const AssetFonts();
}

class AssetIcons {
  String get appIcon => 'assets/icons/ic_launcher.png';
  String get appIconRound => 'assets/icons/ic_launcher_round.png';

  const AssetIcons();
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
