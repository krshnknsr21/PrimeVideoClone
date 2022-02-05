import 'package:flutter/material.dart';

import 'package:prime_video_clone/Screens/loading_page.dart';
import 'package:prime_video_clone/Screens/login_page.dart';
import 'package:prime_video_clone/Screens/sign_up_page.dart';
import 'package:prime_video_clone/Screens/tab_controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/loading': (context) => const LoadingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const Signup(),
        '/home': (context) => const BottomTabController(),
      },
      title: 'Amazon Prime Video',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}
