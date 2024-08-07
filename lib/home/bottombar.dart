import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_status/status.dart';
// import 'package:flutter_application_1/add_status/status.dart';
import 'package:flutter_application_1/home/myhome.dart';
import 'package:flutter_application_1/home/variable.dart';
import 'package:flutter_application_1/information/my_information.dart';
import 'package:flutter_application_1/my_love/my_love.dart';
import 'package:flutter_application_1/search/search.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        // elevation: 0,
        shape: const CircularNotchedRectangle(),
        height: 65,
        child: StatefulBuilder(builder: (context, setState) {
          return Row(
            children: [
              bottomiconbutton(() {
                preselection = selection;
                selection = 1;

                if (preselection != selection) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHome()),
                  );
                }
              }, "assets/images/home.png", 1),
              bottomiconbutton(() {
                preselection = selection;
                selection = 2;

                if (preselection != selection) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Search()),
                  );
                }
              }, "assets/images/search.png", 2),
              bottomiconbutton(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddFile()));
              }, "assets/images/more.png", 3),
              bottomiconbutton(() {
                preselection = selection;
                selection = 4;

                if (preselection != selection) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyLove()),
                  );
                }
              }, "assets/images/heart.png", 4),
              Expanded(
                child: IconButton(
                    highlightColor: Colors.white,
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      preselection = selection;
                      selection = 5;

                      if (preselection != selection) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyInformation()),
                        );
                      }
                    },
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/avatar.png",
                        width: 24,
                        height: 24,
                      ),
                    )),
              )
            ],
          );
        }));
  }

  bottomiconbutton(onPressed, asset, color) {
    return Expanded(
      child: IconButton(
          highlightColor: Colors.white,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onPressed,
          icon: Image.asset(
            asset,
            color: selection == color
                ? Colors.black
                : const Color.fromRGBO(112, 123, 129, 1),
            width: 24,
            height: 24,
          )),
    );
  }
}
