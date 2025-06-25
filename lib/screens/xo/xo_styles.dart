import 'package:flutter/material.dart';

abstract final class XoColors {
  static const red = Color(0xffF54D62);
  static const green = Color(0xff87E43A);
}

abstract final class XoTextStyles {
  static const TextStyle black32SemiBold =
      TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black);
  static const TextStyle white36Bold =
      TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white);
  static const TextStyle white40Bold =
  TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white);
  static const TextStyle white24Medium =
  TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white);

}

abstract final class XoAssets {
  static const icX = "assets/ic_x.png";
  static const icO = "assets/ic_o.png";
  static const pickPlayerBg = "assets/pick_player_bg.png";
}
