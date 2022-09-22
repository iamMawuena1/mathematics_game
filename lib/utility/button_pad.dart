// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:math_game/fixedtext.dart';

class MyKeypPad extends StatelessWidget {
  final String child;
  //BTN COLOR
  var buttonColor = Colors.amber;
  //ONPRESS FUNC FOR ANS KEYPAD
  final VoidCallback onTap;
  MyKeypPad({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CONDITION TO CHECK FOR PARTICULAR NUMBER PAD
    if (child == 'CLR') {
      buttonColor = Colors.red;
    } else if (child == 'DEL') {
      buttonColor = Colors.blue;
    } else if (child == '=') {
      buttonColor = Colors.green;
    } else if (child == '-') {
      buttonColor = Colors.purple;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              child,
              style: myTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
