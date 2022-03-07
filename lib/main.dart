// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:prime_video_clone/Screens/login_page.dart';
import 'package:prime_video_clone/Screens/sign_up_page.dart';
import 'package:prime_video_clone/Screens/tab_controller.dart';
import 'package:prime_video_clone/models/user.dart';
import 'package:prime_video_clone/services/auth.dart';
import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PrimeVideoUser(),
        ),
        ChangeNotifierProvider(
          create: (_) => Authenticate(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => StreamBuilder <User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong!!'),
                );
              } else if (snapshot.hasData) {
                Provider.of<PrimeVideoUser>(context).setUID();
                return const BottomTabController();
              } else if (snapshot.hasError){
                return const Center(child: Text('Something went wrong!!'),);
              } else {
                if (kDebugMode) {
                  print('not logged in!!!');
                }
                return const LoginPage();
              }
            }
        ),
        '/signup': (context) => StreamBuilder <User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong!!'),
                );
              } else if (snapshot.hasData) {
                return const BottomTabController();
              } else if (snapshot.hasError){
                return const Center(child: Text('Something went wrong!!'),);
              } else {
                if (kDebugMode) {
                  print('not logged in!!!');
                }
                return const SignupPage();
              }
            }
        ),
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}
