import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/post.dart';
import 'package:flutter_application_1/class/video.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:video_player/video_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class Story extends StatefulWidget {
  const Story({super.key});
  @override
  State<Story> createState() => _StoryState();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class _StoryState extends State<Story> {
  late VideoPlayerController _controller;
  // late List<VideoPlayerController> _videoController;
  final PageController _pageController = PageController();
  int mid = 0;

  @override
  void initState() {
    super.initState();

    set();
  }

  void set() {
    for (int i = 0; i < storyVideo.length; i++) {
      if (mid == i) {
        _controller =
            VideoPlayerController.file(File(storyVideo[mid].sourceVideo))
              ..initialize().then((value) => setState(() {
                    _controller.play();
                  }));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // alignment: AlignmentDirectional.topCenter,
        padding: const EdgeInsets.only(
          top: 60,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        // child: ScrollConfiguration(
        //   behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        //     PointerDeviceKind.mouse,
        //     PointerDeviceKind.touch
        //   }),
        child: PageView.builder(
            scrollBehavior: MyCustomScrollBehavior(),
            controller: _pageController,
            dragStartBehavior: DragStartBehavior.down,
            // reverse: ,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                mid = value;
                _controller.dispose();
                set();
              });
            },
            itemCount: storyVideo.length,
            itemBuilder: (buildContext, index) {
              return story(_controller);
            }),
      ),
    );
  }

  story(VideoPlayerController controller) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Column(
        children: [
          Expanded(
              child: Stack(
            // alignment: AlignmentDirectional.bottomCenter,
            children: [
              Stack(
                // alignment: AlignmentDirectional.bottomStart,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        child: VideoPlayer(controller),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            "31231 views",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 20)),
                          Text(
                            "312 comments",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15)),
                      Row(children: [
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        iconButton(
                            image: "assets/images/heart.png", ontap: () {}),
                        const Padding(padding: EdgeInsets.only(right: 15)),
                        iconButton(
                            image: "assets/images/chat.png", ontap: () {}),
                        const Padding(padding: EdgeInsets.only(right: 15)),
                        iconButton(
                            image: "assets/images/send.png", ontap: () {}),
                        const Padding(padding: EdgeInsets.only(right: 15)),
                        iconButton(
                            image: "assets/images/3cham.png", ontap: () {}),
                        const Expanded(child: SizedBox()),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 87,
                          height: 31,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(width: 0.7, color: Colors.white)),
                          child: InkWell(
                            onTap: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  weight: 13,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Up Next",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Padding(padding: EdgeInsets.only(right: 2))
                              ],
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 15)),
                      ]),
                      const Padding(padding: EdgeInsets.only(bottom: 15)),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(padding: EdgeInsets.only(right: 20)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: Image.asset(
                          "assets/images/imageDownload.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          post[0].name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "September 13",
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        )
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: InkWell(
                        onTap: () {
                          controller.dispose();
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/images/cancel.png",
                          width: 18,
                          color: const Color.fromARGB(255, 234, 234, 234),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 25)),
                  ],
                ),
              ),
            ],
          )),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) {
                // var duration = Duration(
                //     milliseconds: controller
                //         .value.position.inMilliseconds
                //         .round());

                var duration_1 = Duration(
                    milliseconds:
                        controller.value.duration.inMilliseconds.round());
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    // Text(
                    //     style: TextStyle(color: Colors.white),
                    //     "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}/${duration_1.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration_1.inSeconds.remainder(60).toString().padLeft(2, '0')}"),
                    InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          controller.value.isPlaying
                              ? controller.pause()
                              : controller.play();
                        });
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    Expanded(
                        child: ProgressBar(
                            timeLabelTextStyle:
                                const TextStyle(color: Colors.white),
                            timeLabelLocation: TimeLabelLocation.none,
                            thumbRadius: 6,
                            thumbGlowColor: Colors.transparent,
                            thumbColor: Colors.white,
                            progress: value.position,
                            progressBarColor: Colors.white,
                            onSeek: (duration) {
                              controller.seekTo(duration);
                            },
                            onDragUpdate: (details) {
                              setState(() {
                                controller.seekTo(details.timeStamp);
                              });
                            },
                            onDragStart: (details) {
                              details.timeStamp;
                            },
                            onDragEnd: () {},
                            total: controller.value.duration)),
                    // Text(
                    //   "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                    //   style: const TextStyle(color: Colors.white),
                    // ),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    Text(
                      "${duration_1.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration_1.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                  ],
                );
              })
        ],
      ),
    );
  }

  imageStory(pathImage) {
    return Column(
      children: [
        Expanded(
            child: Stack(
          // alignment: AlignmentDirectional.bottomCenter,
          children: [
            Stack(
              // alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      child: Image.asset(
                        pathImage,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("error");
                        },
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Text(
                          "31231 views",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20)),
                        Text(
                          "312 comments",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    Row(children: [
                      const Padding(padding: EdgeInsets.only(left: 20)),
                      iconButton(
                          image: "assets/images/heart.png", ontap: () {}),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      iconButton(image: "assets/images/chat.png", ontap: () {}),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      iconButton(image: "assets/images/send.png", ontap: () {}),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      iconButton(
                          image: "assets/images/3cham.png", ontap: () {}),
                      const Expanded(child: SizedBox()),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 87,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border:
                                Border.all(width: 0.7, color: Colors.white)),
                        child: InkWell(
                          onTap: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up,
                                weight: 13,
                                color: Colors.white,
                              ),
                              Text(
                                "Up Next",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              Padding(padding: EdgeInsets.only(right: 2))
                            ],
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                    ]),
                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(padding: EdgeInsets.only(right: 20)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Image.asset(
                        "assets/images/imageDownload.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        post[0].name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "September 13",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      )
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/cancel.png",
                        width: 18,
                        color: const Color.fromARGB(255, 234, 234, 234),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 25)),
                ],
              ),
            ),
          ],
        )),
        const Padding(padding: EdgeInsets.only(bottom: 15)),
      ],
    );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}
