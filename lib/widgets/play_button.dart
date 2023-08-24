import 'package:flutter/material.dart';
import 'package:flutter_game/core/styles.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, this.onTap, this.backgroundButtonColor});

  final Function()? onTap;
  final Color? backgroundButtonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Insets.l),
        decoration: BoxDecoration(
            color: backgroundButtonColor ?? CustomColors.orange.withOpacity(0.7),
            shape: BoxShape.circle),
        child: const Icon(
          Icons.play_arrow,
          color: CustomColors.white,
          size: IconSize.xxlarge,
        ),
      ),
    );
  }
}
