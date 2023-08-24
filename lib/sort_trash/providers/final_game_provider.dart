
import 'package:flutter_riverpod/flutter_riverpod.dart';

final endedGameProvider = NotifierProvider<GameEndedNotifier, GameType?>(() => GameEndedNotifier());

class GameEndedNotifier extends Notifier<GameType?> {

  @override
  GameType? build() {
    return null;
  }

  void changeEndedGame(GameType type) {
    state = type;
  }
}

enum GameType {
  none,
  sortTrash,
  ticTacToe
}