import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtect_task/business_logic/internet_connectivity/internet_bloc.dart';
import 'package:qtect_task/business_logic/internet_connectivity/internet_state.dart';
import 'package:qtect_task/business_logic/videos/video_bloc.dart';
import 'package:qtect_task/business_logic/videos/video_event.dart';
import 'package:qtect_task/constant/enum.dart';
import 'package:qtect_task/constant/constant.dart';
import 'package:qtect_task/presentation/screen/chat_screen.dart';
import 'package:qtect_task/presentation/screen/home_screen.dart';
import 'package:qtect_task/presentation/widgets/internet_check.dart';


class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
        bottomNavigationBar: Container(
          height: 74,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(226, 232, 240, 1),
          ),
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            onTap: (value){
              // print('==============>>>>>>> :${tabController.index}');
            },
            tabs: const [
              Tab(
                child: ImageIcon(
                  AssetImage("assets/icons/home.png"),
                  color: Color.fromRGBO(56, 152, 252, 1),
                  size: 24,
                ),
              ),
              Tab(
                child: ImageIcon(
                  AssetImage("assets/icons/chat.png"),
                  color: Color.fromRGBO(113, 128, 150, 1),
                  size: 24,
                  semanticLabel: 'Chat',
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: const [
              HomeScreen(),
              ChatScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
