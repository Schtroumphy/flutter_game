import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/core/styles.dart';

@immutable
class AppThemeData with Diagnosticable {
  AppThemeData({
    required this.mediumTitle,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.label,
    required this.error,
  });

  factory AppThemeData.fromContext(BuildContext context) {
    final theme = Theme.of(context);

    return AppThemeData(
      mediumTitle: const TextStyle(
        color: CustomColors.darkerBlue,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      title: const TextStyle(
        color: CustomColors.darkerBlue,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      subtitle: const TextStyle(
        color: CustomColors.darkerBlue,
        fontSize: 16,
      ),
      text: const TextStyle(
        color: CustomColors.darkerBlue,
        fontSize: 14,
      ),
      label: TextStyle(
        color: theme.colorScheme.secondary,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      error: const TextStyle(
        color: Colors.red,
      ),
    );
  }

  final TextStyle mediumTitle;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle text;
  final TextStyle label;
  final TextStyle error;
}

class AppTheme extends StatelessWidget {
  const AppTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final AppThemeData data;
  final Widget child;

  static TransitionBuilder init({TransitionBuilder? builder}) {
    return (BuildContext context, Widget? child) {
      child = AppTheme(
        data: AppThemeData.fromContext(context),
        child: child ?? const SizedBox(),
      );

      return builder != null ? builder(context, child) : child;
    };
  }

  static AppThemeData of(BuildContext context) {
    final inheritedTheme = context.dependOnInheritedWidgetOfExactType<_AppTheme>();
    return inheritedTheme?.data ?? AppThemeData.fromContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return _AppTheme(
      data: data,
      child: child,
    );
  }
}

class _AppTheme extends InheritedTheme {
  const _AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final AppThemeData data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorTheme = context.findAncestorWidgetOfExactType<_AppTheme>();
    return identical(this, ancestorTheme) ? child : AppTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(_AppTheme old) {
    return old.data != data;
  }
}
