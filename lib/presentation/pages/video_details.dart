import 'package:flutter/material.dart';
import 'package:qtect_task/data/model/video.dart';
import 'package:qtect_task/presentation/widgets/comment.dart';
import 'package:qtect_task/presentation/widgets/custom_divider.dart';
import 'package:qtect_task/presentation/widgets/headline_text.dart';
import 'package:qtect_task/presentation/widgets/like_button.dart';
import 'package:qtect_task/presentation/widgets/simple_blur_text.dart';
import 'package:qtect_task/presentation/widgets/video_player_widget.dart';

import 'package:video_player/video_player.dart';

class VideoDetails extends StatefulWidget {
  final Video video;
  const VideoDetails({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /* VIDEO PLAYER */
                const CustomVideoPlayer(),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadlineText(
                          'আরব নেতাদের যে ভুলে ফি*লি*স্তি*নের এই দুর্দাশা | আবু ত্বহা মুহাম্মদ আদনান'),
                      SizedBox(
                        height: 8,
                      ),
                      SimpleBlurText(text: '53,245 views . 3 days ago'),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LikeButton(
                                icon: Icons.favorite_border,
                                text: 'Mash Allah (12K)'),
                            LikeButton(
                                icon: Icons.thumb_up_alt_outlined,
                                text: 'like (12K)'),
                            LikeButton(
                                icon: Icons.screen_share_outlined,
                                text: 'share'),
                            LikeButton(
                                icon: Icons.flag_outlined, text: 'report'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.asset(
                                        'assets/images/channel2.png'),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HeadlineText('Mega Bangla Tv'),
                                        SimpleBlurText(
                                          text: '3M Subscribers',
                                          fontSize: 11,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 14),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(56, 152, 252, 1),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  '+   Subscribe',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(226, 232, 240, 1),
                  )),
                ),

                /* COMMENT SECTION*/
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SimpleBlurText(
                        text: 'Comments 7.5K',
                        fontSize: 14,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 20,
                              color: Color.fromRGBO(113, 128, 150, 1),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                              color: Color.fromRGBO(113, 128, 150, 1),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                /* COMMENT TEXT FIELD*/
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(226, 232, 240, 1),
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: (){},
                        child: const Icon(
                          Icons.play_arrow_outlined,
                          size: 40,
                          color: Color.fromRGBO(160, 174, 192, 1),
                        ),
                      ),
                    ),
                  ),
                ),

                /* SINGLE COMMENT */
                CommentWidget(),
                CustomDivider(),
                CommentWidget(),
                CustomDivider(),
                CommentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
