import 'package:flutter/cupertino.dart';

import '../core/styles.dart';

class GameTitle extends StatelessWidget {
  const GameTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.gameHomeTitle,
    );
  }
}
