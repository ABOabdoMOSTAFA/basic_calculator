import 'package:flutter/material.dart';

typedef OnClick = void Function(String iconBottom);

class IconBottomCalculator extends StatelessWidget {
  String iconBottom;
  OnClick onClick;

  IconBottomCalculator({required this.iconBottom, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            print("$iconBottom");
            onClick(iconBottom);
          },
          child: Container(
            height: 140,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Icon(
              Icons.backspace_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
