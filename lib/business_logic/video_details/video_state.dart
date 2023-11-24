


import 'package:flutter/foundation.dart';
import 'package:qtect_task/data/model/video.dart';

@immutable
abstract class VideoDetailsState{}

class VideoDetailsPlay extends VideoDetailsState{}

class VideoDetailsPause extends VideoDetailsState{
}
