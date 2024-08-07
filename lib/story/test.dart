import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.file(File("assets/images/girl.mp4"))
    //   ..initialize().then((value) {
    //     setState(() {
    //       controller.play();
    //     });
    //   });
    x();
  }

  x() {
    controller = VideoPlayerController.file(File("assets/images/girl.mp4"))
      ..initialize().then((value) => setState(() {}));
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                controller.play();
              });
            },
            child: Text("onclick")),
        VideoPlayer(controller),
      ],
    );
  }
}
