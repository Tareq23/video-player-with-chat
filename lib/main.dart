import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtect_task/business_logic/internet_connectivity/internet_bloc.dart';
import 'package:qtect_task/business_logic/video_details/video_bloc.dart';
import 'package:qtect_task/business_logic/videos/video_bloc.dart';
import 'package:qtect_task/constant/constant.dart';
import 'package:qtect_task/presentation/app_router.dart';
import 'package:qtect_task/presentation/pages/home.dart';
import 'package:qtect_task/presentation/pages/video_details.dart';


void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  final AppRouter _appRouter = AppRouter();
  MyApp({super.key, required this.connectivity});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc(connectivity: connectivity),
        ),
        BlocProvider<VideoBloc>(
          create: (context) => VideoBloc(),
        ),
        BlocProvider<VideoDetailsBloc>(
          create: (context) => VideoDetailsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Job Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        // home: VideoDetails(),
      ),
    );
  }
}
