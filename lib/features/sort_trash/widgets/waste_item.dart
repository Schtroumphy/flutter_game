import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/features/sort_trash/models/asset_waste_item.dart';
import 'package:flutter_svg/svg.dart';

import '../models/trash_item.dart';

class WasteItem extends StatelessWidget {
  const WasteItem({super.key, required this.item, this.isOnError = false, this.isLastOne = false});

  final TrashItem item;
  final bool isOnError;
  final bool isLastOne;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        borderType: BorderType.Circle,
        dashPattern: const [10, 10],
        color: isOnError ? Colors.red : Colors.amber.withOpacity(isLastOne ? 1 : 0),
        strokeWidth: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              color: isOnError ? Colors.red : item.type.color,
            ),
            child: SvgPicture.asset(
              WasteItemAsset.randomItemByType(item.type).path,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
