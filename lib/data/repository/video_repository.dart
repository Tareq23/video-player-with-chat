



import 'package:qtect_task/data/provider/video_api.dart';
import 'package:qtect_task/data/model/video.dart';

class VideoRepository{

  final VideoAPI _videoAPI = VideoAPI();

  Future<List<Video>> getVideoList() async{
    var result = await _videoAPI.getVideoRaw() as Map<String, dynamic>;
    var videos = result['results'] as List;
    return videos.map((e) => Video.fromJson(e)).toList();
  }

}