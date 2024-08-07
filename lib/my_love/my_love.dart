import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/post.dart';
import 'package:flutter_application_1/home/bottombar.dart';

class MyLove extends StatefulWidget {
  const MyLove({super.key});

  @override
  State<MyLove> createState() => _MyLoveState();
}

class _MyLoveState extends State<MyLove> {
  bool select = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  height: 50,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                              width: 1,
                              color: select == true
                                  ? Colors.black
                                  : const Color.fromARGB(255, 210, 210, 210)))),
                  child: Text(
                    "Following",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: select == true
                            ? Colors.black
                            : const Color.fromARGB(255, 164, 164, 164)),
                  ),
                ),
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
                  height: 50,
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                              width: 1,
                              color: select == true
                                  ? const Color.fromARGB(255, 210, 210, 210)
                                  : Colors.black))),
                  child: Text(
                    "You",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: select == false
                            ? Colors.black
                            : const Color.fromARGB(255, 164, 164, 164)),
                  ),
                ),
              ))
            ],
          ),
          // select = false ? you() : you()
          // select == false ? Expanded(child: you()) : Container()
          // Expanded(
          //   child: you("New"),
          // ),
          // Expanded(
          //   child: you("To day"),
          // ),
          // Expanded(
          //   child: you("This Week"),
          // )
          Expanded(
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch
                      }),
                  child: ListView(
                    children: [
                      you("New"),
                      you("New"),
                      you("New"),
                      you("New"),
                      you("New")
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: const Bottombar(),
    );
  }

  you(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 0.5, color: Color.fromARGB(255, 208, 208, 208)))),
        ),
        Container(
          margin: const EdgeInsets.only(left: 11),
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        for (int i = 0; i < post.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(left: 10)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: SizedBox(
                    width: 44,
                    height: 44,
                    child: Image.asset(
                      post[i].avatar,
                      fit: BoxFit.cover,
                      width: 44,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 10)),
                Expanded(
                  child: Text("${post[i].name} liked your photo "),
                ),
                Image.asset(
                  post[i].avatar,
                  width: 44,
                ),
                const Padding(padding: EdgeInsets.only(right: 10)),
              ],
            ),
          ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 0.5, color: Color.fromARGB(255, 208, 208, 208)))),
        ),
      ],
    );
  }
}
