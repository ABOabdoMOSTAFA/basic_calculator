import 'package:calculator_practice/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapplication());
}

class Myapplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        CalculatorScreen.routeName: (context) => CalculatorScreen(),
      },
      initialRoute: CalculatorScreen.routeName,
    );
  }
}
