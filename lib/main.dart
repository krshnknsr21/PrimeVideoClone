import 'package:flutter/material.dart';

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
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
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
        ),
        body: DefaultTabController(
          length: choices.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Prime Video'),
              centerTitle: true,
              bottom: TabBar(
                isScrollable: false,
                tabs: choices.map<Widget>((Choice choice) {
                  return Tab(
                    text: choice.title,
                  );
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: choices.map((Choice choice) {
                return ChoicePage(
                  choice: choice,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  const Choice({required this.title});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Home'),
  Choice(title: 'TV Shows'),
  Choice(title: 'Movies'),
  Choice(title: 'Kids'),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          SizedBox(
            height: 160.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Image.asset('assets/r1c1.jpg'),
                Image.asset('assets/r2c4.jpg'),
                Image.asset('assets/r1c3.jpg'),
                Image.asset('assets/r1c4.jpg'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.blueGrey[900],
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Continue watching',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.2,
                        color: Colors.white,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Image.asset('assets/r1c1.jpg')
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Image.asset('assets/r1c2.jpg'),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Image.asset('assets/r1c3.jpg'),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Image.asset('assets/r1c4.jpg'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.blueGrey[900],
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Binge-worthy TV',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.2,
                        color: Colors.white,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Image.asset('assets/r2c1.jpg')
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Image.asset('assets/r2c2.jpg'),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Image.asset('assets/r2c3.jpg'),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Image.asset('assets/r2c4.jpg'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.blueGrey[900],
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top-rated TV shows on IMDb',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.2,
                        color: Colors.white,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Image.asset('assets/r1c1.jpg')
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Image.asset('assets/r1c2.jpg'),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Image.asset('assets/r1c3.jpg'),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Image.asset('assets/r1c4.jpg'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      ]
    );
  }
}
