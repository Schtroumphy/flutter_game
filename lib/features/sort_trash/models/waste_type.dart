
import 'package:flutter/material.dart';

enum WasteType {
  plastic(Colors.green),
  glass(Colors.blue),
  metal(Colors.red);

  const WasteType(this.color);

  final MaterialColor color;
}