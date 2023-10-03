
import 'package:flutter/material.dart';
import 'package:flutter_game/core/styles.dart';

enum WasteType {
  plastic(Colors.yellow),
  glass(Colors.green),
  metal(CustomColors.gray),
  paper(Colors.blue);

  const WasteType(this.color);

  final Color color;
}