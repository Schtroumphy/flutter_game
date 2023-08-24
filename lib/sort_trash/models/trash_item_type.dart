
import 'package:flutter/material.dart';

enum TrashType {
  plastic(Colors.green),
  glass(Colors.blue),
  metal(Colors.red);

  const TrashType(this.color);

  final MaterialColor color;
}