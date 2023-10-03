
import 'dart:math';

import 'package:flutter_game/features/sort_trash/models/waste_type.dart';

enum WasteItemAsset {
  glassOfWine(WasteType.glass, "assets/items/glass_of_wine.svg"),
  glasses(WasteType.glass, "assets/items/glasses.svg"),
  cocktail(WasteType.glass, "assets/items/cocktail.svg"),

  can(WasteType.plastic, "assets/items/can.svg"),
  plasticCoffee(WasteType.plastic, "assets/items/plastic_coffee.svg"),
  bottle(WasteType.plastic, "assets/items/bottle.svg"),

  contract(WasteType.paper, "assets/items/contract.svg"),
  printer(WasteType.paper, "assets/items/printer.svg"),

  metal1(WasteType.metal, "assets/items/bottle.svg"),
  metal2(WasteType.metal, "assets/items/bottle.svg");

  const WasteItemAsset(this.type, this.path);

  final WasteType type;
  final String path;

  static WasteItemAsset randomItemByType(WasteType type) {
    Random random = Random();
    final items = WasteItemAsset.values.where((element) => element.type == type).toList();
    return items[random.nextInt(items.length)];
  }

}