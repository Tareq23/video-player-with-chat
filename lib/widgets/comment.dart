import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(right: 8,top: 16,bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Image.asset('assets/images/channel.png',fit: BoxFit.fill,),
          ),
          const SizedBox(width: 7,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Fahmida khanom',
                      style: TextStyle(
                        color: Color.fromRGBO(113, 128, 150, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: '    2 days ago',
                          style: TextStyle(
                            color: Color.fromRGBO(113, 128, 150, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                const SizedBox(
                  child: Text('হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি',
                    style: TextStyle(
                      color: Color.fromRGBO(113, 128, 150, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
