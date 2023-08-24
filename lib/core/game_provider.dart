import 'package:flutter_game/core/app_game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameNotifierProvider = NotifierProvider<GameNotifier, AppGame?>(() {
  return GameNotifier();
});

class GameNotifier extends Notifier<AppGame?> {
  @override
  build() {
    return null;
  }

  AppGame start(GameType type) {
    final game = AppGame(type: type, score: 0, errors: 0);
    state = game;
    return game;
  }

  addScore() {
    if (state == null) return;

    final current = (state?.score ?? 0) + 1;
    state = state!.copyWith(
      score: current,
    );
  }

  addError() {
    if (state == null) return;

    final current = (state?.errors ?? 0) + 1;
    state = state!.copyWith(
      errors: current,
    );
  }

  end() {
    state = null;
  }
}
