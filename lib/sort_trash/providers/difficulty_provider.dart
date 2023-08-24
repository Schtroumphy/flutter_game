
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/difficulty.dart';

final difficultyProvider = NotifierProvider<DifficultyNotifier, Difficulty>(() => DifficultyNotifier());

class DifficultyNotifier extends Notifier<Difficulty> {

  @override
  Difficulty build() {
    return const Difficulty(number: 1, typeNumber: 2);
  }

  void changeDifficulty() {
    state = const Difficulty(number: 2, typeNumber: 3);
  }

}
