import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/bottombar.dart';
import 'package:flutter_application_1/class/post.dart';
import 'package:flutter_application_1/story/story.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int maxValue = post[0].image.length;
  int myindex = 1;
  int numberPicture = 1;
  final controller = PageController();
  final controller1 = PageController();
  final scrollcontroller = ScrollController();
  final scrollcontroller1 = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          child: InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: Image.asset("assets/images/camera.png"),
          ),
        ),
        title: Container(
          margin: const EdgeInsets.only(top: 8),
          height: 28,
          child: Image.asset("assets/images/instagram.png"),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: Image.asset(
              "assets/images/igtv.png",
              width: 28,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: Image.asset(
                "assets/images/send.png",
                width: 23,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
        ],
      ),
      body: SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 90,
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch
                      }),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: scrollcontroller1,
                    children: [
                      for (int i = 0; i < 10; i++)
                        story("dungluu", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      const Story())));
                        })
                    ],
                  )),
            ),
            Expanded(
              child: PageView.builder(
                physics: const PageScrollPhysics(),
                controller: controller1,
                onPageChanged: (value) {
                  setState(() {
                    myindex = 0;
                    numberPicture = 1;
                    maxValue = post[value].image.length;
                  });
                },
                scrollBehavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch
                    }),
                scrollDirection: Axis.vertical,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    // color: Colors.amber,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      // controller: scrollcontroller,
                      children: [
                        infoPost(post[index].avatar, post[index].name,
                            post[index].country, post[index].city, width),
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width,
                              child: PageView(
                                scrollBehavior: ScrollConfiguration.of(context)
                                    .copyWith(dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch
                                }),
                                controller: controller,
                                onPageChanged: (value) {
                                  setState(() {
                                    myindex = value;
                                    numberPicture = myindex + 1;
                                  });
                                },
                                children: [
                                  for (int i = 0;
                                      i < post[index].image.length;
                                      i++)
                                    bodyPost(
                                      post[index].image[i],
                                    )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              alignment: AlignmentDirectional.center,
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 83, 83, 83),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "$numberPicture/$maxValue",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5)),
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 10)),
                                iconMenu(
                                    ontap: () {},
                                    icon: "assets/images/heart.png"),
                                const Padding(
                                    padding: EdgeInsets.only(left: 13)),
                                iconMenu(
                                    ontap: () {},
                                    icon: "assets/images/chat.png"),
                                const Padding(
                                    padding: EdgeInsets.only(left: 13)),
                                iconMenu(
                                    ontap: () {},
                                    icon: "assets/images/send.png"),
                                const Expanded(child: SizedBox()),
                                const Padding(
                                    padding: EdgeInsets.only(left: 13)),
                                iconMenu(
                                    ontap: () {},
                                    icon: "assets/images/bookmark.png"),
                                const Padding(
                                    padding: EdgeInsets.only(right: 10)),
                              ],
                            ),
                            Container(
                              height: 15,
                              alignment: AlignmentDirectional.bottomCenter,
                              child: SizedBox(
                                height: 6,
                                width: 30,
                                child: ListView.builder(
                                    itemCount: post.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(right: 4),
                                        width: 6,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: myindex == index
                                                ? Colors.purple
                                                : Colors.grey),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                const TextSpan(
                                    text: "Liked by ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                TextSpan(
                                    text: post[0].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black))
                              ])),
                              const Text(
                                "The game in Japan was amazing and i want to share some photos",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottombar(),
    );
  }
}

Widget story(String name, ontap) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    width: 62,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Colors.red)),
            ),
            SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: ontap,
                  child: Image.asset(
                    "assets/images/avatar.jpg",
                    width: 56,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
        )
      ],
    ),
  );
}

infoPost(String avatar, String name, String country, String city, width) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.only(top: 10, left: 10),
    decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
                width: 0.5, color: Color.fromARGB(255, 209, 209, 209)))),
    // color: Colors.amber,
    width: width,
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 0.1, color: const Color.fromARGB(255, 184, 184, 184)),
              borderRadius: BorderRadius.circular(100)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              avatar,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 6)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
            ),
            Text(
              "$city,$country",
              style: const TextStyle(fontSize: 11),
            )
          ],
        ),
        const Spacer(),
        Container(
          width: 30,
          height: 40,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    margin: const EdgeInsets.only(left: 3),
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 81, 81, 81),
                    ),
                  )
              ],
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(right: 4))
      ],
    ),
  );
}

bodyPost(
  String image,
) {
  return Image.asset(
    image,
    fit: BoxFit.cover,
    scale: 1,
  );
}

iconMenu({required ontap, required String icon}) {
  return InkWell(
    onTap: ontap,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Image.asset(
      icon,
      width: 24,
    ),
  );
}
