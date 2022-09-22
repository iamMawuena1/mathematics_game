// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../fixedtext.dart';

class ResultPage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;
  const ResultPage(
      {Key? key, required this.message, required this.onTap, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 150,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: myTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 60,
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Colors.white60,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
