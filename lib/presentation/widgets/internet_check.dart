


import 'package:flutter/material.dart';

class InternetCheck extends StatelessWidget {
  const InternetCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text('Please Check Your Internet Connection',style: TextStyle(color: Colors.white),),
    );
  }
}
