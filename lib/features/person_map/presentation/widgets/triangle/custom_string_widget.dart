import 'package:flutter/material.dart';

class CustomStringWidget extends StatelessWidget {
  final String inputString;

  const CustomStringWidget({Key? key, required this.inputString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> characterWidgets = inputString.split('').map((char) {
      return SizedBox(
        width: 20.0,
        child: Center(
          child: Text(char, textAlign: TextAlign.center,),
        ),
      );
    }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: characterWidgets,
    );
  }
}

