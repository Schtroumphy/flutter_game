import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_game/sort_trash/models/trash_item_type.dart';
import 'package:flutter_game/sort_trash/providers/sort_trash_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class TrashButton extends ConsumerWidget {
  const TrashButton({
    Key? key,
    required this.heroTag,
    required this.buttonTypes,
    required this.enabled,
    this.isInversed = false,
    this.onErrorOccurred,
    this.onSuccess,
  }) : super(key: key);

  final String heroTag;
  final List<TrashType> buttonTypes;
  final bool enabled;
  final bool isInversed;
  final Function? onErrorOccurred;
  final Function? onSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 200,
      height: 150,
      child: GestureDetector(
        onTap: () {
          _onTrashTapped(ref, buttonTypes);
        },
        child: Container(
          padding: const EdgeInsets.only(top: Insets.m),
          child: Stack(
            alignment: isInversed ? Alignment.topRight : Alignment.topLeft,
            children: [
              Positioned(
                right: null,
                child: TrashIcon(
                  trashColor: buttonTypes[0].color,
                ),
              ),
              Positioned(
                top: 25,
                left: isInversed ? null : 25,
                right: isInversed ? 25 : null,
                child: TrashIcon(
                  trashColor: buttonTypes[1].color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTrashTapped(WidgetRef ref, List<TrashType> buttonTypes) {
    if (enabled) {
      bool result = ref.read(sortTrashGameNotifierProvider.notifier).throwItem(buttonTypes);
      if (!result) {
        // Disable trash buttons
        onErrorOccurred?.call();

        // Display a red cross on item

        // Remove from list without count the score
        return;
      } else {
        onSuccess?.call();
      }
    }
  }
}

class TrashIcon extends StatelessWidget {
  const TrashIcon({super.key, required this.trashColor});

  final Color trashColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetConstants.trashIcon,
      color: trashColor,
      //colorFilter: ColorFilter.mode(trashColor, BlendMode.),
      width: 100,
      height: 100,
    );
  }
}
