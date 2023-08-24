import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._();


  static const orange = Color(0xFFC47115);
  static const white = Color(0xfff5f5f5);



  static const darkerBlue = Color(0xff00335B); // text style
  static const primary = Color(0xff819ef0);

  static const veryLightGrey = Color(0xfff6f4f1); // background
  static const redError = Color(0xfff9747f);

  static const greenSuccess = Color(0xff77c3d0);
  static const blueCreated = Color(0xff97aff3);
  static const greenDone = Color(0xff00eb18);

  static const greenPerformed = Color(0xff77c3d0);
  static const redNotPerformed = Color(0xfffa5178);
  static const greyOnGoing = Color(0xffc7c6d7);

  static const orangePost = Color(0xffff9042);
  static const blueCheck = Color(0xff97aff3);
  static const greyOther = Color(0xffa1b1cf);
}

class Insets {
  Insets._();

  static const xs = 2.0;
  static const s = 4.0;
  static const m = 8.0;
  static const l = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const titleTopMargin = 30.0;
}

class TextSize {
  TextSize._();

  static const small = 12.0;
  static const medium = 16.0;
  static const large = 24.0;
  static const xxlarge = 45.0;
}

class IconSize {
  IconSize._();

  static const small = 12.0;
  static const medium = 24.0;
  static const large = 32.0;
  static const xxlarge = 50.0;
}

class TextStyles {
  TextStyles._();

  static const gameHomeTitle = TextStyle(
    fontSize: TextSize.xxlarge,
    fontWeight: FontWeight.bold,
    color: CustomColors.orange,
  );

  static const gameTitle = TextStyle(
    fontSize: TextSize.large,
    fontWeight: FontWeight.bold,
    color: CustomColors.white,
  );
}
