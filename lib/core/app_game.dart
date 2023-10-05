
class AppGame {
  final GameType type;
  final int score;
  final int errors;
  final Duration duration;

  AppGame({
    required this.type,
    required this.score,
    required this.errors,
    required this.duration,
  });

  AppGame copyWith({GameType? type, int? score, int? errors, Duration? duration}) {
    return AppGame(
      type: type ?? this.type,
      score: score ?? this.score,
      errors: errors ?? this.errors,
      duration: duration ?? this.duration,
    );
  }
}

enum GameType {
  sortTheTrash,
  other,
}
