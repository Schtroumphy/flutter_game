import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_game/features/sort_trash/controllers/sort_trash_provider.dart';
import 'package:flutter_game/features/sort_trash/models/waste_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class TrashButton extends ConsumerWidget {
  const TrashButton({
    Key? key,
    required this.buttonTypes,
    this.isInversed = false,
    this.onErrorOccurred,
    this.onSuccess,
  }) : super(key: key);

  final List<WasteType> buttonTypes;
  final bool isInversed;
  final Function? onErrorOccurred;
  final Function? onSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonsEnabled = ref.watch(sortTrashGameNotifierProvider).isButtonsEnabled;
    return buttonTypes.length == 1
        ? InkWell(
            onTap: () {
              buttonsEnabled ? _onTrashTapped(ref, buttonTypes) : null;
            },
            child: SizedBox(
              width: 150,
              height: 150,
              child: Center(
                child: TrashIcon(
                  trashColor: buttonsEnabled ? buttonTypes[0].color : CustomColors.redError,
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              buttonsEnabled ? _onTrashTapped(ref, buttonTypes) : null;
            },
            child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                alignment: isInversed ? Alignment.topRight : Alignment.topLeft,
                children: [
                  Positioned(
                    right: null,
                    child: TrashIcon(
                      trashColor: buttonsEnabled ? buttonTypes[0].color : CustomColors.redError,
                    ),
                  ),
                  const Spacer(),
                  Positioned(
                    top: 25,
                    left: isInversed ? null : 25,
                    right: isInversed ? 25 : null,
                    child: TrashIcon(
                      trashColor: buttonsEnabled ? buttonTypes[1].color : CustomColors.redError,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  _onTrashTapped(WidgetRef ref, List<WasteType> buttonTypes) {
    if (ref.read(sortTrashGameNotifierProvider).isButtonsEnabled) {
      bool result = ref.read(sortTrashGameNotifierProvider.notifier).throwItem(buttonTypes);
      if (!result) {
        onErrorOccurred?.call();
        return;
      }
      onSuccess?.call();
    }
  }
}

class TrashIcon extends StatelessWidget {
  const TrashIcon({super.key, required this.trashColor});

  final Color trashColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: SvgPicture.asset(
        AssetConstants.trash2Icon,
        colorFilter: ColorFilter.mode(trashColor, BlendMode.srcIn),
        width: 100,
        height: 100,
      ),
    );
  }
}
