
class AppGame {
  final GameType type;
  final int score;
  final int errors;

  AppGame({
    required this.type,
    required this.score,
    required this.errors,
  });

  AppGame copyWith({GameType? type, int? score, int? errors}) {
    return AppGame(
      type: type ?? this.type,
      score: score ?? this.score,
      errors: errors ?? this.errors,
    );
  }
}

enum GameType {
  sortTheTrash,
  other,
}
