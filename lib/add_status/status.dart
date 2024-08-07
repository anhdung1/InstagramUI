import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/class/video.dart';
// ignore: unused_import
import 'package:video_player_win/video_player_win.dart';
import 'package:flutter_application_1/home/variable.dart';
import 'package:video_player/video_player.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  int preindex = 0;
  FilePickerResult? result;
//  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();

    // if (sourceVideo.isEmpty) {
    //   pickFile();
    // }
  }

  getvideo(String path) async {
    VideoPlayerController controller = VideoPlayerController.file(File(path))
      ..initialize().then((value) => setState(() {}));
    return controller;
  }

  void pickFile() async {
    try {
      setState(() {});
      result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
          allowedExtensions: ['png', 'm4a', 'mp4', 'jpg']);
      if (result != null) {
        for (PlatformFile file in result!.files) {
          sourceVideo.add(SourceVideo(file.path, file.extension));
        }
      }
      for (int i = 0; i < sourceVideo.length; i++) {
        controller.add(VideoPlayerController.file(
            File(sourceVideo[i].pathVideo.toString()))
          ..initialize().then((value) => setState(() {})));
      }
      for (int i = 0; i < sourceVideo.length; i++) {
        if (sourceVideo[i].type == 'mp4' || sourceVideo[i].type == 'm4a') {
          storyVideo.add(StoryVideo(sourceVideo[i].pathVideo.toString(), 0, 0));
        }
      }
      setState(() {});
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Image.asset(
            "assets/images/cancel.png",
            width: 20,
            color: Colors.black,
          ),
          onPressed: () {
            for (var videoController in controller) {
              if (videoController.value.isPlaying) videoController.pause();
            }
            Navigator.pop(context);
          },
        ),
        actions: [
          InkWell(
              onTap: () {},
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              )),
          const Padding(padding: EdgeInsets.only(right: 10))
        ],
        title: const Text(
          "New Posts",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SizedBox(
          child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                pickFile();
              },
              child: const Text(
                "Get File",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch
                      }),
                  child: GridView.builder(
                    itemCount: sourceVideo.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (sourceVideo[index].type == 'png' ||
                          sourceVideo[index].type == 'jpg') {
                        return Image.file(
                            File(sourceVideo[index].pathVideo.toString()));
                      }
                      if (sourceVideo[index].type == 'mp4' ||
                          sourceVideo[index].type == 'm4a') {
                        return InkWell(
                            onTap: () {
                              // controller[index].play();
                              if (preindex != index && preindex >= 0) {
                                controller[preindex].pause();
                                controller[index].play();
                              } else {
                                if (controller[index].value.isPlaying) {
                                  controller[index].pause();
                                } else {
                                  controller[index].play();
                                }
                              }
                              preindex = index;
                            },
                            child: controller.isEmpty
                                ? const SizedBox()
                                : VideoPlayer(controller[index]));
                      }
                      return Container();
                    },
                  ))),
        ],
      )),
    );
  }
}
