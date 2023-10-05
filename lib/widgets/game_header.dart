import 'package:flutter/material.dart';
import 'package:flutter_game/core/game_provider.dart';
import 'package:flutter_game/features/sort_trash/presentation/sort_trash_end_screen.dart';
import 'package:flutter_game/features/sort_trash/widgets/countdown_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GameHeader extends ConsumerWidget {
  const GameHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameNotifierProvider);

    if (game == null) {
      return const Center(
        child: Text("An error occurred"),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Score: ${game.score}"),
          Expanded(
            child: CountdownTimer(
              duration: game.duration,
              onFinished: () => _onTimerFinished(context, ref),
            ),
          ),
          Text("Erreurs: ${game.errors}"),
        ],
      ),
    );
  }

  _onTimerFinished(BuildContext context, WidgetRef ref) {
    context.go(SortTrashEndScreen.location);
  }
}
