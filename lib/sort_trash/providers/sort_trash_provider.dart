import 'dart:math';

import 'package:flutter_game/core/app_game.dart';
import 'package:flutter_game/core/game_provider.dart';
import 'package:flutter_game/sort_trash/models/trash_item.dart';
import 'package:flutter_game/sort_trash/models/trash_item_type.dart';
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

  final typeTrashInGame = 3;

  @override
  SortTrashGame build() {
    return SortTrashGame(
      items: List.generate(3, (index) => _createRandomTrashItem(typeTrashInGame)),
      isButtonsEnabled: true,
    );
  }

  start() => ref.read(gameNotifierProvider.notifier).start(GameType.sortTheTrash);

  end() => ref.read(gameNotifierProvider.notifier).end();

  disableTrashButtons() async {
    state = state.copyWith(isEnabled: false);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isEnabled: true);
  }

  bool throwItem(List<TrashType> buttonTypes) {
    if (buttonTypes.contains(state.items.last.type)) {
      removeLastItem();
      ref.read(gameNotifierProvider.notifier).addScore();
      return true;
    }
    ref.read(gameNotifierProvider.notifier).addError();
    return false;
  }

  void removeLastItem() {
    final items = [...state.items];
    items.removeLast();
    items.insert(0, _createRandomTrashItem(typeTrashInGame));
    state = state.copyWith(items: items);
  }

  TrashItem _createRandomTrashItem(int typeNumber) {
    if (typeNumber > TrashType.values.length) {
      throw Exception("Bad trash type number for creating random trash items.");
    }

    final types = TrashType.values //
        .take(typeNumber) //
        .toList();
    final randomType = types[random.nextInt(types.length)];

    return TrashItem(randomType);
  }
}
