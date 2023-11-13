import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  const HeadlineText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color.fromRGBO(26, 32, 44, 1),),
    );
  }
}
