import 'package:flutter/material.dart';
import 'package:prime_video_clone/Screens/home_page.dart';
import 'package:prime_video_clone/Screens/channels_page.dart';
import 'package:prime_video_clone/Screens/find_page.dart';
import 'package:prime_video_clone/Screens/downloads_page.dart';
import 'package:prime_video_clone/Screens/mystuff_page.dart';

class BottomTabController extends StatefulWidget {
  const BottomTabController({Key? key}) : super(key: key);

  @override
  _BottomTabControllerState createState() => _BottomTabControllerState();
}

class _BottomTabControllerState extends State<BottomTabController> {
  int selectedIndex = 4;

  final tabs = const [
    HomePage(),
    ChannelsPage(),
    FindPage(),
    DownloadsPage(),
    MyStuffPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1A9FC6),
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: 'Channels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_outlined),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'My Stuff',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: tabs[selectedIndex],
    );
  }
}
