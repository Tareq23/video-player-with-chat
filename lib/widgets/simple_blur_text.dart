import 'package:flutter/material.dart';

class SimpleBlurText extends StatelessWidget {
  final String text;
  final double fontSize;
  const SimpleBlurText({Key? key, this.fontSize = 15, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize,color: Color.fromRGBO(113, 128, 150, 1),),
    );
  }
}
