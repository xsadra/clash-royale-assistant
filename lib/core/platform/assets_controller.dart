class Assets {
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

  static String get experience => 'assets/images/ui/ui-experience.png';
  static String get starLevel => 'assets/images/ui/ui-star-level.png';
}
