import 'package:flutter/material.dart';

typedef OnClick = void Function(String titleBottom);

class CalculatorBottom extends StatelessWidget {
  String titleBottom;
  OnClick onClick;

  CalculatorBottom({required this.titleBottom, required this.onClick});

  double? number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            print("$titleBottom");
            onClick(titleBottom);
          },
          child: Container(
            height: 140,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              titleBottom,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
