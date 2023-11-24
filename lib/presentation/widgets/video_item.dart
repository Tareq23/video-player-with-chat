import 'package:flutter/material.dart';
import 'package:qtect_task/constant/constant.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:qtect_task/data/model/video.dart';
import 'package:qtect_task/presentation/widgets/network_image_builder.dart';

class VideoItem extends StatelessWidget {
  final Video video;
  const VideoItem({required this.video, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,

      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 192,
              child: Stack(
                children: [
                  NetworkImageBuilder(imageUrl: video.thumbnail!),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      width: 35,
                      height: 17,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.92),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        video.duration!,
                        style: const TextStyle(
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
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: NetworkImageBuilder(imageUrl: video.channelImage!,)
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        // width: screenSize.width * 0.65,
                        margin: const EdgeInsets.only(left: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: width! * 0.63
                              ),
                              child: Text(
                                video.title!.length > 50 ? '${video.title!.substring(0, 50)}+...' : video.title!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(26, 32, 44, 1),
                                  fontFamily: 'Hind Siliguri',
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Text(
                              '${video.viewers} views     ${timeago.format(video.createdAt!, locale: 'bn')}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Hind Siliguri',
                                color: Color.fromRGBO(113, 128, 150, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.more_vert,
                    size: 24,
                    color: Color.fromRGBO(203, 213, 224, 1),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
