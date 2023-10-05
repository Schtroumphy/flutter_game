import 'package:flutter_game/features/sort_trash/models/waste_type.dart';

enum Level {
  easy(
    duration: Duration(seconds: 20),
    wasteTypes: [WasteType.plastic, WasteType.glass],
  ),
  normal(
    duration: Duration(seconds: 20),
    wasteTypes: [WasteType.plastic, WasteType.glass, WasteType.metal],
  ),
  hard(
    duration: Duration(seconds: 35),
    wasteTypes: WasteType.values,
  ),
  expert(
    duration: Duration(seconds: 40),
    wasteTypes: WasteType.values,
    asJoker: true,
  );

  final Duration duration;
  final List<WasteType> wasteTypes;
  final bool asJoker;

  const Level({
    required this.duration,
    required this.wasteTypes,
    this.asJoker = false,
  });
}

class SortTrashLevel {
  final Level level;
  final bool isUnlocked;
  final bool isCurrent;

  const SortTrashLevel({required this.level, required this.isUnlocked, required this.isCurrent});

  SortTrashLevel copyWith({
    Level? level,
    bool? isUnlocked,
    bool? isCurrent,
  }) {
    return SortTrashLevel(
      level: level ?? this.level,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }
}
