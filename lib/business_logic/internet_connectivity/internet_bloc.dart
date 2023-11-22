


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


import 'package:qtect_task/business_logic/internet_connectivity/internet_event.dart';
import 'package:qtect_task/business_logic/internet_connectivity/internet_state.dart';

import '../../constant/enum.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>
{
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;
  InternetBloc({required this.connectivity}) : super(InternetLoadingState()){
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
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
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}