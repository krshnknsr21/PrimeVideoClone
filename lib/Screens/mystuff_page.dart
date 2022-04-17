import 'package:flutter/material.dart';
import 'package:prime_video_clone/components/background.dart';
import 'package:prime_video_clone/components/settings_row.dart';
import 'package:prime_video_clone/models/user.dart';
import 'package:prime_video_clone/services/auth.dart';
import 'package:provider/provider.dart';

class MyStuffPage extends StatefulWidget {
  const MyStuffPage({Key? key}) : super(key: key);

  @override
  _MyStuffPageState createState() => _MyStuffPageState();
}

class _MyStuffPageState extends State<MyStuffPage> {
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      content: Scaffold(
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
              InkWell(
                onTap: () {
                  Provider.of<Authenticate>(context, listen: false).signOut();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: (20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Signed in as ${Provider.of<PrimeVideoUser>(context).getUsername}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Sign out of all Amazon apps",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 3,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
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
