import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game/sort_trash/models/trash_item_type.dart';

class TrashItem {
  final TrashType type;
  late final Color color;
  final bool isError;

  TrashItem(this.type, {this.isError = false}){
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  TrashItem copyWith({String? name, TrashType? type, bool? isError}) {
    return TrashItem(
      type ?? this.type,
      isError: isError ?? this.isError,
    );
  }

}

