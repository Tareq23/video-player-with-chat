


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtect_task/business_logic/video_details/video_event.dart';
import 'package:qtect_task/business_logic/video_details/video_state.dart';
import 'package:qtect_task/data/repository/video_repository.dart';

class VideoDetailsBloc extends Bloc<VideoDetailsEvent,VideoDetailsState>{


  VideoDetailsBloc() : super(VideoDetailsPlay()){
    on<VideoDetailsPauseEvent>((event,state) => emit(VideoDetailsPause()));
    on<VideoDetailsPlayEvent>((event,state) => emit(VideoDetailsPlay()));
  }

}