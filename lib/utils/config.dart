//set constant config here
import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

//width and height initialization
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  //define spacing height
  static const spaceSmall = SizedBox(
    height: 25,
  );
  // static final spaceMedium = SizedBox(
  //   height: screenHeight! * 1,
  // );
  static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  //textform field border
  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 89, 89, 89),
      ));

  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.red,
      ));

  static const primaryColor = const Color(0xFF035766);
}
