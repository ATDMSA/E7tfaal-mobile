import 'package:flutter/material.dart';

class AppColors {
  //static const Color primaryBackground = Color.fromARGB(255, 255, 255, 255);

// Gradient Color
  static const Color PurpleColor = Color(0xff993399);
  static const Color PurpleDarkColor = Color(0xff752775);
  static const Color GreyColor = Color(0xffADADAD);
  static const Color GreyLightColor = Color(0xffd3d3d3);
  static const Color GreyLightsColor = Color(0xffF2F3F6);
  static const Color YellowColor = Color(0xffDCA310);
  static const Color blackColor = Color(0xff656161);
  static const Color redColor = Color(0xffFF0A0A);
  static const Color greenColor = Color(0xff4CAF50);
  static const Color whiteColor = Colors.white;
  static const Color blackDarkColor = Colors.black;
  static const Color registrationTextPlaceholderColor = Color(0xff236274);
  static const Gradient customGradient = LinearGradient(
      colors: [
        AppColors.YellowColor,
        AppColors.YellowColor,
        AppColors.PurpleColor,
      ],
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter);
}


class Styles {
  static TextStyle loginTextStyle = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: AppColors.whiteColor,
  );
  static TextStyle appbarTextStyle = TextStyle(
    fontSize: 22,
    fontStyle: FontStyle.normal,
    color: AppColors.whiteColor,
  );

}