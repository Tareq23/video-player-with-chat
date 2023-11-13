import 'package:flutter/material.dart';
import 'package:qtect_task/pages/home.dart';
import 'package:qtect_task/pages/video_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Job Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      // home: const Home(),
      home: VideoDetails(),
    );
  }
}
