
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtect_task/business_logic/videos/video_bloc.dart';
import 'package:qtect_task/business_logic/videos/video_event.dart';
import 'package:qtect_task/business_logic/videos/video_state.dart';
import 'package:qtect_task/constant/constant.dart';
import 'package:qtect_task/presentation/widgets/try_again.dart';
import 'package:qtect_task/presentation/widgets/video_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: width! * 0.1,
              child: const Text(
                'Trending Videos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(26, 32, 44, 1),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // VideoItem(),
            // SizedBox(height: 18,),

            BlocBuilder<VideoBloc, VideoListState>(
              builder: (context, state) {
                if (state is VideoListLoading) {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        )),
                  );
                }
                if (state is VideoListLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.videos.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/video-details',arguments: state.videos[index]);
                        },
                        child: VideoItem(
                          video: state.videos[index],
                        ),
                      );
                    },
                  );
                }
                print(state);
                return TryAgain(event: VideoListLoadingEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
