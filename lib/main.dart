import 'package:flutter/material.dart';
// import 'package:flutter_application_1/add_status/status.dart'
import 'package:flutter_application_1/home/myhome.dart';
// import 'package:flutter_application_1/story/test.dart';
// import 'package:flutter_application_1/information/my_information.dart';
// import 'package:flutter_application_1/story/story.dart';
// import 'package:flutter_application_1/my_love/my_love.dart';

// import 'package:flutter_application_1/search/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHome(),
    );
  }
}
