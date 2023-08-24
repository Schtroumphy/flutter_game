import 'package:flutter/material.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String location = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder(
      color: CustomColors.orange,
    );
  }
}
