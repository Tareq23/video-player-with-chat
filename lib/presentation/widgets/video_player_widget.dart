import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtect_task/business_logic/video_details/video_bloc.dart';
import 'package:qtect_task/business_logic/video_details/video_event.dart';
import 'package:qtect_task/business_logic/video_details/video_state.dart';
import 'package:qtect_task/constant/constant.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {

  late VideoPlayerController _controller;
  late Future<void> videoInitializer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
    videoInitializer = _controller.initialize().then((value){
      _controller.play();
      _controller.setLooping(true);
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height! * 0.3,
      width: width!,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: FutureBuilder(
              future: videoInitializer,
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                }
                else{
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  );
                }
              },
            )
          ),
          Positioned(
            top: 8,
            left: 12,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                  height: 30,
                  width: 30,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(113, 128, 150, 0.4),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Icon(Icons.arrow_back,size: 22,color: Colors.white,)
              ),
            ),
          ),
          Positioned(
            top: (height! * 0.3) * 0.5 - 30,
            left: width! * 0.5 - 30,
            child:  Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: BlocBuilder<VideoDetailsBloc,VideoDetailsState>(
                  builder: (context,state){
                    if(state is VideoDetailsPlay){
                      return GestureDetector(
                        onTap: (){
                          _controller.pause();
                          context.read<VideoDetailsBloc>().add(VideoDetailsPauseEvent());
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: SizedBox.shrink(),
                        ),
                      );
                    }
                    return GestureDetector(onTap:(){
                      _controller.play();
                      context.read<VideoDetailsBloc>().add(VideoDetailsPlayEvent());
                    },child: const Icon(Icons.play_circle_rounded,size: 50,color: Colors.redAccent,),);
                  },
                )
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
