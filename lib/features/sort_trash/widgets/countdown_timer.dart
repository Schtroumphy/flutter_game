import 'package:flutter/material.dart';
import 'package:flutter_game/core/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountdownTimer extends ConsumerStatefulWidget {
  const CountdownTimer({Key? key, required this.duration, this.onFinished}) : super(key: key);

  final Duration duration;
  final Function? onFinished;

  @override
  ConsumerState<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends ConsumerState<CountdownTimer> {
  final bool startTimer = false;
  double _currentWidth = 250;

  set currentWidth(double value) {
    setState(() {
      _currentWidth = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Insets.m),
      height: 20,
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Stack(alignment: Alignment.centerLeft, children: [
        AnimatedContainer(
            padding: const EdgeInsets.all(Insets.m),
            width: _currentWidth,
            duration: const Duration(seconds: 1),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              color: Colors.blue,
            ),
            child: const SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.only(left: Insets.m),
          child: Countdown(
            seconds: widget.duration.inSeconds,
            interval: const Duration(milliseconds: 100),
            build: (BuildContext context, double time) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                currentWidth = time * 250 / widget.duration.inSeconds;
              });
              return Text(
                "$time",
                style: TextStyle(
                  color: time > 3 ? Colors.white : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
            onFinished: _onTimerFinished,
          ),
        ),
      ]),
    );
  }

  _onTimerFinished() => widget.onFinished?.call();
}
