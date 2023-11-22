import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: 290,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 192,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/thumbnail.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      width: 35,
                      height: 17,
                      padding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.92),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '3:40',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset('assets/images/channel.png',width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
                ),
                SizedBox(
                  width: screenSize.width*0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'সর্বশেষ জান্নাতি ব্যাক্তি জান্নাতে যাওয়ার কান্ডকৃওি নিয়ে যা ঘটল...',
                        style: TextStyle(fontSize: 15,color: Color.fromRGBO(26, 32, 44, 1),),
                      ),

                      Text(
                        '29,393 views     Feb 21, 2021',
                        style: TextStyle(fontSize: 15,color: Color.fromRGBO(113, 128, 150, 1),),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert,size: 24,color: Color.fromRGBO(203, 213, 224, 1),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
