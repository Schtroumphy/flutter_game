import 'package:flutter/material.dart';
import 'package:flutter_game/core/styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, this.iconData, this.onTap, this.backgroundButtonColor});

  final IconData? iconData;
  final Function()? onTap;
  final Color? backgroundButtonColor;

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          backgroundColor: backgroundButtonColor ?? CustomColors.orange,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0)
          ),
          elevation: 10
      ),
      child: Icon(
        iconData ?? Icons.play_arrow,
        color: CustomColors.white,
        size: IconSize.xxlarge,
      ),
    );
  }
}
