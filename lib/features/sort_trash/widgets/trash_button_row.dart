import 'package:flutter/material.dart';
import 'package:flutter_game/features/sort_trash/controllers/level_provider.dart';
import 'package:flutter_game/features/sort_trash/models/waste_type.dart';
import 'package:flutter_game/features/sort_trash/widgets/trash_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrashButtonRow extends ConsumerWidget {
  const TrashButtonRow({this.onError, super.key});

  final Function? onError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wasteType = ref.read(levelProvider.notifier).getWasteTypeSliced();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        trashButton(
          wasteType[0],
          false,
          onError: onError,
        ),
        const Spacer(),
        trashButton(
          wasteType[1],
          true,
          onError: onError,
        ),
      ],
    );
  }

  TrashButton trashButton(List<WasteType> types, bool isInversed, {Function? onError}) {
    return TrashButton(
      buttonTypes: types,
      isInversed: isInversed,
      onSuccess: null,
      onErrorOccurred: onError,
    );
  }
}
