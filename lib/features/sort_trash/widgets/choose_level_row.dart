import 'package:flutter/material.dart';
import 'package:flutter_game/core/extensions/string_extension.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_game/features/sort_trash/controllers/levels_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseLevelRow extends ConsumerWidget {
  const ChooseLevelRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levels = ref.watch(levelsProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final levelModel in levels)
        LevelButton(
          levelName: levelModel.level.name,
          isLocked: levelModel.isLocked,
          isCurrent: levelModel.isCurrent,
          onLevelClicked: () => levelModel.isLocked ? null : _onLevelClicked(ref, levelModel),
        ),
      ],
    );
  }

  _onLevelClicked(WidgetRef ref, LevelModel levelModel){
    ref.read(levelsProvider.notifier).setCurrentLevel(levelModel);
  }
}

class LevelButton extends StatelessWidget {
  const LevelButton({required this.levelName, this.isCurrent = false, this.isLocked = false, required this.onLevelClicked, super.key});

  final String levelName;
  final bool isLocked;
  final bool isCurrent;
  final Function() onLevelClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/4.5,
      height: 80,
      child: InkWell(
        onTap: () => onLevelClicked(),
        child: Card(
          color: isCurrent ? CustomColors.yellow : isLocked ? CustomColors.gray : CustomColors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(levelName.capitalize()),
            ),
          ),
        ),
      ),
    );
  }
}
