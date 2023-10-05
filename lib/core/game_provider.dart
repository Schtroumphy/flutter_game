import 'package:flutter_game/core/app_game.dart';
import 'package:flutter_game/core/router.dart';
import 'package:flutter_game/features/sort_trash/controllers/level_provider.dart';
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
    final game = AppGame(
      type: type,
      score: 0,
      errors: 0,
      duration: ref.read(levelProvider).duration,
    );
    state = game;
    return game;
  }

  addScore() {
    if (state == null) return;

    state = state!.copyWith(
      score: (state?.score ?? 0) + 1,
    );
  }

  addError() {
    if (state == null) return;

    state = state!.copyWith(
      errors: (state?.errors ?? 0) + 1,
    );
  }

  end() {
    state = null;
    ref.read(routerProvider).pop();
  }
}
