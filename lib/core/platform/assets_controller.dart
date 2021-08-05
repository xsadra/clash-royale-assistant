import 'package:flutter/material.dart' hide Card;

import '../../clash/domain/entities/card.dart';

class AppAssets {
  static _AssetPaths paths = const _AssetPaths();
  static _AssetToPaths toPath = const _AssetToPaths();
  static _AssetToWidgets toWidget = const _AssetToWidgets();
  static _AssetFonts fonts = const _AssetFonts();
  static _AssetIcons icons = const _AssetIcons();
  static _AssetImageIcons imageIcons = const _AssetImageIcons();

  AppAssets._();
}

class _AssetPaths {
  String get experience => 'assets/images/ui/ui-experience.png';

  String get starLevel => 'assets/images/ui/ui-star-level.png';

  String get notFound => 'assets/images/ui/not-found.png';

  String get trophy => 'assets/images/ui/ui-trophy.png';

  String get shareDeck => 'assets/images/ui/ui-share-deck.png';

  String get tournament => 'assets/images/ui/ui-tournament.png';

  String get battle => 'assets/images/ui/ui-battle.png';

  String get clanWars => 'assets/images/ui/ui-clan-wars.png';

  String get deck => 'assets/images/ui/ui-deck.png';

  String get donate => 'assets/images/ui/ui-donate.png';

  String get league => 'assets/images/ui/ui-league.png';

  String get rank => 'assets/images/ui/ui-rank.png';

  String get bestSeason => 'assets/images/ui/ui-best-season.png';

  String get currentSeason => 'assets/images/ui/ui-current-season.png';

  String get currentSeasonV2 => 'assets/images/ui/ui-current-season2.png';

  String get prevSeason => 'assets/images/ui/ui-prev-season.png';

  String get crownRed => 'assets/images/crown/crown-red.png';

  String get crownBlue => 'assets/images/crown/crown-blue.png';

  const _AssetPaths();
}

class _AssetImageIcons {
  Image experience({double size = 24}) => Image.asset(
        _AssetPaths().experience,
        height: size,
        width: size,
      );

  Image starLevel({double size = 24}) => Image.asset(
        _AssetPaths().starLevel,
        height: size,
        width: size,
      );

  Image notFound({double size = 24}) => Image.asset(
        _AssetPaths().notFound,
        height: size,
        width: size,
      );

  Image trophy({double size = 24}) => Image.asset(
        _AssetPaths().trophy,
        height: size,
        width: size,
      );

  Image shareDeck({double size = 24}) => Image.asset(
        _AssetPaths().shareDeck,
        height: size,
        width: size,
      );

  Image tournament({double size = 24}) => Image.asset(
        _AssetPaths().tournament,
        height: size,
        width: size,
      );

  Image battle({double size = 24}) => Image.asset(
        _AssetPaths().battle,
        height: size,
        width: size,
      );

  Image clanWars({double size = 24}) => Image.asset(
        _AssetPaths().clanWars,
        height: size,
        width: size,
      );

  Image deck({double size = 24}) => Image.asset(
        _AssetPaths().deck,
        height: size,
        width: size,
      );

  Image donate({double size = 24}) => Image.asset(
        _AssetPaths().donate,
        height: size,
        width: size,
      );

  Image league({double size = 24}) => Image.asset(
        _AssetPaths().league,
        height: size,
        width: size,
      );

  Image rank({double size = 24}) => Image.asset(
        _AssetPaths().rank,
        height: size,
        width: size,
      );

  Image bestSeason({double size = 24}) => Image.asset(
        _AssetPaths().bestSeason,
        height: size,
        width: size,
      );

  Image currentSeason({double size = 24}) => Image.asset(
        _AssetPaths().currentSeason,
        height: size,
        width: size,
      );

  Image currentSeasonV2({double size = 24}) => Image.asset(
        _AssetPaths().currentSeasonV2,
        height: size,
        width: size,
      );

  Image prevSeason({double size = 24}) => Image.asset(
        _AssetPaths().prevSeason,
        height: size,
        width: size,
      );

  Image crownRed({double size = 24}) => Image.asset(
        _AssetPaths().crownRed,
        height: size,
        width: size,
      );

  Image crownBlue({double size = 24}) => Image.asset(
        _AssetPaths().crownBlue,
        height: size,
        width: size,
      );

  const _AssetImageIcons();
}

class _AssetToPaths {
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

  const _AssetToPaths();
}

class _AssetToWidgets {
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

  const _AssetToWidgets();
}

class _AssetFonts {
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

  const _AssetFonts();
}

class _AssetIcons {
  String get appIcon => 'assets/icons/app_icon.png';

  String get appIconRound => 'assets/icons/app_icon.png';

  const _AssetIcons();
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
