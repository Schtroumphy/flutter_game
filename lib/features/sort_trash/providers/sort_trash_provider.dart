import 'dart:math';

import 'package:flutter_game/core/app_game.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/core/game_provider.dart';
import 'package:flutter_game/features/sort_trash/models/trash_item.dart';
import 'package:flutter_game/features/sort_trash/models/waste_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortTrashGameNotifierProvider = NotifierProvider<TrashItemNotifier, SortTrashGame>(() => TrashItemNotifier());

class SortTrashGame {
  final List<TrashItem> items;
  final bool isButtonsEnabled;

  SortTrashGame({required this.items, required this.isButtonsEnabled});

  SortTrashGame copyWith({List<TrashItem>? items, bool? isEnabled}) {
    return SortTrashGame(
      items: items ?? this.items,
      isButtonsEnabled: isEnabled ?? isButtonsEnabled,
    );
  }
}

class TrashItemNotifier extends Notifier<SortTrashGame> {
  Random random = Random();

  final typeTrashInGame = GameConstants.typeNumbers;

  @override
  SortTrashGame build() {
    return SortTrashGame(
      items: List.generate(3, (index) => _createRandomTrashItem(typeTrashInGame)),
      isButtonsEnabled: true,
    );
  }

  start() => ref.read(gameNotifierProvider.notifier).start(GameType.sortTheTrash);

  handleError() async {
    state = state.copyWith(isEnabled: false);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isEnabled: true);
    _removeLastItem();
  }

  bool throwItem(List<WasteType> buttonTypes) {
    if (buttonTypes.contains(state.items.last.type)) {
      _removeLastItem();
      ref.read(gameNotifierProvider.notifier).addScore();
      return true;
    }
    ref.read(gameNotifierProvider.notifier).addError();
    return false;
  }

  void _removeLastItem() {
    final items = [...state.items];
    items.removeLast();
    items.insert(0, _createRandomTrashItem(typeTrashInGame));
    state = state.copyWith(items: items);
  }

  TrashItem _createRandomTrashItem(int typeNumber) {
    if (typeNumber > WasteType.values.length) {
      throw Exception("Bad trash type number for creating random trash items.");
    }

    final types = WasteType.values //
        .take(typeNumber) //
        .toList();
    final randomType = types[random.nextInt(types.length)];

    return TrashItem(randomType);
  }
}
