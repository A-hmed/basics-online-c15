import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/screens/calculator/calculator_button.dart';
import 'package:flutter_basics_c15/screens/calculator/calculator_styles.dart';

class Calculator extends StatefulWidget {
  static const routeName = "calculator";

  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";
  String lhs = "";
  String savedOperator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalculatorColors.black,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  result,
                  textAlign: TextAlign.end,
                  style: CalculatorStyles.white48Medium,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "Ac",
                  backgroundColor: CalculatorColors.lightGrey,
                  textColor: CalculatorColors.veryLightGrey,
                  x: onDigitClick,
                ),
                CalculatorButton(
                  digit: "C",
                  backgroundColor: CalculatorColors.lightGrey,
                  textColor: CalculatorColors.veryLightGrey,
                  x: onDigitClick,
                ),
                CalculatorButton(
                  digit: "/",
                  backgroundColor: CalculatorColors.darkBlue,
                  textColor: CalculatorColors.lightBlue,
                  x: onOperatorClick,
                ),
                CalculatorButton(
                  digit: "*",
                  backgroundColor: CalculatorColors.darkBlue,
                  textColor: CalculatorColors.lightBlue,
                  x: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "7",
                  backgroundColor: CalculatorColors.grey,
                  textColor: CalculatorColors.lightBlue,
                  x: onDigitClick,
                ),
                CalculatorButton(
                  digit: "8",
                  backgroundColor: CalculatorColors.grey,
                  textColor: CalculatorColors.lightBlue,
                  x: onDigitClick,
                ),
                CalculatorButton(
                  digit: "9",
                  backgroundColor: CalculatorColors.grey,
                  textColor: CalculatorColors.lightBlue,
                  x: onDigitClick,
                ),
                CalculatorButton(
                  digit: "-",
                  backgroundColor: CalculatorColors.darkBlue,
                  textColor: CalculatorColors.lightBlue,
                  x: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                ///4 5 6, 1 2 3, 0,
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CalculatorButton(
                              digit: "4",
                              backgroundColor: CalculatorColors.grey,
                              textColor: CalculatorColors.lightBlue,
                              x: onDigitClick,
                            ),
                            CalculatorButton(
                              digit: "5",
                              backgroundColor: CalculatorColors.grey,
                              textColor: CalculatorColors.lightBlue,
                              x: onDigitClick,
                            ),
                            CalculatorButton(
                              digit: "6",
                              backgroundColor: CalculatorColors.grey,
                              textColor: CalculatorColors.lightBlue,
                              x: onDigitClick,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CalculatorButton(
                              digit: "1",
                              backgroundColor: CalculatorColors.grey,
                              textColor: CalculatorColors.lightBlue,
                              x: onDigitClick,
                            ),
                            CalculatorButton(
                              digit: "2",
                              backgroundColor: CalculatorColors.grey,
                              textColor: CalculatorColors.lightBlue,
                              x: onDigitClick,
                            ),
                            CalculatorButton(
                              digit: "3",
                              backgroundColor: CalculatorColors.grey,
                              textColor: CalculatorColors.lightBlue,
                              x: onDigitClick,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CalculatorButton(
                              digit: "0",
                              backgroundColor: CalculatorColors.grey,
                              flex: 2,
                              textColor: CalculatorColors.lightBlue,
                              x: onDigitClick
                            ),
                            CalculatorButton(
                              digit: ".",
                              backgroundColor: CalculatorColors.grey,
                              textColor: CalculatorColors.lightBlue,
                              x: onDigitClick,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                /// + , =
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                       CalculatorButton(
                        digit: "+",
                        backgroundColor: CalculatorColors.darkBlue,
                        textColor: CalculatorColors.lightBlue,
                        x: onOperatorClick,
                      ),
                      CalculatorButton(
                        digit: "=",
                        backgroundColor: CalculatorColors.lightBlue,
                        textColor: CalculatorColors.white,
                        x: onEqualClick,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void onDigitClick(String digit) {
    if(result.contains('.') && digit == '.') return;
    result += digit;
    setState(() {});
  }

  ///7 + -
  void onOperatorClick(String clickedOperator) {
    if(savedOperator.isEmpty){
      lhs = result;
      savedOperator = clickedOperator;
      result = "";
      setState(() {});
    }else {
      if(result.isEmpty) return;
     lhs =  calculate(lhs, savedOperator, result);
     savedOperator = clickedOperator;
     result = "";
     setState(() {});
    }

    print("result = $result, saved operator = $savedOperator, lhs = $lhs");
  }


  void onEqualClick(){
    if(result.isEmpty) return;
    result = calculate(lhs, savedOperator, result);
    lhs = "";
    savedOperator = "";
    setState(() {});
  }


  String calculate(String lhs, String operator, String rhs){
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    if(operator == "+"){
      return "${n1 + n2}";
    }else if(operator == "-"){
      return "${n1 - n2}";
    }else if(operator == "*"){
      return "${n1 * n2}";
    }else {
      return "${n1 / n2}";
    }
  }
}
