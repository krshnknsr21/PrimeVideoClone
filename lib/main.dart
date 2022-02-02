import 'package:flutter/material.dart';
// import 'package:prime_video_clone/Screens/homePage.dart';
import 'package:prime_video_clone/Screens/signUpPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazon Prime Video',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'SourceSansPro',
        ),
        // home: const HomePage(),
        home: const Signup(),
    );
  }
}
