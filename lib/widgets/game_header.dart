import 'package:flutter/material.dart';
import 'package:flutter_game/core/game_provider.dart';
import 'package:flutter_game/sort_trash/providers/sort_trash_provider.dart';
import 'package:flutter_game/sort_trash/sort_trash_end_screen.dart';
import 'package:flutter_game/sort_trash/widgets/countdown_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GameHeader extends ConsumerWidget {
  const GameHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Score: ${game?.score ?? 0}"),
          Expanded(
            child: CountdownTimer(
              duration: const Duration(seconds: 10),
              onFinished: _onTimerFinished,
            ),
          ),
          Text("Erreurs: ${game?.errors ?? 0}"),
        ],
      ),
    );
  }

  _onTimerFinished(BuildContext context, WidgetRef ref) {
    ref.read(sortTrashGameNotifierProvider.notifier).end();
    context.go(SortTrashEndScreen.location);
  }
}
