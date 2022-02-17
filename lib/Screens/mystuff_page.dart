import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prime_video_clone/components/settings_row.dart';

class MyStuffPage extends StatefulWidget {
  const MyStuffPage({Key? key}) : super(key: key);

  @override
  _MyStuffPageState createState() => _MyStuffPageState();
}

class _MyStuffPageState extends State<MyStuffPage> {

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.01, 0.08, 0.18, 0.25, 0.3, 1],
            colors: [Color(0xFF0f4e71), Color(0xFF103751), Color(0xFF0e202e), Color(0xFF0f1b27), Color(0xFF0e171e), Color(0xFF0E171E)]
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              SettingsRow(mainText: 'Stream & download', secondaryText: 'Manage quality and Wi-Fi', secondaryTextTrue: true, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'Notifications', secondaryText: 'On', secondaryTextTrue: true, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'Auto Play', secondaryText: 'Play the next episode automatically', secondaryTextTrue: true, toggleButton: true, rowFunction: () {},),
              SettingsRow(mainText: 'Parental Controls', secondaryText: 'Control what you can watch', secondaryTextTrue: true, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'Registered devices', secondaryText: 'See all registered devices', secondaryTextTrue: true, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'Clear video search history', secondaryText: '', secondaryTextTrue: false, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'Signed in as Krishna', secondaryText: 'Sign out of all Amazon apps', secondaryTextTrue: true, toggleButton: false, rowFunction: signOut,),
              SettingsRow(mainText: 'Manage your Prime Video Channels', secondaryText: 'View or change your subscriptions', secondaryTextTrue: true, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'Hidden videos', secondaryText: '', secondaryTextTrue: false, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'Language', secondaryText: 'English', secondaryTextTrue: true, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'Help & Feedback', secondaryText: '', secondaryTextTrue: false, toggleButton: false, rowFunction: () {},),
              SettingsRow(mainText: 'About & Legal', secondaryText: '', secondaryTextTrue: false, toggleButton: false, rowFunction: () {},),
            ],
          ),
        ),
      ),
    );
  }
}
