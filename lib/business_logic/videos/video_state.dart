


import 'package:flutter/foundation.dart';
import 'package:qtect_task/data/model/video.dart';

@immutable
abstract class VideoListState{}

class VideoListLoading extends VideoListState{}

class VideoListLoaded extends VideoListState{
  final List<Video> videos;
  VideoListLoaded(this.videos);
}

class VideoListError extends VideoListState{
  final String error;
  VideoListError(this.error);
}