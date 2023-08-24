import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_game/widgets/game_header.dart';

class GameScaffold extends StatelessWidget {
  const GameScaffold({super.key, required this.gameTitle, required this.children});

  final String gameTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConstants.sortTrashTitle,
          style: TextStyles.gameTitle,
        ),
        backgroundColor: CustomColors.orange,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const GameHeader(),
          ...children,
        ],
      ),
      //bottomNavigationBar:
    );
  }
}
