
import 'dart:math';

import 'package:flutter_game/sort_trash/models/trash_item_type.dart';

enum WasteItemAsset {
  glassOfWine(TrashType.glass, "assets/items/glass_of_wine.svg"),
  glasses(TrashType.glass, "assets/items/glasses.svg"),
  cocktail(TrashType.glass, "assets/items/cocktail.svg"),

  can(TrashType.plastic, "assets/items/can.svg"),
  plasticCoffee(TrashType.plastic, "assets/items/plastic_coffee.svg"),
  bottle(TrashType.plastic, "assets/items/bottle.svg"),

  metal1(TrashType.metal, "assets/items/bottle.svg"),
  metal2(TrashType.metal, "assets/items/bottle.svg");

  const WasteItemAsset(this.type, this.path);

  final TrashType type;
  final String path;

  static WasteItemAsset randomItemByType(TrashType type) {
    Random random = Random();
    final items = WasteItemAsset.values.where((element) => element.type == type).toList();
    return items[random.nextInt(items.length)];
  }

}