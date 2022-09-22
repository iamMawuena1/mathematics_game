import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game/fixedtext.dart';
import 'package:math_game/utility/answer_page.dart';
import 'package:math_game/utility/button_pad.dart';

class MathPage extends StatefulWidget {
  const MathPage({Key? key}) : super(key: key);

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  //NUMBERS ON THE KEYPAD
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'CLR',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '',
    '='
  ];

  //USER ANSWER
  String userAnswer = '';

  //FUNX FOR USER BTN TAP
  void btnTapped(String button) {
    setState(() {
      if (button == '=') {
        //calcultate for result
        checkResult();
      } else if (button == 'CLR') {
        //clear screen
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      }
      //maximum of 3 numbers can be inputed
      else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  //QUESTIONS SLOT [A, B]
  int numberA = 100;
  int numberB = 45;

  //CALCULATE RESULT
  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
        context: context,
        builder: ((context) {
          return ResultPage(
            message: 'Correct!',
            onTap: nextQuestion,
            icon: Icons.arrow_forward_ios_rounded,
          );
        }),
      );
    } else {
      showDialog(
        context: context,
        builder: ((context) {
          return ResultPage(
            message: 'Sorry, Try Again',
            onTap: returnQuestion,
            icon: Icons.rotate_left_outlined,
          );
        }),
      );
    }
  }

  //CREATE RANDOM NUMBERS
  var randomNumber = Random();

  //CLICK TO NEW QUESTION
  void nextQuestion() {
    Navigator.of(context).pop();

    //reset value
    setState(() {
      userAnswer = '';
    });
    //CREATE A NEW QUESTION
    numberA = randomNumber.nextInt(100);
    numberB = randomNumber.nextInt(100);
  }

  // BACK TO PREVIOUS QUESTION
  void returnQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //PROGRESS BAR
          Container(
            height: 100.0,
            color: Colors.transparent,
          ),
          //QUESTIONS PANEL
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[700],
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$numberA + $numberB = ',
                      style: myTextStyle,
                    ),
                    Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: myTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //NUMBER PAD SECTION
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numberPad.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: ((context, index) {
                  return MyKeypPad(
                    child: numberPad[index],
                    onTap: () => btnTapped(numberPad[index]),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
