import 'package:flutter_riverpod/flutter_riverpod.dart';

final endedGameProvider = Provider<GameEnded>((ref) => GameEnded(ref));

class GameEnded {
  GameEnded(this.ref);

  final Ref ref;

  void changeEndedGame(GameType type) {
    //state = type;
  }
}

enum GameType { none, sortTrash, ticTacToe }
