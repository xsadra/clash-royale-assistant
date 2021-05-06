String chestNameToPath(String name) {
  final images = {
    'Silver Chest': 'images/chest-silver.png',
    'Golden Chest': 'images/chest-golden.png',
    'Epic Chest': 'images/chest-epic.png',
    'Giant Chest': 'images/chest-giant.png',
    'Magical Chest': 'images/chest-magical.png',
    'Legendary Chest': 'images/chest-legendary.png',
    'Mega Lightning Chest': 'images/chest-megalightning.png',
  };
  return images.keys.contains(name) ? images[name] : 'images/not-found.png';
}
