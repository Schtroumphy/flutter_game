import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_game/features/sort_trash/models/asset_waste_item.dart';
import 'package:flutter_game/features/sort_trash/providers/sort_trash_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../models/trash_item.dart';

class WasteItem extends ConsumerWidget {
  const WasteItem({super.key, required this.item, this.isLastOne = false});

  final TrashItem item;
  final bool isLastOne;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isError = !ref.watch(sortTrashGameNotifierProvider).isButtonsEnabled && isLastOne;
    return Center(
      child: DottedBorder(
        borderType: BorderType.Circle,
        dashPattern: const [10, 10, 10, 10],
        color: isError ? CustomColors.redError : Colors.amber.withOpacity(isLastOne ? 1 : 0),
        strokeWidth: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              color: item.type.color,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    WasteItemAsset.randomItemByType(item.type).path,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
                if (isError)
                  const Positioned.fill(
                    child: Icon(
                      Icons.close,
                      size: 60,
                      weight: 50,
                      color: CustomColors.redError,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
