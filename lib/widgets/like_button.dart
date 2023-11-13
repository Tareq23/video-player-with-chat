import 'package:flutter/cupertino.dart';
import 'package:qtect_task/widgets/simple_blur_text.dart';

class LikeButton extends StatelessWidget {
  final IconData icon;

  final String text;
  const LikeButton({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(226, 232, 240,1),width: 1),
      ),
      child: Column(
        children: [
          Icon(icon,size: 24,color: const Color.fromRGBO(113, 128, 150, 1),),
          SimpleBlurText(text: text.toUpperCase(),fontSize: 12,)
        ],
      ),
    );
  }
}
