import 'package:flutter/material.dart';
import 'package:flutter_game/core/constants.dart';
import 'package:flutter_game/features/sort_trash/controllers/sort_trash_provider.dart';
import 'package:flutter_game/features/sort_trash/models/trash_item.dart';
import 'package:flutter_game/features/sort_trash/widgets/trash_button_row.dart';
import 'package:flutter_game/features/sort_trash/widgets/waste_item.dart';
import 'package:flutter_game/widgets/game_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortTrashGameScreen extends ConsumerStatefulWidget {
  const SortTrashGameScreen({Key? key}) : super(key: key);

  static const String location = "/sort_trash_home/sort_trash_game";
  static const String path = "sort_trash_game";

  @override
  ConsumerState<SortTrashGameScreen> createState() => _SortTrashScreenState();
}

class _SortTrashScreenState extends ConsumerState<SortTrashGameScreen> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(sortTrashGameNotifierProvider).items;

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
        TrashButtonRow(
          onError: _onErrorOccurred
        )
      ],
    );
  }

  WasteItem _buildItem(TrashItem item, int index) {
    final isLastOne = index == 2;
    return WasteItem(
      key: UniqueKey(),
      item: item,
      isLastOne: isLastOne,
    );
  }


  _onErrorOccurred() async {
    await ref.read(sortTrashGameNotifierProvider.notifier).handleError();
  }
}
