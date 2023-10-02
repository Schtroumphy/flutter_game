import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_game/sort_trash/providers/sort_trash_provider.dart';
import 'package:flutter_game/sort_trash/sort_trash_game_screen.dart';
import 'package:flutter_game/widgets/game_title.dart';
import 'package:flutter_game/widgets/play_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SortTrashHome extends ConsumerWidget {
  const SortTrashHome({Key? key}) : super(key: key);

  static const String location = "/sort_trash_home";

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SafeArea(
      child: Scaffold(
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetConstants.background_1),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: Insets.titleTopMargin),
                    child: GameTitle(StringConstants.sortTrashTitleWithSpace),
                  ),
                ),
                Flexible(
                  child: PlayButton(
                    onTap: () => _onPlayPressed(context, ref),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  _onPlayPressed(BuildContext context, WidgetRef ref) {
    ref.read(sortTrashGameNotifierProvider.notifier).start();
    context.push(SortTrashGameScreen.location);
  }
}
