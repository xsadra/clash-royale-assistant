class Assets {
  Assets._();
  static String get experience => 'assets/images/ui/ui-experience.png';
  static String get starLevel => 'assets/images/ui/ui-star-level.png';
  static String get notFound => 'assets/images/ui/not-found.png';

  static String chestNameToPath(String name) {
    final images = {
      'Silver Chest': 'assets/images/chests/chest-silver.png',
      'Golden Chest': 'assets/images/chests/chest-golden.png',
      'Epic Chest': 'assets/images/chests/chest-epic.png',
      'Giant Chest': 'assets/images/chests/chest-giant.png',
      'Magical Chest': 'assets/images/chests/chest-magical.png',
      'Legendary Chest': 'assets/images/chests/chest-legendary.png',
      'Mega Lightning Chest': 'assets/images/chests/chest-megalightning.png',
    };
    return images.keys.contains(name)
        ? images[name]
        : 'assets/images/ui/not-found.png';
  }

  static String arenaIdToPath(int id) {
    return 'assets/images/arena/${id.toString()}.png';
  }

  static String cardToPath(String name, {bool isGold}) {
    String path = isGold ? 'assets/images/cards-gold/' : 'assets/images/cards/';
    String fileName =
        name.replaceAll(' ', '-').replaceAll('.', '').toLowerCase() + '.png';

    return path + fileName;
  }

  static String clanBadgeIdToPath(int id) {
    return 'assets/images/clan-badges/${id.toString()}.png';
  }
}
