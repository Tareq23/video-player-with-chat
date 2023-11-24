


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtect_task/business_logic/videos/video_event.dart';
import 'package:qtect_task/business_logic/videos/video_state.dart';
import 'package:qtect_task/data/repository/video_repository.dart';

class VideoBloc extends Bloc<VideoListEvent,VideoListState>{
  final VideoRepository videoRepository = VideoRepository();

  VideoBloc() : super(VideoListLoading()){

    on<VideoListEvent>((event,state) async {
      emit(VideoListLoading());
      try{
        print('calling');
        final videos = await videoRepository.getVideoList();
        print('videos list: ${videos.length}');
        emit(VideoListLoaded(videos));
      }catch (e){
        emit(VideoListError('Something went to wrong'));
      }
    });
  }

}