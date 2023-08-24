
import 'dart:math';

import 'package:flutter_game/sort_trash/models/trash_item_type.dart';

enum AssetWasteItem {
  glassOfWine(TrashType.glass, "assets/items/glass_of_wine.svg"),
  glasses(TrashType.glass, "assets/items/glasses.svg"),
  cocktail(TrashType.glass, "assets/items/cocktail.svg"),

  can(TrashType.plastic, "assets/items/can.svg"),
  plasticCoffee(TrashType.plastic, "assets/items/plastic_coffee.svg"),
  bottle(TrashType.plastic, "assets/items/bottle.svg");

  const AssetWasteItem(this.type, this.path);

  final TrashType type;
  final String path;

  static AssetWasteItem randomItemByType(TrashType type) {
    Random random = Random();
    final items = AssetWasteItem.values.where((element) => element.type == type).toList();
    return items[random.nextInt(items.length)];
  }

}