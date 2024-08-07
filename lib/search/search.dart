import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/bottombar.dart';
import 'package:flutter_application_1/home/variable.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController controller = TextEditingController();
  final ScrollController controller1 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(128, 128, 128, 0.12)),
                height: 36,
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 175, 175, 175),
                          fontWeight: FontWeight.w400,
                          height: -0.00),
                      icon: Image.asset(
                        "assets/images/search.png",
                        width: 16,
                        color: const Color.fromARGB(255, 175, 175, 175),
                      ),
                      contentPadding: const EdgeInsets.only(bottom: 10),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              )),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/images/buttonfind.png", width: 24),
              ),
              const Padding(padding: EdgeInsets.only(right: 10))
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
          Expanded(
            child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch
                    }),
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: controller1,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < historyFind.length; i++)
                      recentFind(name: historyFind[i], ontap: () {})
                  ],
                )),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5)),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 168,
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

  recentFind({required String name, required ontap}) {
    return Container(
        height: 32,
        margin: const EdgeInsets.only(left: 10),
        child: InkWell(
          onTap: ontap,
          child: Container(
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(60, 60, 60, 0.18)),
                borderRadius: BorderRadius.circular(5)),
            height: 20,
            child: Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
            ),
          ),
        ));
  }
}
