

import 'package:flutter/foundation.dart';

@immutable
abstract class InternetEvent{}

class InternetLoadingEvent extends InternetEvent{}

class InternetConnectedEvent extends InternetEvent{}

class InternetDisconnectedEvent extends InternetEvent{}