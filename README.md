

### At first add necessary dependencies

```yaml
  http: ^0.13.5
  flutter_bloc: ^8.1.3
  connectivity_plus: ^5.0.2
  video_player: ^2.2.15
  timeago: ^3.6.0
```

 #### Dependencies used for
   * `http` used for API integration
       * ```dart
         String apiEndPoint = 'https://test-ximit.mahfil.net/api/trending-video/1?page=1';

          Future<Object> getVideoRaw() async{
            final response = await http.get(Uri.parse(apiEndPoint));
            return jsonDecode(response.body);
          }
         ```
   * `flutter_bloc` It's used for state management and also follow bloc design pattern
       * At first from presentation layer hit on event `context.read<VideoBloc>().add(widget.event);` then within bloc perform some business logic for find data with data layer from data source and after then change state.
          ```dart
          on<VideoListEvent>((event,state) async {
            emit(VideoListLoading());
            try{
              final videos = await videoRepository.getVideoList();
              emit(VideoListLoaded(videos));
            }catch (e){
              emit(VideoListError('Something went to wrong'));
            }
          });
          ```
  * `connectivity_plus` used for check internet connection with `StreamSubscription` using bloc
     ```dart
       connectivityStreamSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
          if(result == ConnectivityResult.wifi){
            emit(InternetConnected(connectionType: ConnectionType.Wifi));
          }
          else if(result == ConnectivityResult.mobile){
            emit(InternetConnected(connectionType: ConnectionType.Mobile));
          }
          else if(result == ConnectivityResult.none){
            emit(InternetConnected(connectionType: ConnectionType.None));
          }
       });
     ```
* `video_player` used for play video from internet
   ```dart
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
   ```
   ```dart
     FutureBuilder(
        future: videoInitializer,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          }
          else{
            return Image.network(widget.thumbnailUrl,width: double.infinity,height: double.infinity,fit: BoxFit.fill,);
          }
        },
      )
   ```

* `timeago` used for how many months or days or any times ago video was plublished
   ```dart
   timeago.format(video.createdAt!, locale: 'bn')
   ```

      


<div style="float:left;margin:0 10px 10px 0" markdown="1">
  <img style="margin:0 50px 0 0" width="100" height="220" src="https://github.com/Tareq23/video-player-with-chat/blob/main/ui/video_list.png">
  <img style="margin:0 50px 0 0" width="100" height="220" src="https://github.com/Tareq23/video-player-with-chat/blob/main/ui/video_details_thumbnail.png">
  <img style="margin:0 50px 0 0" width="100" height="220" src="https://github.com/Tareq23/video-player-with-chat/blob/main/ui/video_details_play.png">
</div>
