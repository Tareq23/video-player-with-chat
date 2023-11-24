import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtect_task/business_logic/videos/video_bloc.dart';
import 'package:qtect_task/business_logic/videos/video_event.dart';
import 'package:qtect_task/constant/constant.dart';

class TryAgain extends StatefulWidget {
  final event;
  const TryAgain({Key? key, required this.event})
      : super(key: key);

  @override
  State<TryAgain> createState() => _TryAgainState();
}

class _TryAgainState extends State<TryAgain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height! * 0.5,
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Something went to wrong',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              if(widget.event is VideoListLoadingEvent){
                context.read<VideoBloc>().add(widget.event);
              }
            },
            child: const Text(
              'Please try again',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
