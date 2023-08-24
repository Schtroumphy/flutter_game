import 'package:flutter/material.dart';
import 'package:flutter_game/feature_home/home_screen.dart';
import 'package:flutter_game/sort_trash/providers/final_game_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SortTrashEndScreen extends ConsumerWidget {
  const SortTrashEndScreen({Key? key}) : super(key: key);

  static const String location = "/sort_trash_end_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sort Trash Game !"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "You have finished the game",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text("Score : "),
          const Text("Errors : "),
          ElevatedButton(
            onPressed: () => _onGoBackButtonPressed(context, ref), // GO to sort trash game page
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _onGoBackButtonPressed(BuildContext context, WidgetRef ref) {
    //ref.read(endedGameProvider.notifier). = null;
    context.push(HomeScreen.location);
  }
}
