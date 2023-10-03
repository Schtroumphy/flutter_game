import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/core/game_provider.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_game/core/theme.dart';
import 'package:flutter_game/widgets/background_widget.dart';
import 'package:flutter_game/widgets/game_title.dart';
import 'package:flutter_game/widgets/rounded_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortTrashEndScreen extends ConsumerWidget {
  const SortTrashEndScreen({Key? key}) : super(key: key);

  static String location = '/sort_trash_home/sort_trash_end_screen';
  static const String path = "sort_trash_end_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    final game = ref.read(gameNotifierProvider);

    return SafeArea(
      child: Scaffold(
        body: BackgroundWidget(
            backgroundPath: AssetConstants.background_1,
            child: Column(
              children: [
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: Insets.titleTopMargin),
                    child: GameTitle(StringConstants.gameFinished),
                  ),
                ),
                const Spacer(),
                Text(
                  "Score : ${game?.score ?? 0}",
                  style: appTheme.mediumTitle,
                ),
                Text(
                  "Erreur(s) : ${game?.errors ?? 0}",
                  style: appTheme.mediumTitle,
                ),
                const Spacer(),
                Flexible(
                  child: RoundedButton(
                    iconData: Icons.arrow_back,
                    onTap: () => _onGoBackButtonPressed(context, ref),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void _onGoBackButtonPressed(BuildContext context, WidgetRef ref) {
    ref.read(gameNotifierProvider.notifier).end();
  }
}
