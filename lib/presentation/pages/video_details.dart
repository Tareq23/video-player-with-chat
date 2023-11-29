import 'package:flutter/material.dart';
import 'package:qtect_task/presentation/widgets/network_image_builder.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:qtect_task/data/model/video.dart';
import 'package:qtect_task/presentation/widgets/comment.dart';
import 'package:qtect_task/presentation/widgets/custom_divider.dart';
import 'package:qtect_task/presentation/widgets/headline_text.dart';
import 'package:qtect_task/presentation/widgets/like_button.dart';
import 'package:qtect_task/presentation/widgets/simple_blur_text.dart';
import 'package:qtect_task/presentation/widgets/video_player_widget.dart';


class VideoDetails extends StatefulWidget {
  final Video video;
  // const VideoDetails({Key? key}) : super(key: key);
  const VideoDetails({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /* VIDEO PLAYER */
                CustomVideoPlayer(thumbnailUrl:widget.video.thumbnail!),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: HeadlineText(
                          widget.video.title!,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SimpleBlurText(
                          text:
                              '${widget.video.viewers} views . ${timeago.format(widget.video.createdAt!, locale: 'bn')}'),
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: NetworkImageBuilder(
                                        imageUrl: widget.video.channelImage!,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HeadlineText(widget.video.channelName!),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 14),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(56, 152, 252, 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Text(
                                '+   Subscribe',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            )
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
                    ),
                  ),
                ),

                /* COMMENT SECTION*/
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SimpleBlurText(
                        text: 'Comments 7.5K',
                        fontSize: 14,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
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
                        onTap: () {},
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
