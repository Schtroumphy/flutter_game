import 'package:flutter_game/features/sort_trash/models/waste_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import '../models/level.dart';

final currentLevelProvider = NotifierProvider<LevelNotifier, Level>(() => LevelNotifier());

class LevelNotifier extends Notifier<Level> {

  final levels = Level.values;

  @override
  Level build() {
    return Level.easy;
  }

  List<Level> get() => levels;

  setLevel(Level newLevel) {
    state = newLevel;
  }

  List<List<WasteType>> getWasteTypeSliced() {
    if(state.wasteTypes.length <= 2) {
      return state.wasteTypes.slices(1).toList();
    }

    final result = state.wasteTypes.slices(2).toList();

    if(result.length > 2) {
      // Only take first two
      return result.sublist(0,2);
    }

    return result;
  }

}
