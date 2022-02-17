import 'package:flutter/material.dart';
import 'package:prime_video_clone/Screens/login_page.dart';
import 'package:prime_video_clone/Screens/sign_up_page.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool loginTrue = true;

  @override
  Widget build(BuildContext context) {
    if(loginTrue) {
      return const LoginPage();
    } else {
      return const SignupPage();
    }
  }
}
