import 'dart:io';

import 'package:video_player/video_player.dart';

int selection = 1;
int preselection = 1;
List<String> historyFind = [
  "IGTV",
  "Shop",
  "Style",
  "Sports",
  "Auto",
  "New",
  "New",
  "New",
  "New",
  "New"
];
List<String> image = [
  "assets/images/avatar.png",
  "assets/images/avatar.png",
  "assets/images/avatar.png",
  "assets/images/avatar.png",
  "assets/images/avatar.png",
  "assets/images/avatar.png",
  "assets/images/avatar.png",
  "assets/images/avatar.png"
];
List<String> pathImage = [];
File? file;
List<String> pathvideo = [];
List<String> type = [];

class SourceVideo {
  String? pathVideo;
  String? type;
  SourceVideo(this.pathVideo, this.type);
}

List<VideoPlayerController> controller = [];
List<SourceVideo> sourceVideo = [];
