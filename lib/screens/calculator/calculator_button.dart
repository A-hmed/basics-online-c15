import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/screens/calculator/calculator_styles.dart';

class CalculatorButton extends StatelessWidget {
  final int flex;
  final Color backgroundColor;
  final Color textColor;
  final String digit;
  final Function onClick;

  const CalculatorButton(
      {super.key,
      this.flex = 1,
      this.backgroundColor = CalculatorColors.lightBlue,
      this.textColor = CalculatorColors.darkBlue,
      required this.onClick,
      required this.digit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Container(
          margin: EdgeInsets.all(12),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  backgroundColor: WidgetStateProperty.all(backgroundColor)),
              onPressed: () {
                if (digit == "=") onClick();
                else onClick(digit);
              },
              child: Text(
                digit,
                style: CalculatorStyles.darkBlue32Medium
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              )),
        ));
  }
}
