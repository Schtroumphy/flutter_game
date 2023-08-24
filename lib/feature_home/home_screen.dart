import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/sort_trash/sort_trash_home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String location = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background/home_1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Text(
                      "Sort the \ntrash",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color(0xFFC47115)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: GestureDetector(
                    onTap: () => context.push(SortTrashHome.location),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: const Color(0xFFC47115).withOpacity(0.7),
                          shape: BoxShape.circle
                      ),

                      child: const Icon(Icons.play_arrow, color: Colors.white, size: 50,),
                    ),
                  ),
                ),
                const Spacer(),
                /*SvgPicture.asset(
                  "assets/icons/play_btn.svg",
                  colorFilter: const ColorFilter.mode(Color(0xffC47115), BlendMode.srcIn),
                )*/
              ],
            )),
      ),
    );
  }
}
