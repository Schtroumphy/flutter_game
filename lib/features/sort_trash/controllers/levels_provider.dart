import 'package:flutter_game/features/sort_trash/controllers/level_provider.dart';
import 'package:flutter_game/features/sort_trash/models/level.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final levelsProvider = NotifierProvider<LevelsNotifier, List<LevelModel>>(() => LevelsNotifier());

class LevelsNotifier extends Notifier<List<LevelModel>> {
  @override
  List<LevelModel> build() {
    // TODO It will be save at the start of the app in local database and retrieve there. For now, it's a const variable
    return levels;
  }

  setCurrentLevel(LevelModel levelModel) {
    final levels = <LevelModel>[];
    for (var level in state) {
      final isCurrent = (level.level.name == levelModel.level.name);
      levels.add(
        level.copyWith(isCurrent: isCurrent),
      );
    }
    state = [...levels];
    ref.read(currentLevelProvider.notifier).setLevel(levelModel.level);
  }
}

const levels = [
  LevelModel(
    level: Level.easy,
    isLocked: false,
    isCurrent: true,
  ),
  LevelModel(
    level: Level.normal,
    isLocked: false,
  ),
  LevelModel(
    level: Level.hard,
  ),
  LevelModel(
    level: Level.expert,
  ),
];

class LevelModel {
  final Level level;
  final bool isLocked;
  final bool isCurrent;

  const LevelModel({
    required this.level,
    this.isLocked = false,
    this.isCurrent = false,
  });

  LevelModel copyWith({Level? level, bool? isLocked, bool? isCurrent}) {
    return LevelModel(
      level: level ?? this.level,
      isLocked: isLocked ?? this.isLocked,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }

  @override
  String toString() {
    return "{ Level name: ${level.name}, isLocked: $isLocked, isCurrent: $isCurrent }\n";
  }
}
