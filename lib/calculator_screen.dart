import 'dart:math';

import 'package:calculator_practice/calculator_bottom.dart';
import 'package:calculator_practice/operations.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = "CalculatorScreen";

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String textView = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  textView,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ))
              ],
            ),
          ),
          // Row(
          //   children: [
          //     CalculatorBottom(titleBottom: "C",onClick: onPressedClear,),
          //   ],
          // ),
          Expanded(
            child: Row(
              children: [
                CalculatorBottom(
                  titleBottom: "C",
                  onClick: onPressedClear,
                ),
                CalculatorBottom(
                  titleBottom: "Sqr(",
                  onClick: onPressedSqroot,
                ),
                CalculatorBottom(
                  titleBottom: "^",
                  onClick: onPressedOperation,
                ),
                CalculatorBottom(
                  titleBottom: "B",
                  onClick: onPressedBackSpace,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorBottom(
                  titleBottom: "7",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "8",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "9",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "/",
                  onClick: onPressedOperation,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorBottom(
                  titleBottom: "4",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "5",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "6",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "*",
                  onClick: onPressedOperation,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorBottom(
                  titleBottom: "1",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "2",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "3",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "+",
                  onClick: onPressedOperation,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorBottom(
                  titleBottom: ".",
                  onClick: onPressedBottom,
                ),
                CalculatorBottom(
                  titleBottom: "0",
                  onClick: onPressedNumber,
                ),
                CalculatorBottom(
                  titleBottom: "=",
                  onClick: onPressedOperation,
                ),
                CalculatorBottom(
                  titleBottom: "-",
                  onClick: onPressedBottom,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String savedNumber = "";
  String savedOperator = ""; //"+"
  String result = "";

  onPressedNumber(String textViewResult) {
    //titleBottom
    setState(() {
      print(" iam the number");
      textView += textViewResult;
    });
  }

  onPressedOperation(String bottomOperation) {
    //titleBottom
    if (bottomOperation.contains("=") && savedNumber.isEmpty) {
      return;
    } else if (savedNumber.isEmpty) {
      savedNumber = textView;
      savedOperator = bottomOperation;
      print("number is saved :$savedNumber,operator is saved :$savedOperator");
      setState(() {
        textView = "";
      });
    } else if (savedNumber.isNotEmpty) {
      if (savedOperator == '^') {
        setState(() {
          textView = onPressedasserts(savedNumber, textView);
        });
      } else {
        print("now i have the second number:$textView");
        result = calculate(savedNumber, savedOperator, textView); //+
        resultBottom(result);
        print(savedNumber);
        savedNumber = "";
        savedOperator = "";
      }
    }

    // if(savedNumber.isEmpty){//first number
    //   print("now i have the first number");
    //   savedNumber=textView;
    //   savedOperator=bottomOperation;
    //   print("number is saved$savedNumber");
    //   print("operator is saved :$savedOperator");
    //   setState(() {
    //     textView ="";
    //   });
    // }else{//second number  savedNumber=12 ,number =5
    //   print("now i have the second number");
    //
    //   result = calculate(savedNumber,savedOperator,textView);//+
    //
    //
    //
    // }
  }

  void onPressedBottom(String titleBottom) {
    //titleBottom
    if (textView.contains(".") && titleBottom.contains(".")) {
      return;
    }
    setState(() {
      textView += titleBottom;
    });
  }

  void resultBottom(String _) {
    setState(() {
      textView = result;
    });
  }

  String calculate(String numberr_1, String operator, String numberr_2) {
    print("number_1:$numberr_1,number_2:$numberr_2");
    double number_1 = double.parse(numberr_1); //1
    double number_2 = double.parse(numberr_2); //2
    print("number_1:$number_1,number_2:$number_2");

    double res;
    if (operator == '+') {
      res = Operations.add(number_1, number_2);
    } else if (operator == '-') {
      res = Operations.subtraction(number_1, number_2);
    } else if (operator == '*') {
      res = Operations.multiplication(number_1, number_2);
    } else {
      res = Operations.division(number_1, number_2);
    }
    result = res.toString();
    return result;
  }

  void onPressedClear(String _) {
    setState(() {
      savedNumber = "";
      savedOperator = "";
      textView = "";
    });
  }

  void onPressedBackSpace(String titleBottom) {
    setState(() {
      if (textView.isNotEmpty) {
        //   if(textView.contains('.')){
        //     textView=
        //   }
        textView = textView.substring(0, textView.length - 1);
      }
      // int backSpace =int.parse(textView);//123
      // backSpace = backSpace~/10;
      // textView=backSpace.toString();
    });
  }

  void onPressedSqroot(String titleBottom) {
    setState(() {
      double number = double.parse(textView);

      number = sqrt(number);
      textView = number.toString();
    });
  }

  String onPressedasserts(String number_1, String numberOperation) {
    int numberr_1 = int.parse(number_1);
    int numberr_2 = int.parse(numberOperation);
    int result = numberr_1;
    while (numberr_2 > 1) {
      result *= numberr_1;
      numberr_2--;
    }

    return result.toString();
  }
}
