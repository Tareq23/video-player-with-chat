import 'package:flutter/material.dart';
import 'package:qtect_task/widgets/video_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 14,right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('Trending Videos',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color.fromRGBO(26, 32, 44, 1),),),
                ),
                SizedBox(height: 16,),
                VideoItem(),
                SizedBox(height: 18,),
                VideoItem(),
                SizedBox(height: 18,),
                VideoItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
