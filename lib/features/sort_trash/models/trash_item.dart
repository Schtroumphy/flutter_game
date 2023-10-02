import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game/features/sort_trash/models/waste_type.dart';

class TrashItem {
  final WasteType type;
  late final Color color;
  final bool isError;

  TrashItem(this.type, {this.isError = false}){
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  TrashItem copyWith({String? name, WasteType? type, bool? isError}) {
    return TrashItem(
      type ?? this.type,
      isError: isError ?? this.isError,
    );
  }

}

