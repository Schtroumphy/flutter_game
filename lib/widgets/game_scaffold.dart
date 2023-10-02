import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/widgets/game_header.dart';

import 'background_widget.dart';

class GameScaffold extends StatelessWidget {
  const GameScaffold({super.key, required this.gameTitle, required this.children});

  final String gameTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          backgroundPath: AssetConstants.backgroundGame_1,
          opacity: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const GameHeader(),
              ...children,
            ],
          ),
          //bottomNavigationBar:
        ),
      ),
    );
  }
}
