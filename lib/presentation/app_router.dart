


import 'package:flutter/material.dart';
import 'package:qtect_task/data/model/video.dart';
import 'package:qtect_task/presentation/pages/home.dart';
import 'package:qtect_task/presentation/pages/video_details.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );

      case '/video-details':
        return MaterialPageRoute(
          builder: (_) => VideoDetails(video: routeSettings.arguments as Video),
        );

      default:
        null;
    }
    return null;
  }


}