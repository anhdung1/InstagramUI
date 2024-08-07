import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import 'package:flutter_application_1/class/post.dart';
import 'package:flutter_application_1/home/bottombar.dart';

class MyInformation extends StatefulWidget {
  const MyInformation({super.key});

  @override
  State<MyInformation> createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  bool select = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/lock.png",
              width: 9,
            ),
            Text(
              " ${post[0].name}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.only(right: 15)),
          ],
        ),
        centerTitle: true,
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const Icon(
              Icons.menu_rounded,
              weight: 17.5,
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 10))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(padding: EdgeInsets.only(left: 15)),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                  SizedBox(
                    width: 84,
                    height: 84,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        child: Image.asset(
                          "assets/images/hutao.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  info("54", "Posts"),
                  // const Padding(padding: EdgeInsets.only(right: 30)),
                  info("834", "Followers"),
                  // const Padding(padding: EdgeInsets.only(right: 15)),
                  info("162", "Followina")
                ],
              ))
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HuTao",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                ),
                Text("My name is Dung",
                    style: TextStyle(fontSize: 12, height: 1)),
                Text("Never give up",
                    style: TextStyle(
                      fontSize: 12,
                    ))
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {},
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: MediaQuery.of(context).size.width - 20,
                    height: 29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(250, 250, 250, 1),
                        border: Border.all(
                            width: 0.5,
                            color: const Color.fromARGB(255, 221, 221, 221))),
                    child: const Text(
                      "Edit Profile",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                  ))),
          const Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(
            // padding: const EdgeInsets.only(bottom: 10),
            height: 183,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch
              }),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: post.length,
                  itemBuilder: (buildContext, index) {
                    return newButtonFriend(post[index].name, () {});
                  }),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Container(
            height: 0.3,
            color: const Color.fromARGB(255, 212, 212, 212),
          ),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    select = true;
                  });
                },
                child: Container(
                    height: 40,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                width: 1,
                                color: select == true
                                    ? Colors.black
                                    : const Color.fromARGB(
                                        255, 210, 210, 210)))),
                    child: Image.asset(
                      "assets/images/sheet.png",
                      color: select == true
                          ? Colors.black
                          : const Color.fromARGB(255, 210, 210, 210),
                      width: 18,
                    )),
              )),
              Expanded(
                  child: InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    select = false;
                  });
                },
                child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 40,
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                width: 1,
                                color: select == true
                                    ? const Color.fromARGB(255, 210, 210, 210)
                                    : Colors.black))),
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: select == false
                          ? const Color.fromARGB(255, 82, 82, 82)
                          : const Color.fromARGB(255, 210, 210, 210),
                      size: 25,
                    )),
              )),
            ],
          ),
          Expanded(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height - 168 - 223,
            child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch
                    }),
                child: GridView.builder(
                    itemCount: 30,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (buildContext, value) {
                      return Image.asset(
                        "assets/images/imageDownload.png",
                        fit: BoxFit.cover,
                      );
                    })),
          )
        ],
      ),
      bottomNavigationBar: const Bottombar(),
    );
  }

  newButtonFriend(String name, ontap) {
    return Container(
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(
                width: 0.1, color: const Color.fromARGB(255, 73, 73, 73)),
            // color: Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.only(left: 15),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(88),
                              border: Border.all(
                                  width: 0.2,
                                  color: const Color.fromARGB(
                                      255, 184, 184, 184))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/hutao.png",
                                fit: BoxFit.cover,
                                width: 85,
                              ),
                            ),
                          ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Text(
                    "Có David theo dõi",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 125, 125, 125)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 25,
                        alignment: AlignmentDirectional.topCenter,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 140, 255),
                            borderRadius: BorderRadius.circular(7)),
                        child: const Text(
                          "Theo dõi",
                          style: TextStyle(
                              fontSize: 12, color: Colors.white, height: 2),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topEnd,
              margin: const EdgeInsets.only(right: 8, top: 8),
              child: InkWell(
                onTap: ontap,
                child: Image.asset(
                  "assets/images/cancel.png",
                  width: 10,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ));
  }

  info(String number, String name) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(name,
            style: const TextStyle(
              fontSize: 13,
            ))
      ],
    );
  }
}
