import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/screens/calculator/calculator_styles.dart';

class CalculatorButton extends StatelessWidget {
  final int flex;
  final Color backgroundColor;
  final Color textColor;
  final String digit;
  final Function x;

  const CalculatorButton(
      {super.key,
      this.flex = 1,
      this.backgroundColor = CalculatorColors.grey,
      this.textColor = CalculatorColors.darkBlue,
      required this.x,
      required this.digit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  backgroundColor: WidgetStateProperty.all(backgroundColor)),
              onPressed: () {
                if(digit == "="){
                  x();
                }else {
                  x(digit);
                }

              },
              child: Text(
                digit,
                style: CalculatorStyles.darkBlue32Medium
                    .copyWith(color: textColor),
              )),
        ));
  }
}
