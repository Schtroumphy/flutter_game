import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({this.child, this.backgroundPath, this.opacity, super.key});

  final String? backgroundPath;
  final double? opacity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            backgroundPath ?? AssetConstants.background_1,
          ),
          fit: BoxFit.cover,
          opacity: opacity ?? 1,
        ),
      ),
      child: child,
    );
  }
}
