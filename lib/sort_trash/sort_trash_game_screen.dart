import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/sort_trash/models/trash_item.dart';
import 'package:flutter_game/sort_trash/providers/sort_trash_provider.dart';
import 'package:flutter_game/sort_trash/widgets/trash_button.dart';
import 'package:flutter_game/sort_trash/widgets/waste_item.dart';
import 'package:flutter_game/widgets/game_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_game/sort_trash/models/trash_item_type.dart';

class SortTrashGameScreen extends ConsumerStatefulWidget {
  const SortTrashGameScreen({Key? key}) : super(key: key);

  static const String location = "/sort_trash_home/sort_trash_game";
  static const String path = "sort_trash_game";

  @override
  ConsumerState<SortTrashGameScreen> createState() => _SortTrashScreenState();
}

class _SortTrashScreenState extends ConsumerState<SortTrashGameScreen> {
  final ScrollController _controller = ScrollController();

  bool _isButtonEnabled = true;

  set isButtonEnabled(bool value) {
    setState(() {
      _isButtonEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(sortTrashGameNotifierProvider);

    return GameScaffold(
      gameTitle: StringConstants.sortTrashTitle,
      children: [
        Expanded(
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              controller: _controller,
              itemBuilder: (_, index) {
                final item = items[index];
                return _buildItem(item, index);
              },
              itemCount: items.length,
            ),
          ),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            trashButton([TrashType.glass, TrashType.plastic], "glassTrash", false),
            const Spacer(),
            trashButton([TrashType.metal, TrashType.metal], "plasticTrash", true),
          ],
        ),
      ],
    );
  }

  WasteItem _buildItem(TrashItem item, int index) {
    final isLastOne = index == 3;
    return WasteItem(
        key: UniqueKey(),
        item: item,
        isLastOne: isLastOne,
        isOnError: isLastOne && !_isButtonEnabled);
  }

  TrashButton trashButton(List<TrashType> types, String heroTag, bool isInversed) {
    return TrashButton(
      heroTag: heroTag,
      buttonTypes: types,
      enabled: _isButtonEnabled,
      onErrorOccurred: onErrorOccurred,
      onSuccess: null,
      isInversed: isInversed,
    );
  }


  void onErrorOccurred() async {
    isButtonEnabled = false;
    await Future.delayed(const Duration(seconds: 2));
    isButtonEnabled = true;
    ref.read(sortTrashGameNotifierProvider.notifier).removeLastItem();
  }
}
