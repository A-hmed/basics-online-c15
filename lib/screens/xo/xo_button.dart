import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/screens/xo/xo_styles.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final Function onClick;
  final int index;

  const XoButton({super.key, required this.symbol,
    required this.onClick, required this.index});

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (symbol == "x" || symbol == "o") {
      image = Image.asset(symbol == "x" ? XoAssets.icX : XoAssets.icO);
    } else {
      image = SizedBox(
        width: double.infinity,
        height: double.infinity,
      );
    }
    return Expanded(
        child: InkWell(
            onTap: () {
              onClick(index);
            },
            child: image));
  }
}
