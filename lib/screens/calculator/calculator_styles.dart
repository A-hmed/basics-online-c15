import 'package:flutter/material.dart';

abstract final class CalculatorColors {
  static const Color white = Colors.white;
  static const Color darkBlue = Color(0xff005DB2);
  static const Color grey = Color(0xff303136);
  static const Color lightGrey = Color(0xff616161);
  static const Color veryLightGrey = Color(0xffA5A5A5);
  static const Color black = Color(0xff17181A);
  static const Color lightBlue = Color(0xff339DFF);
}

abstract final class CalculatorStyles {
  static TextStyle white48Medium = TextStyle(
      color: CalculatorColors.white, fontWeight: FontWeight.w500, fontSize: 48);
  static TextStyle darkBlue32Medium = TextStyle(
      color: CalculatorColors.darkBlue,
      fontWeight: FontWeight.w500,
      fontSize: 36);

  static TextStyle veryLightGrey32Medium = TextStyle(
      color: CalculatorColors.veryLightGrey,
      fontWeight: FontWeight.w500,
      fontSize: 32);
}
