class Assets {
  static String chestNameToPath(String name) {
    final images = {
      'Silver Chest': 'assets/images/chest-silver.png',
      'Golden Chest': 'assets/images/chest-golden.png',
      'Epic Chest': 'assets/images/chest-epic.png',
      'Giant Chest': 'assets/images/chest-giant.png',
      'Magical Chest': 'assets/images/chest-magical.png',
      'Legendary Chest': 'assets/images/chest-legendary.png',
      'Mega Lightning Chest': 'assets/images/chest-megalightning.png',
    };
    return images.keys.contains(name)
        ? images[name]
        : 'assets/images/not-found.png';
  }

  static String get experience => 'assets/images/ui-experience.png';
}
