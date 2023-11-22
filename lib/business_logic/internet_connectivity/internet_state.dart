


import 'package:flutter/foundation.dart';
import 'package:qtect_task/constant/enum.dart';

@immutable
abstract class InternetState{}

class InternetLoadingState extends InternetState{}

class InternetConnected extends InternetState{
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}
