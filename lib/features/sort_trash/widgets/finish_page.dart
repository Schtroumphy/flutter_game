import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key, required this.score, required this.errors}) : super(key: key);

  final int score;
  final int errors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("You finished Score : $score, Errors : ${errors}, you can play again !"),
          //FloatingActionButton(onPressed: onPressed)
        ],
      ),
    );
  }
}
