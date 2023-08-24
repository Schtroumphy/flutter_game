import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_game/feature_home/home_screen.dart';
import 'package:flutter_game/sort_trash/providers/final_game_provider.dart';
import 'package:flutter_game/sort_trash/sort_trash_end_screen.dart';
import 'package:flutter_game/sort_trash/sort_trash_game_screen.dart';
import 'package:flutter_game/sort_trash/sort_trash_home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider =
    NotifierProvider<RouterNotifier, GoRouter>(() => RouterNotifier());

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final _routes = [
  GoRoute(
    path: HomeScreen.location,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: SortTrashHome.location,
    builder: (context, state) => const SortTrashHome(),
  ),
  GoRoute(
    path: SortTrashGameScreen.location,
    builder: (context, state) => const SortTrashGameScreen(),
  ),
  GoRoute(
    path: SortTrashEndScreen.location,
    builder: (context, state) => const SortTrashEndScreen(),
  ),
];

class RouterNotifier extends Notifier<GoRouter> {
  RouterNotifier({
    this.observers = const [],
    this.enabledRedirect = true,
    this.initialLocation,
  });

  final List<NavigatorObserver> observers;
  final bool enabledRedirect;
  final String? initialLocation;

  @override
  GoRouter build() {
    final notifier = _RouterChangeNotifier(ref);

    final router = GoRouter(
      routes: _routes,
      observers: observers,
      redirect: enabledRedirect ? _redirect : null,
      refreshListenable: notifier,
      initialLocation: initialLocation ?? SortTrashHome.location,
      debugLogDiagnostics: kDebugMode,
      navigatorKey: _rootNavigatorKey,
    );

    ref.onDispose(() {
      router.dispose();
      notifier.dispose();
    });

    return router;
  }

  String? _redirect(BuildContext context, GoRouterState state) {
    return null;
  }
}

class _RouterChangeNotifier extends ChangeNotifier {
  _RouterChangeNotifier(Ref ref) {
    ref.listen(endedGameProvider, (_, __) => notifyListeners());
  }
}
