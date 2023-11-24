

import 'package:flutter/foundation.dart';

@immutable
abstract class VideoDetailsEvent{}

class VideoDetailsPlayEvent extends VideoDetailsEvent{
}

class VideoDetailsPauseEvent extends VideoDetailsEvent{
}