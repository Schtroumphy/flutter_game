import 'package:flutter/material.dart';
import 'package:flutter_game/features/sort_trash/widgets/timer_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountdownTimer extends ConsumerStatefulWidget {
  const CountdownTimer({Key? key, required this.duration, this.onFinished}) : super(key: key);

  final Duration duration;
  final Function? onFinished;

  @override
  ConsumerState<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends ConsumerState<CountdownTimer> {
  final CountdownController _controller = CountdownController(autoStart: false);

  final bool startTimer = false;
  double _currentWidth = 250;

  set currentWidth(double value) {
    setState(() {
      _currentWidth = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final startTimer = ref.watch(isTimerStartedProvider.notifier).state;
    if(startTimer) {
      _controller.start();
      print("controller started");
    }



    return Container(
      margin: const EdgeInsets.all(8),
      height: 16,
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedContainer(
            padding: const EdgeInsets.all(8),
            width: _currentWidth,
            duration: const Duration(seconds: 1),
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                color: Colors.blue),
            child: const SizedBox.shrink()
          ),
          Padding(
            padding: const EdgeInsets.only(left:  8.0),
            child: Countdown(
              seconds: widget.duration.inSeconds,
              build: (BuildContext context, double time) {
                WidgetsBinding.instance.addPostFrameCallback((_){
                  currentWidth = time * 250 / widget.duration.inSeconds;
                });
                return Text(
                  "${time.toInt()}:00",
                  style: TextStyle(
                    color: time > 3 ? Colors.white : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
              onFinished: () => widget.onFinished?.call(),
            ),
          ),
        ]
      ),
    );
  }
}
