import 'dart:math';

import 'package:flutter_game/core/app_game.dart';
import 'package:flutter_game/core/game_provider.dart';
import 'package:flutter_game/sort_trash/models/trash_item.dart';
import 'package:flutter_game/sort_trash/models/trash_item_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortTrashGameNotifierProvider = NotifierProvider<TrashItemNotifier, List<TrashItem>>(() => TrashItemNotifier());

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

class TrashItemNotifier extends Notifier<List<TrashItem>> {
  Random random = Random();

  @override
  List<TrashItem> build() {
    return List.generate(3, (index) => _createRandomTrashItem(3));
  }

  start() => ref.read(gameNotifierProvider.notifier).start(GameType.sortTheTrash);

  end() => ref.read(gameNotifierProvider.notifier).end();

  enableTrashButtons(bool isEnable) {

  }

  bool throwItem(List<TrashType> buttonTypes) {
    if (buttonTypes.contains(state.last.type)) {
      removeLastItem();
      ref.read(gameNotifierProvider.notifier).addScore();
      return true;
    }
    ref.read(gameNotifierProvider.notifier).addError();
    return false;
  }

  void removeLastItem() {
    final newState = [...state];
    newState.removeLast();
    newState.insert(0, _createRandomTrashItem(2));
    state = newState;
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
