import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtect_task/business_logic/internet_connectivity/internet_bloc.dart';
import 'package:qtect_task/business_logic/internet_connectivity/internet_state.dart';
import 'package:qtect_task/business_logic/videos/video_bloc.dart';
import 'package:qtect_task/business_logic/videos/video_event.dart';
import 'package:qtect_task/business_logic/videos/video_state.dart';
import 'package:qtect_task/constant/enum.dart';
import 'package:qtect_task/constant/constant.dart';
import 'package:qtect_task/presentation/widgets/internet_check.dart';
import 'package:qtect_task/presentation/widgets/try_again.dart';
import 'package:qtect_task/presentation/widgets/video_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    context.read<VideoBloc>().add(VideoListLoadingEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.None) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: SizedBox(
                child: InternetCheck(),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
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
          ),
        ),
      ),
    );
  }
}
