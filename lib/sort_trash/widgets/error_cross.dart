

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorCross extends StatelessWidget {
  const ErrorCross({
    super.key,
    required bool isButtonEnabled,
  }) : _isButtonEnabled = isButtonEnabled;

  final bool _isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const Border(),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.red.withOpacity(_isButtonEnabled ? 0 : 1),
      ),
      child: const Icon(Icons.close, color: Colors.white),
    );
  }
}