import 'package:flutter/material.dart';
import 'package:flutter_game/core/styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, this.iconData, this.onTap, this.backgroundButtonColor});

  final IconData? iconData;
  final Function()? onTap;
  final Color? backgroundButtonColor;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(50));

    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: Container(
          padding: const EdgeInsets.all(Insets.l),
          decoration: BoxDecoration(
            color: backgroundButtonColor ?? CustomColors.orange.withOpacity(0.7),
            borderRadius: borderRadius,
          ),
          child: Icon(
            iconData ?? Icons.play_arrow,
            color: CustomColors.white,
            size: IconSize.xxlarge,
          ),
        ),
      ),
    );
  }
}
